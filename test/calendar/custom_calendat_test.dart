import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/src/calendar/calendar.dart';

void main() {
  late CustomCalendar sut;
  // january: 31 days, february: 28 days,...
  final List<int> eachMonthNumberOfDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  const int givenMonth = 5; // april
  const int noLeapYear2023 = 2023;
  const int leapYear2024 = 2024;
  group('CustomCalendar', () {
    group('getMonthCalendar method should', () {
      setUp(() async {
        sut = CustomCalendar();
      });
      test('return 31 CalendarDay.thisMonth=true for January', () {
        final List<CalendarDay> januaryDays = sut.getMonthCalendar(1, noLeapYear2023);
        final int quantity = januaryDays.where((d) => d.thisMonth == true).length;
        expect(quantity, eachMonthNumberOfDays[0]);
      });
      test('return 28 CalendarDay.thisMonth=true for February', () {
        final List<CalendarDay> februaryDays = sut.getMonthCalendar(2, noLeapYear2023);
        final int quantity = februaryDays.where((d) => d.thisMonth == true).length;
        expect(quantity, eachMonthNumberOfDays[1]);
      });
      test('returns list where items.thisMonth == List<CalendarDay>.length - (items.prevMonth + items.nextMonth)', () {
        final List<CalendarDay> givenMonthDays = sut.getMonthCalendar(givenMonth, noLeapYear2023);
        final int returnedListLength = givenMonthDays.length;
        final int itemsPrevMonth = givenMonthDays.where((d) => d.prevMonth == true).length;
        final int itemsNextMonth = givenMonthDays.where((d) => d.nextMonth == true).length;
        final int itemsThisMonth = returnedListLength - (itemsPrevMonth + itemsNextMonth);
        expect(itemsThisMonth, eachMonthNumberOfDays[givenMonth - 1]);
      });
    });
    test('return 29 CalendarDay.thisMonth=true for February in leap year', () {
      final List<CalendarDay> februaryDays = sut.getMonthCalendar(2, leapYear2024);
      final int returnedListLength = februaryDays.length;
      final int itemsPrevMonth = februaryDays.where((d) => d.prevMonth == true).length;
      final int itemsNextMonth = februaryDays.where((d) => d.nextMonth == true).length;
      final int itemsThisMonth = returnedListLength - (itemsPrevMonth + itemsNextMonth);
      expect(itemsThisMonth, eachMonthNumberOfDays[1] + 1);
    });
  });
}