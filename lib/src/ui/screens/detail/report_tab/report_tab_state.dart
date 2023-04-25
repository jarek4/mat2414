// ignore_for_file: avoid_print
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/localization/locale_notifier.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:mat2414/utils/convert_duration.dart' as utils_cd;

import '../../../../data/models/models.dart';

// enum ReportStateStatus { error, loading, success }

class ReportTabState with ChangeNotifier {
  ReportTabState(this._selectedDate);

  CalendarDay _selectedDate;

  CalendarDay get selectedDate => _selectedDate;

  final IActivitiesRepository _activitiesRepository = locator<IActivitiesRepository>();
  final IReportsRepository _reportsRepository = locator<IReportsRepository>();
  static final IUserRepository _userRepository = locator<IUserRepository>();

  // localization
  final ILocaleNotifier _s = locator<ILocaleNotifier>();

  /// ChangeNotifierProxyProvider update
  Future<void> update(CalendarDay selected) async {
    final bool isReportToUpdate =
        _selectedDate.month != selected.month || _selectedDate.year != selected.year;
    // when user select next or previews month - day will be set to 1.
    if (_selectedDate != selected) {
      _selectedDate = selected;
      notifyListeners();
    }
    if (isReportToUpdate) {
      await buildSelectedMonthReport();
    }
  }

  static final DateTime _currentDate = DateTime.now();

  Report _monthlyReport = ConstantValues.emptyReport;

  Report get monthlyReport => _monthlyReport;

  final StreamController<Report> reportCtrl = StreamController<Report>.broadcast();

  /// The value has to be +1 or -1
  void onBibleStudiesChange(int value) {
    if (_monthlyReport.isClosed) return;
    final int current = _monthlyReport.bibleStudies;
    final int nextValue = current + value;
    // if (nextValue < 0) return;
    if (nextValue < 1) {
      _monthlyReport = _monthlyReport.copyWith(bibleStudies: 0);
    } else {
      _monthlyReport = _monthlyReport.copyWith(bibleStudies: nextValue);
    }
    reportCtrl.sink.add(_monthlyReport);
    notifyListeners();
    if (_userRepository.user.preferences.bibleStudies != _monthlyReport.bibleStudies) {
      _userRepository.update(_userRepository.user.copyWith(
          preferences: _userRepository.user.preferences
              .copyWith(bibleStudies: _monthlyReport.bibleStudies)));
    }
  }

  void onMonthReportRemarksChange(String? value) {
    if (_monthlyReport.isClosed) return;
    _monthlyReport = _monthlyReport.copyWith(remarks: value ?? '');
    reportCtrl.sink.add(_monthlyReport);
    notifyListeners();
  }

  Stream<Report> watchReport() async* {
    await Future.delayed(const Duration(seconds: 1));
    await buildSelectedMonthReport();
    yield _monthlyReport;
    yield* reportCtrl.stream;
  }

