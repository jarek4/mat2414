import 'package:mat2414/src/calendar/calendar_constants.dart' as k;

import '../../utils/get_service_year.dart';
import 'calendar.dart';

class CustomCalendar {
  // number of days in month [JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC]
  // final List<int> _monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  final List<int> _monthDays = k.kCalendarMonthsDaysQuantity;

  bool _isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) return true;
        return false;
      }
      return true;
    }
    return false;
  }


  /// months are between 1-12 (January - December)
  List<CalendarDay> getMonthCalendar(int month, int year,
      {StartWeekDay startWeekDay = StartWeekDay.monday}) {
    // validation
    // if (month < 1) month = 1;
    // if ( month > 12) month = 12;
    month = _validateMonth(month);

    List<CalendarDay> calendar = <CalendarDay>[];

    // used for previous and next month's calendar days
    int otherYear;
    int otherMonth;
    int leftDays;

    // get no. of days in the month
    // _monthDays starts from index 0 and month starts from 1, so month-1
    int totalDays = _monthDays[month - 1];
    // if leap year and the month is february, increment the total days by 1
    if (_isLeapYear(year) && month == DateTime.february) totalDays++;

    // get this month's calendar days
    for (int i = 0; i < totalDays; i++) {
      // i+1 because day starts from 1 in DateTime class
      final DateTime day = DateTime(year, month, i + 1);
      calendar.add(
        CalendarDay(
          date: day,
          thisMonth: true,
        ),
      );
    }
    // set current date if Calendar.date is null
    // Calendar firstCalendar = calendar.first.copyWith(date: calendar.first.date ?? DateTime.now());
    // Calendar lastCalendar = calendar.last.copyWith(date: calendar.last.date ?? DateTime.now());

    // fill the unfilled starting weekdays of this month with the previous month days
    if ((startWeekDay == StartWeekDay.sunday && calendar.first.date.weekday != DateTime.sunday) ||
        (startWeekDay == StartWeekDay.monday && calendar.first.date.weekday != DateTime.monday)) {
      // if this month is january, then previous month would be december of previous year
      if (month == DateTime.january) {
        otherMonth = DateTime.december; // _monthDays index starts from 0 (11 for december)
        otherYear = year - 1;
      } else {
        otherMonth = month - 1;
        otherYear = year;
      }
      // month-1 because _monthDays starts from index 0 and month starts from 1
      totalDays = _monthDays[otherMonth - 1];
      if (_isLeapYear(otherYear) && otherMonth == DateTime.february) totalDays++;

      leftDays = totalDays -
          calendar.first.date.weekday +
          ((startWeekDay == StartWeekDay.sunday) ? 0 : 1);

      for (int i = totalDays; i > leftDays; i--) {
        final DateTime day = DateTime(otherYear, otherMonth, i);
        calendar.insert(
          0,
          CalendarDay(
            date: day,
            prevMonth: true,
          ),
        );
      }
    }
    // fill the unfilled ending weekdays of this month with the next month days
    if ((startWeekDay == StartWeekDay.sunday && calendar.last.date.weekday != DateTime.saturday) ||
        (startWeekDay == StartWeekDay.monday && calendar.last.date.weekday != DateTime.sunday)) {
      // if this month is december, then next month would be january of next year
      if (month == DateTime.december) {
        otherMonth = DateTime.january;
        otherYear = year + 1;
      } else {
        otherMonth = month + 1;
        otherYear = year;
      }
      // month-1 because _monthDays starts from index 0 and month starts from 1
      totalDays = _monthDays[otherMonth - 1];
      if (_isLeapYear(otherYear) && otherMonth == DateTime.february) totalDays++;

      leftDays = 7 - calendar.last.date.weekday - ((startWeekDay == StartWeekDay.sunday) ? 1 : 0);
      if (leftDays == -1) leftDays = 6;

      for (int i = 0; i < leftDays; i++) {
        final DateTime day = DateTime(otherYear, otherMonth, i + 1);
        calendar.add(
          CalendarDay(
            date: day,
            nextMonth: true,
          ),
        );
      }
    }
    return calendar;
  }
  int _validateMonth(int month) {
    if (month < 1) return 1;
    if ( month > 12) return 12;
    return month;
  }
}

enum StartWeekDay { sunday, monday }
