import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/constant_values.dart';

class DetailState with ChangeNotifier {
  DetailState(this._selectedDate);

  final IActivitiesRepository _activitiesRepository = locator<IActivitiesRepository>();
  final IReportsRepository _reportsRepository = locator<IReportsRepository>();
  static final IUserRepository _userRepository = locator<IUserRepository>();

  /// ChangeNotifierProxyProvider update
  Future<void> update(CalendarDay selected) async {
    final bool hasToUpdateMonthReport =
        _selectedDate.month != selected.month || _selectedDate.year != selected.year;
    // when user select next or previews month - day will be set to 1.
    if (_selectedDate != selected) {
      _selectedDate = selected;
      notifyListeners();
    }
    if (hasToUpdateMonthReport) {
      await buildSelectedMonthReport();
    }
  }

  final _watchForADayController = StreamController<UnmodifiableListView<Activity>>.broadcast();

  CalendarDay _selectedDate;

  CalendarDay get selectedDate => _selectedDate;

  static final DateTime _currentDate = DateTime.now();

  static const List<String> _tabs = ['Activity', 'Report'];

  List<String> get tabs => _tabs;

  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void onTabIndexChange(int index) {
    if (_tabIndex != index) {
      _tabIndex = index;
      notifyListeners();
    }
  }

  // ACTIVITY TAB:

  Stream<UnmodifiableListView<Activity>> watchDayActivities() async* {
    yield UnmodifiableListView<Activity>(await _getActivitiesForADay());
    yield* _watchForADayController.stream;
  }

  Future<void> refreshForADayActivities() async {
    _watchForADayController.add(UnmodifiableListView<Activity>(await _getActivitiesForADay()));
  }

  Future<List<Activity>> _getActivitiesForADay() async {
    List<Activity> items = await _activitiesRepository.getForADay(
        _selectedDate.year, _selectedDate.month, _selectedDate.day);
    await Future.delayed(const Duration(milliseconds: 400));
    return items;
  }

  Future<int> deleteActivity(int id) async {
    return await _activitiesRepository.delete(id);
  }

  // REPORT TAB

  Report _monthlyReport = ConstantValues.emptyReport;

  Report get monthlyReport => _monthlyReport;

  final StreamController<Report> reportController = StreamController<Report>.broadcast();

  /// The value has to be +1 or -1
  void onBibleStudiesChange(int value) {
    final int current = _monthlyReport.bibleStudies;
    final int nextValue = current + value;
    if (nextValue < 0) return;
    if (nextValue < 1) {
      _monthlyReport = _monthlyReport.copyWith(bibleStudies: 0);
    } else {
      _monthlyReport = _monthlyReport.copyWith(bibleStudies: nextValue);
    }
    reportController.sink.add(_monthlyReport);
    notifyListeners();
    if (_userRepository.user.preferences.bibleStudies != _monthlyReport.bibleStudies) {
      _userRepository.update(_userRepository.user.copyWith(
          preferences: _userRepository.user.preferences
              .copyWith(bibleStudies: _monthlyReport.bibleStudies)));
    }
  }

  void onMonthReportRemarksChange(String? value) {
    _monthlyReport = _monthlyReport.copyWith(remarks: value ?? '');
    reportController.sink.add(_monthlyReport);
    notifyListeners();
  }

  Stream<Report> watchReport() async* {
    await Future.delayed(const Duration(seconds: 1));
    await buildSelectedMonthReport();
    yield _monthlyReport;
    yield* reportController.stream;
  }