  // this function has to return value and add value to the stream!
  // returned Report is not closed! Until it is not closed it wont be stored into DB.
  Future<void> buildSelectedMonthReport() async {
    final Report? closed = await _getClosedReport();

    if (closed != null) {
      // selected month already has a closed monthly report. No need to make a new one!
      // closed reports cant be open again.
      reportCtrl.sink.add(_monthlyReport = closed);
      notifyListeners();
      // return savedClosedReport;
      return;
    }
    // for selected month there is no report stored into DB - need to make it:

    final List<Activity> activities = await _getActivitiesForAMonth();
    if (activities.isNotEmpty) {
      // there are activities for that month - make a report

      // select activities with LDC hours:
      final List<Activity> ldcActivities =
          activities.where((a) => a.type == ActivityType.ldc).toList();

      if (ldcActivities.isEmpty) {
        final Report reportNoLDC = _buildReportNoLDCActivities(activities);
        reportCtrl.sink.add(_monthlyReport = reportNoLDC);
        notifyListeners();
        return;
        //return reportNoLDC;
      } else {
        final Report reportWithLDC = _buildReportWithLDCActivities(activities);
        reportCtrl.sink.add(_monthlyReport = reportWithLDC);
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
        remarks: _s.loc.homeNoActivities); // 'You have no activities this month.'
    reportCtrl.sink.add(_monthlyReport = empty);
    notifyListeners();
    // return empty;
  }

  Report _buildReportNoLDCActivities(List<Activity> activities) {
    int placementsTemp = 0, videosTemp = 0, returnVisitsTemp = 0;
    String remarksTemp = '';
    var durationTemp = 0;
    for (var a in activities) {
      durationTemp += a.durationInMinutes;
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
      durationInMinutes: durationTemp,
      bibleStudies: _userRepository.user.preferences.bibleStudies,
      placements: placementsTemp,
      videos: videosTemp,
      returnVisits: returnVisitsTemp,
      remarks: remarksTemp,
      uid: _userRepository.user.uid,
    );
    return created;
  }

  Report _buildReportWithLDCActivities(List<Activity> all) {
    // activities contains also the LDC hours. This hours need to be separated, and
    // will be collected in report.hoursLDC and minutes.LDC. Need to count only hours and minutes.
    // Subtract them from the total number of hours.
    var ldcTime = 0;

    // all activities:
    var noLdcTime = 0;
    int placementsTemp = 0, videosTemp = 0, returnVisitsTemp = 0;
    var remarksTemp = '';

    for (Activity a in all) {
      // Separate (subtract) ldc hours.
      if (a.type == ActivityType.ldc) {
        ldcTime += a.durationInMinutes;
      } else {
        noLdcTime += a.durationInMinutes;
      }
      // ActivityType.transferred remarks contains only date.
      if (a.remarks.isNotEmpty && a.type != ActivityType.transferred) {
        remarksTemp = '$remarksTemp${a.remarks}. ';
      }
      placementsTemp += a.placements;
      videosTemp += a.videos;
      returnVisitsTemp += a.returnVisits;
    }
    final Report created = Report(
      createdAt: _currentDate,
      lastModified: _currentDate,
      month: _selectedDate.month,
      serviceYear: _selectedDate.serviceYear,
      year: _selectedDate.year,
      durationInMinutes: noLdcTime,
      bibleStudies: _userRepository.user.preferences.bibleStudies,
      placements: placementsTemp,
      videos: videosTemp,
      returnVisits: returnVisitsTemp,
      remarks: _makeRemarks(ldcTime, remarksTemp),
      minutesLDC: ldcTime,
      uid: _userRepository.user.uid,
    );

    return created;
  }

  String _makeRemarks(int durationInMinutes, String remarksFromEachActivity) {
    final ldc = _s.loc.generalLDCHours;
    final remarks = _s.loc.generalRemarks;
    final time = utils_cd.minutesDurationToFormattedString(durationInMinutes);
    final remarksString = '$ldc: $time.\n$remarks: $remarksFromEachActivity';
    if (remarksString.length > 650) {
      remarksFromEachActivity = remarksFromEachActivity.substring(0, 646);
      remarksFromEachActivity = '$remarksFromEachActivity...';
    }
    return remarksString;
  }

  // only full hours in the report
  FutureOr<Report> _transferMinutesToTheNextMonth(Report r) async {
    var rMinutes = r.durationInMinutes;
    // time is 0:15, 1:00, or 12:00
    if (rMinutes <= 60 || rMinutes % 60 == 0) return r;
    // create activity for next month with minutes from this month
    // have to specify a month, year and service year for the new activity
    final subtracted = rMinutes % 60;
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
      final int part1 = first ?? (rMonth != 8 ? rYear : rYear + 1);
      final int part2 = second ?? (rMonth != 8 ? rYear : rYear + 2);
      aServiceYear = '$part1/$part2';
    }
    final nextMonthActivity = Activity(
      createdAt: _currentDate,
      day: 1,
      lastModified: _currentDate,
      month: aMonth,
      serviceYear: aServiceYear,
      year: aYear,
      durationInMinutes: subtracted,
      remarks: '$rMonth/$rYear',
      // Transferred from 4/2023
      type: ActivityType.transferred,
      uid: _userRepository.user.uid,
    );
    // save transferred minutes activity
    final id = await _activitiesRepository.create(nextMonthActivity);
    // report with 0 minutes (2:00, or 37:00), and transferred activity id
    return r.copyWith(
      transferredMinutes: subtracted,
      transferredMinutesActivityId: id,
      durationInMinutes: rMinutes - subtracted,
    );
  }

  Future<Report?> _getClosedReport() async {
    return _reportsRepository.readClosedForAMonth(_selectedDate.year, _selectedDate.month);
  }

  Future<List<Activity>> _getActivitiesForAMonth() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _activitiesRepository.getForAMonth(_selectedDate.year, _selectedDate.month);
  }

  Future<int> closeReport() async {
    _monthlyReport = await _transferMinutesToTheNextMonth(_monthlyReport.copyWith(isClosed: true));
    final res = await _reportsRepository.update(_monthlyReport);
    print('closeReport() res: $res');
    reportCtrl.sink.add(_monthlyReport);
    // notifyListeners();
    return res;
  }

  Future<void> copyReportToClipboard() async {
    final String username = _userRepository.user.name;
    final bool isUsernameSet = username.isNotEmpty && username != ConstantValues.emptyUser.name;
    // Field Service Report
    final reportTitle = _s.loc.tabReport;
    final String titleAndDate = '$reportTitle ${_monthlyReport.month}/${_monthlyReport.year}.';
    final p = _s.loc.generalPlacements,
        v = _s.loc.generalVideoShowings,
        h = _s.loc.generalHour(2),
        r = _s.loc.generalReturnVisits,
        b = _s.loc.generalBibleStudies;
    final String data =
        '$p: ${_monthlyReport.placements}, $v: ${_monthlyReport.videos}, $h: ${utils_cd.minutesDurationToFormattedString(_monthlyReport.durationInMinutes)}, $r: ${_monthlyReport.returnVisits}, $b: ${_monthlyReport.bibleStudies}.';
    final String report =
        '$titleAndDate\n${isUsernameSet ? '$username\n' : ''}$data\n${_s.loc.generalRemarks}: ${_monthlyReport.remarks}';
    // print('copyReport. Report: $report');
    await Clipboard.setData(ClipboardData(text: report));
  }

  Future<int> deleteReport() async {
    if (!_monthlyReport.isClosed) return -1;
    final res = await _reportsRepository.delete(monthlyReport.id);
    if (res > -1) {
      _monthlyReport = _monthlyReport.copyWith(
        durationInMinutes: _monthlyReport.durationInMinutes + _monthlyReport.transferredMinutes,
        isClosed: false,
      );
      // notifyListeners();
      reportCtrl.sink.add(_monthlyReport);
    }
    return res;

  }


  Future<List<Report>> getForServiceYear(String serviceYear) {
    return _reportsRepository.readForAServiceYear(serviceYear);
  }

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
    if (!reportCtrl.isClosed) reportCtrl.close();
  }
}
