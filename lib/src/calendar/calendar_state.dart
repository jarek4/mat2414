import 'calendar.dart';

enum CalendarType { monthView, monthSelect, yearSelect }

class CalendarState {
  CalendarState({
    required this.currentDate,
    required this.selectedDay,
    this.midYear,
    this.sequentialDates = const [],
    this.calendarType = CalendarType.monthView,
  });

  final CalendarType calendarType;

  final DateTime currentDate;

  final CalendarDay selectedDay;

  final List<CalendarDay> sequentialDates;

  final int? midYear;

  CalendarState copyWith({
    DateTime? currentDate,
    CalendarDay? selectedDay,
    int? midYear,
    List<CalendarDay>? sequentialDates,
    CalendarType? calendarType,
  }) {
    return CalendarState(
      currentDate: currentDate ?? this.currentDate,
      selectedDay: selectedDay ?? this.selectedDay,
      midYear: midYear ?? this.midYear,
      sequentialDates: sequentialDates ?? this.sequentialDates,
      calendarType: calendarType ?? this.calendarType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is CalendarState) {
      if (other.currentDate != currentDate ||
          other.selectedDay != selectedDay ||
          other.midYear != midYear ||
          other.sequentialDates != sequentialDates ||
          other.calendarType != calendarType) {
        return false;
      }

      return true;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(currentDate, selectedDay, midYear, sequentialDates, calendarType);
}