  // this function has to return value and add value to the stream!
  // returned Report is not closed! Until it is not closed it wont be stored into DB.
  Future<void> buildSelectedMonthReport() async {
    final Report? savedClosedReport = await _getClosedReport();

    if (savedClosedReport != null) {
      // selected month already has a closed monthly report. No need to make a new one!
      // closed reports cant be open again.
      reportController.sink.add(_monthlyReport = savedClosedReport);
      notifyListeners();
      // return savedClosedReport;
      return;
    }
    // for selected month there is no report stored into DB - need to make it:

    final List<Activity> activities = await _getActivitiesForAMonth();
    if (activities.isNotEmpty) {
      // there are activities for that month - make a report

      // select activities with LDC hours:
      final List<Activity> ldcActivities = activities.where((a) => a.type == ActivityType.ldc).toList();

      if (ldcActivities.isEmpty) {
        final Report reportNoLDC = await _buildReportNoLDCActivities(activities);
        reportController.sink.add(_monthlyReport = reportNoLDC);
        notifyListeners();
        return;
        //return reportNoLDC;
      } else {
        final Report reportWithLDC = await _buildReportWithLDCActivities(activities);
        reportController.sink.add(_monthlyReport = reportWithLDC);
        notifyListeners();
        return;
        // return reportWithLDC;
      }
    }
    // no activities for a given month, return empty Report
    final Report empty = ConstantValues.emptyReport.copyWith(
        month: _selectedDate.month,
        serviceYear: _selectedDate.serviceYear,
        year: _selectedDate.year,
        remarks: 'You have no activities this month.');
    reportController.sink.add(_monthlyReport = empty);
    notifyListeners();
    // return empty;
  }

  Future<Report> _buildReportNoLDCActivities(List<Activity> activities) async {
    int placementsTemp = 0, videosTemp = 0, returnVisitsTemp = 0;
    String remarksTemp = '';
    Duration durationTemp = const Duration();
    for (Activity a in activities) {
      durationTemp += Duration(hours: a.hours, minutes: a.minutes);
      placementsTemp += a.placements;
      videosTemp += a.videos;
      returnVisitsTemp += a.returnVisits;
      if (a.remarks.isNotEmpty) {
        remarksTemp = '$remarksTemp${a.remarks}. ';
      }
    }
    final Report created = Report(
      createdAt: _currentDate,
      lastModified: _currentDate,
      // Report Repository will manage lastModified itself.
      month: _selectedDate.month,
      serviceYear: _selectedDate.serviceYear,
      year: _selectedDate.year,
      hours: durationTemp.inHours,
      minutes: durationTemp.inMinutes.remainder(60),
      bibleStudies: _userRepository.user.preferences.bibleStudies,
      placements: placementsTemp,
      videos: videosTemp,
      returnVisits: returnVisitsTemp,
      remarks: remarksTemp,
      uid: _userRepository.user.uid,
    );
    return created;
  }

  Future<Report> _buildReportWithLDCActivities(List<Activity> all) async {
    // activities contains also the LDC hours. This hours need to be separated, and
    // will be collected in report.hoursLDC and minutes.LDC. Need to count only hours and minutes.
    // Subtract them from the total number of hours.
    Duration ldsDuration = const Duration();

    // all activities:
    Duration noLdcDuration = const Duration();
    int placementsTemp = 0, videosTemp = 0, returnVisitsTemp = 0;
    String remarksTemp = '';

    for (Activity a in all) {
      // Separate (subtract) ldc hours.
      if (a.type == ActivityType.ldc) {
        ldsDuration += Duration(hours: a.hours, minutes: a.minutes);
      } else {
        noLdcDuration += Duration(hours: a.hours, minutes: a.minutes);
      }
      if (a.remarks.isNotEmpty) remarksTemp = '$remarksTemp${a.remarks}. ';
      placementsTemp += a.placements;
      videosTemp += a.videos;
      returnVisitsTemp += a.returnVisits;
    }

    final String reportRemarks =
        'LDC time: ${ldsDuration.hoursAndMinutesString()}.\nRemarks: $remarksTemp';

    final Report created = Report(
      createdAt: _currentDate,
      lastModified: _currentDate,
      month: _selectedDate.month,
      serviceYear: _selectedDate.serviceYear,
      year: _selectedDate.year,
      hours: noLdcDuration.inHours,
      minutes: noLdcDuration.inMinutes.remainder(60),
      bibleStudies: _userRepository.user.preferences.bibleStudies,
      placements: placementsTemp,
      videos: videosTemp,
      returnVisits: returnVisitsTemp,
      remarks: reportRemarks,
      hoursLDC: ldsDuration.inHours,
      minutesLDC: ldsDuration.inMinutes.remainder(60),
      uid: _userRepository.user.uid,
    );

    return created;
  }

