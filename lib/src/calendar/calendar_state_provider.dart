import 'package:flutter/foundation.dart';
import 'package:mat2414/src/calendar/calendar_day.dart';
import 'package:mat2414/src/calendar/custom_calendar.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;

import 'calendar_constants.dart';
import 'calendar_state.dart';

class CalendarStateProvider with ChangeNotifier {
  CalendarStateProvider() {
    _getCalendar();
  }

  static final DateTime _dateNow = DateTime.now();

  String _localeCode = 'en';

  String get localeCode => _localeCode;

  // can not be CalendarDay(date: _dateNow)!
  // because it will not select current day at start:
  // GridView.builder days[index].date: 2023-02-25 00:00:00.000 != selectedDay: 2023-01-15 12:04:07.102
  CalendarState _state = CalendarState(
    currentDate: _dateNow,
    selectedDay: CalendarDay(date: DateTime(_dateNow.year, _dateNow.month, _dateNow.day)),
  );

  List<String> _monthNames = kCalendarMonthNames;

  List<String> get monthNames => _monthNames;

  CalendarState get state => _state;

  CalendarType get status => _state.calendarType;

  set selectedDate(DateTime value) {
    _state = _state.copyWith(selectedDay: CalendarDay(date: value));
    notifyListeners();
  }

  CalendarDay get selected => _state.selectedDay;

  DateTime get selectedDateTime => _state.selectedDay.date;

  DateTime get currentDateTime => _state.currentDate;

  set calendarType(CalendarType type) {
    _state = _state.copyWith(calendarType: type);
    notifyListeners();
  }

  /// returns selected Date as CalendarDay object
  CalendarDay onDateSelect(CalendarDay calendarDate) {
    DateTime stateSelected = _state.selectedDay.date;
    if (stateSelected != calendarDate.date) {
      if (calendarDate.nextMonth) {
        getNextMonth();
      } else if (calendarDate.prevMonth) {
        getPrevMonth();
      }
      _state = _state.copyWith(selectedDay: CalendarDay(date: calendarDate.date));
      notifyListeners();
    }
    return calendarDate;
  }

  /// returns selected month as integer
  int onMonthSelected(int year, int month) {
    final DateTime current = DateTime(year, month, 1);
    CalendarDay marked = CalendarDay(date: current);
    if (year == _dateNow.year && month == _dateNow.month) {
      marked = CalendarDay(date: DateTime(_dateNow.year, _dateNow.month, _dateNow.day));
    }
    _state = _state.copyWith(currentDate: current, selectedDay: marked);
    _getCalendar(CalendarType.monthView);
    return month;
  }

  /// returns selected year as integer
  int onYearSelected(int year, int month) {
    final DateTime current = DateTime(year, month, 1);
    CalendarDay marked = CalendarDay(date: current);
    if (year == _dateNow.year && month == _dateNow.month) {
      marked = CalendarDay(date: DateTime(_dateNow.year, _dateNow.month, _dateNow.day));
    }
    _state = _state.copyWith(currentDate: current, selectedDay: marked);
    _getCalendar(CalendarType.monthSelect);
    return year;
  }

  void onNavigate(bool isNext) {
    if (_state.calendarType == CalendarType.monthView) {
      if (isNext) {
        getNextMonth();
      } else {
        getPrevMonth();
      }
    } else if (_state.calendarType == CalendarType.yearSelect) {
      final DateTime current = _state.currentDate;
      final int? midYear = _state.midYear;
      if (isNext) {
        final int newMidYear = midYear == null ? current.year + 3 : midYear + 3;
        _state = _state.copyWith(midYear: newMidYear);
      } else {
        final int newMidYear = midYear == null ? current.year - 3 : midYear - 3;
        _state = _state.copyWith(midYear: newMidYear);
      }
    }
    notifyListeners();
  }

  void getNextMonth() {
    DateTime current = _state.currentDate;
    if (current.month == 12) {
      current = DateTime(current.year + 1, 1);
      _state = _state.copyWith(currentDate: current);
    } else {
      current = DateTime(current.year, current.month + 1);
      _state = _state.copyWith(currentDate: current);
    }
    final DateTime selected = DateTime(current.year, current.month, current.day);
    _state = _state.copyWith(selectedDay: CalendarDay(date: selected));
    _getCalendar(); // calls notifyListeners()
  }

  // get previous month calendar
  void getPrevMonth() {
    DateTime current = _state.currentDate;
    if (current.month == 1) {
      current = DateTime(current.year - 1, 12);
      _state = _state.copyWith(currentDate: current);
    } else {
      current = DateTime(current.year, current.month - 1);
      _state = _state.copyWith(currentDate: current);
    }
    final DateTime selected = DateTime(current.year, current.month, current.day);
    _state = _state.copyWith(selectedDay: CalendarDay(date: selected));
    _getCalendar(); // calls notifyListeners()
  }

  // get calendar for current month
  void _getCalendar([CalendarType type = CalendarType.monthView]) {
    // if (_state.status != CalendarStatus.loading) {
    //   _state = _state.copyWith(status: CalendarStatus.loading);
    //   notifyListeners();
    // }
    final int m = _state.currentDate.month;
    final int y = _state.currentDate.year;
    final List<CalendarDay> monthDays = CustomCalendar().getMonthCalendar(m, y);
    // final List<CalendarDay> monthDays = _calendar.getMonthCalendar(m, y);
    _state = _state.copyWith(sequentialDates: monthDays, calendarType: type);
    notifyListeners();
  }

  void translateWithLocale(String localeCode){
    // final String locale = Localizations.localeOf(context).toString();
    // if(localeCode == _localeCode) return;
    _localeCode = localeCode;
    _monthNames = _translateMonthsNames(localeCode);
    // notifyListeners();
  }

  List<String> _translateMonthsNames(String localeCode) {
    var monthFromLocale = <String>[];
    // find the first month (january) from _dateNow
    var januaryDateTime = DateTime(_dateNow.year, 1);
    // WEEKDAY - EEEE
    // ABBR_WEEKDAY - E
    // MONTH - MMMM
    var tempMonth = januaryDateTime;
    for (int i = 1; i < 12; i++) {
      monthFromLocale.add(utils.dateFormatter(tempMonth, 'MMMM', localeCode));
      tempMonth = DateTime(tempMonth.year, i + 1);
    }
    return monthFromLocale;
  }
}
