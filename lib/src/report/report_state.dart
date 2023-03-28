import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../data/models/models.dart';

enum ReportStateStatus { error, loading, success }

class ReportState with ChangeNotifier {
  ReportState(this._selectedDate);

  CalendarDay _selectedDate;

  CalendarDay get selectedDate => _selectedDate;

  /// ChangeNotifierProxyProvider update
  void update(CalendarDay selected) {
    // when user select next or previews month - day will be set to 1.
    final bool isUpdated = _selectedDate.month != selected.month || _selectedDate.year != selected.year;
    if (_selectedDate != selected) {
      _selectedDate = selected;
      notifyListeners();
    }
    print('update stream isUpdated: $isUpdated');
    if (/*_selectedDate.month != selected.month || _selectedDate.year != selected.year*/ isUpdated) {
      // print('update stream: ${_selectedDate.month != selected.month || _selectedDate.year != selected.year}');
      // buildSelectedMonthReport();
      print('update stream isUpdated: $isUpdated');
    }
  }

  final IActivitiesRepository _activitiesRepository = locator<IActivitiesRepository>();
  final IReportsRepository _reportsRepository = locator<IReportsRepository>();
  static final IUserRepository _userRepository = locator<IUserRepository>();

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
    if (!report.isClosed) report.close();
  }

  final StreamController<Report> report = StreamController<Report>.broadcast();

  ReportStateStatus _status = ReportStateStatus.loading;

  ReportStateStatus get status => _status;

  int _bibleStudies = _userRepository.user.preferences.bibleStudies;

  int get bibleStudies => _bibleStudies;

  final DateTime now = DateTime.now();

  Report get emptyReport => Report(
      createdAt: now,
      lastModified: now,
      month: _selectedDate.month,
      serviceYear: _selectedDate.serviceYear,
      year: _selectedDate.year,
      remarks: 'You have no activities this month.');

  /// The value has to be +1 or -1
  void onBibleStudiesChange(int value) {
    if (_bibleStudies + value < 0) return;
    if (_bibleStudies + value < 1) {
      _bibleStudies = 0;
    } else {
      _bibleStudies += value;
    }
    notifyListeners();
    if (_userRepository.user.preferences.bibleStudies != _bibleStudies) {
      _userRepository.update(_userRepository.user.copyWith(
          preferences: _userRepository.user.preferences.copyWith(bibleStudies: _bibleStudies)));
    }
  }

  String _monthReportRemarks = '';

  String get monthReportRemarks => _monthReportRemarks;

  void onMonthReportRemarksChange(String? value) {
    if (value == null) return;
    _monthReportRemarks = value;
    notifyListeners();
  }

  Future<Report> buildSelectedMonthReport() async {
    final Report? closedReport = await _getClosedReport();
    // if selected month already has a closed monthly report there is no need to make a new one!
    // closed reports cant be open again.
    if (closedReport != null) {
      report.add(closedReport);
      return closedReport;
    }

    // for selected month there is no report - need to make it:
    // final DateTime now = DateTime.now();
    Report temp = emptyReport;
    final List<Activity> activities = await _getActivitiesForAMonth();

    // no activities for given month, return empty Report
    if (activities.isNotEmpty) {
      // there are activities for that month - make a report

      // select LCD hours
      // final List<int> lcdIDs = activities.where((element) => element.isLCDHours == true).map((e) => e.id).toList();
      final List<Activity> lcdActivities =
          activities.where((element) => element.isLDCHours == true).toList();
      if (lcdActivities.isEmpty) {
        int p = 0, v = 0, r = 0;
        String remarks = '';
        Duration duration = const Duration();
        for (Activity a in activities) {
          //h += a.hours;
          duration += Duration(hours: a.hours, minutes: a.minutes);
          p += a.placements;
          v += a.videos;
          r += a.returnVisits;
          remarks = '$remarks; ${a.day}: ${a.remarks}';
        }
        final Report created = temp.copyWith(
          hours: duration.inHours,
          minutes: duration.inMinutes.remainder(60),
          bibleStudies: _bibleStudies,
          placements: p,
          videos: v,
          returnVisits: r,
          remarks: remarks,
        );
        report.add(created);
        return created;
      } else {
        // activities contains also the LCD hours. This hours need to be separated.
        // Will be collected in report.specialHours. If activity is LCD hours - placements, returnVisits, ...
        // are zero. So need to count only hours and minutes. Subtract them from the total number of hours.
        Duration lcdDuration = const Duration();
        for (Activity lcd in lcdActivities) {
          Duration duration = Duration(hours: lcd.hours, minutes: lcd.minutes);
          lcdDuration += duration;
        }
        // all activities:
        int p = 0, v = 0, r = 0;
        String remarks = '';
        Duration duration = const Duration();
        for (Activity a in activities) {
          duration += Duration(hours: a.hours, minutes: a.minutes);
          p += a.placements;
          v += a.videos;
          r += a.returnVisits;
          remarks = '$remarks; ${a.day}: ${a.remarks}';
        }
        // Subtract lcd hours from the total number of hours.
        duration = duration - lcdDuration;
        // remarks, add LCD description(02:45, 2 is saved, 45 remains for the next month)
        // if any minutes remains - create LCD activity with this minutes, and add remarks.
        final int remainingLCDMinutes = lcdDuration.inMinutes.remainder(60);
        final String remainingMinutes =
            remainingLCDMinutes < 1 ? '' : ', $remainingLCDMinutes remains for the next month.';
        final String reportRemarks =
            'LCD: ${lcdDuration.hoursAndMinutesString()}, $remainingMinutes.\n $remarks';

        final Report created = temp.copyWith(
            hours: duration.inHours,
            minutes: duration.inMinutes.remainder(60),
            bibleStudies: _bibleStudies,
            placements: p,
            videos: v,
            returnVisits: r,
            remarks: reportRemarks,
            hoursLDC: lcdDuration.inHours);
        report.add(created);
        return created;
      }
    }
    return temp;
  }

  Future<Report?> _getClosedReport() async {
    return _reportsRepository.readClosedForAMonth(_selectedDate.year, _selectedDate.month);
  }

  Future<List<Activity>> _getActivitiesForAMonth() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _activitiesRepository.getForAMonth(_selectedDate.year, _selectedDate.month);
  }

  void refresh() {
    print('ReportState refresh()');
  }
}