  // only full hours in the report
  FutureOr<Report> _transferMinutesToTheNextMonth(Report r) async {
    var rHours = r.hours;
    var rMinutes = r.minutes;
    // time is 0:15 or 12:00
    if (rHours < 1 || rMinutes == 0) return r;
    // create activity for next month with minutes from this month
    // have to specify a month, year and service year for the new activity
    final rMonth = r.month;
    final rYear = r.year;
    var aMonth = rMonth == 12 ? 1 : rMonth + 1;
    var aYear = rMonth == 12 ? rYear + 1 : rYear;
    var aServiceYear = r.serviceYear;
    // if current month is 8 august, next month is new service year [2023/2024 -> 2024/2025]
    if (rMonth == 8) {
      var rServiceYears = r.serviceYear.split('/');
      var first = int.tryParse(rServiceYears[0]);
      var second = int.tryParse(rServiceYears[1]);
      final int firstNn = first ?? (rMonth != 8 ? rYear : rYear + 1);
      final int secondNn = second ?? (rMonth != 8 ? rYear : rYear + 2);
      aServiceYear = '$firstNn/$secondNn';
    }
    final nextMonthActivity = Activity(
      createdAt: _currentDate,
      day: 1,
      lastModified: _currentDate,
      month: aMonth,
      serviceYear: aServiceYear,
      year: aYear,
      minutes: rMinutes,
      remarks: '$rMonth/$rYear', // Transferred from 4/2023
      type: ActivityType.transferred,
      uid: _userRepository.user.uid,
    );
    // save transferred minutes activity
    final id = await _activitiesRepository.create(nextMonthActivity);
    return r.copyWith(
        transferredMinutes: rMinutes,
        transferredMinutesActivityId: id,
        minutes: 0,
        remarks: 'Transferred: $rMinutes min. ${r.remarks}');
  }

  Future<Report?> _getClosedReport() async {
    return _reportsRepository.readClosedForAMonth(_selectedDate.year, _selectedDate.month);
  }

  Future<List<Activity>> _getActivitiesForAMonth() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _activitiesRepository.getForAMonth(_selectedDate.year, _selectedDate.month);
  }

  Future<int> closeReport() async {
    // final reportAfterTransferMinutes = await _transferMinutesToTheNextMonth(created);
    // print('buildSelectedMonthReport buildReportWithLDCActivities: $reportAfterTransferMinutes');
    // return reportAfterTransferMinutes;
    _monthlyReport = await _transferMinutesToTheNextMonth( _monthlyReport.copyWith(isClosed: true));
    // final Report closed = _monthlyReport.copyWith(isClosed: true);
    final int res = await _reportsRepository.update(_monthlyReport);
    reportController.sink.add(_monthlyReport);
    notifyListeners();
    return res;
  }

  Future<int> copyReportToClipboard() async {
    final String username = _userRepository.user.name;
    final bool isUsernameSet = username.isNotEmpty && username != ConstantValues.emptyUser.name;
    final String titleAndDate =
        'Field Service Report ${_monthlyReport.month}/${_monthlyReport.year}.';
    final String data =
        'Placements: ${_monthlyReport.placements}, Video Showings: ${_monthlyReport.videos}, Hours: ${Duration(hours: _monthlyReport.hours, minutes: _monthlyReport.minutes).hoursAndMinutesString()}, Return Visits: ${_monthlyReport.returnVisits}, Bible studies: ${_monthlyReport.bibleStudies}.';
    final String report =
        '$titleAndDate\n${isUsernameSet ? '$username\n' : ''}$data\nRemarks: ${_monthlyReport.remarks}';
    // print('copyReport. Report: $report');
    await Clipboard.setData(ClipboardData(text: report));
    return 4;
  }

  // prevents: PlatformDispatcher ERROR: A AddUpdateState was used after being disposed error!
  bool _isMounted = true;

  @override
  void notifyListeners() {
    if (_isMounted) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false;
    if (!_watchForADayController.isClosed) _watchForADayController.close();
  }
}
