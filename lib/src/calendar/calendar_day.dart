
// DateTime.now() has no constant constructor, so date cannot have a default value: date = const DateTime.now()
class CalendarDay {
  CalendarDay({
    required date,
    thisMonth = false,
    prevMonth = false,
    nextMonth = false,
  })  : _date = date,
        _serviceYear = _getServiceYear(date),
        _thisMonth = thisMonth,
        _prevMonth = prevMonth,
        _nextMonth = nextMonth;

  final DateTime _date;
  final String _serviceYear;
  final bool _thisMonth, _prevMonth, _nextMonth;

  DateTime get date => _date;

  String get serviceYear => _serviceYear;

  int get day => _date.day;

  int get month => _date.month;
  int get year => _date.year;

  bool get prevMonth => _prevMonth;

  bool get nextMonth => _nextMonth;

  // this function is in utility folder. If change here - change the utility function!
  static String _getServiceYear(DateTime? date) {
    if (date == null)  return '-E-';
    final int y = date.year;
    final int m = date.month;
    int startYear = y;
    int endYear = y;
    if (m <= 8) {
      startYear = startYear - 1;
    } else {
      endYear = endYear + 1;
    }
    return '$startYear/$endYear';
  }
  CalendarDay copyWith(
      {DateTime? date, String? serviceYear, bool? thisMonth, bool? prevMonth, bool? nextMonth}) {
    return CalendarDay(
        date: date ?? _date,
        thisMonth: thisMonth ?? _thisMonth,
        prevMonth: prevMonth ?? _prevMonth,
        nextMonth: nextMonth ?? _nextMonth);
  }

  @override
  String toString() {
    return 'CalendarDay: service year: $_serviceYear \n date: $_date,\n,thisMonth: $_thisMonth';
  }

  @override
  bool operator ==(Object other) {
    if (other is CalendarDay) {
      if (other._date != _date ||
          other._thisMonth != _thisMonth ||
          other._prevMonth != _prevMonth ||
          other._nextMonth != _nextMonth ||
          other._serviceYear != _serviceYear) {
        return false;
      }

      return true;
    }
    return false;
  }

  bool get thisMonth => _thisMonth;

  @override
  int get hashCode => Object.hash(_date, _serviceYear, _thisMonth, _prevMonth, _nextMonth);
}
