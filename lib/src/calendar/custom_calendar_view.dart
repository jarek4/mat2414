import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/widgets/widgets.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import 'calendar.dart';

class CustomCalendarView extends StatelessWidget {
  const CustomCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(4),
        // height: MediaQuery.of(context).size.height * 0.38,
        // height: MediaQuery.of(context).size.height * 0.40,
        // width: isWide ? w * 0.65 : w * 0.85,
        /*decoration: BoxDecoration(
          // color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
        ),*/
        child: Selector<CalendarStateProvider, CalendarState>(
            selector: (_, calendar) => calendar.state,
            shouldRebuild: (CalendarState pre, CalendarState next) {
              return pre.calendarType != next.calendarType || pre.midYear != next.midYear;
            },
            builder: (BuildContext context, state, _) {
              final CalendarType type = state.calendarType;
              switch (type) {
                case CalendarType.monthView:
                  return _datesView(context);
                case CalendarType.monthSelect:
                  return _showMonthsList(context);
                default:
                  final int? my = context.watch<CalendarStateProvider>().state.midYear;
                  final int y = context.read<CalendarStateProvider>().state.currentDate.year;
                  return _yearsView(my ?? y);
              }
            }),
      ),
    );
  }

  // month view
  Widget _datesView(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(height: 2),
      // header
      Flexible(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
          const SizedBox(width: 5),
          // prev month button
          _calendarNavigationBtn(),
          const SizedBox(width: 5),
          // month and year: January 2023
          FittedBox(
            child: InkWell(
              onTap: () =>
                  context.read<CalendarStateProvider>().calendarType = CalendarType.monthSelect,
              child: Center(
                child: Consumer<CalendarStateProvider>(
                    builder: (BuildContext context, CalendarStateProvider cp, _) {
                  final int index = cp.state.currentDate.month - 1;
                  final String month = cp.monthNames[index];
                  final int year = cp.state.currentDate.year;
                  return Text('$month $year',
                      textAlign: TextAlign.center, style: context.titleLarge);
                }),
              ),
            ),
          ),
          const SizedBox(width: 5),
          // next month button arrows <>
          _calendarNavigationBtn(isNext: true),
          const SizedBox(width: 5),
        ]),
      ),
      const SizedBox(height: 5),
      const Flexible(child: Divider(thickness: 1.2)),
      const SizedBox(height: 2),
      Flexible(
          child: WeekDaysHeader(
        context.labelLarge,
        key: const Key('CalendarViews-datesView'),
      )),
      Expanded(flex: 5, child: _calendarBody()),
    ]);
  }

  Widget _calendarNavigationBtn({bool isNext = false}) {
    return Consumer<CalendarStateProvider>(
        builder: (BuildContext context, CalendarStateProvider cp, _) {
      final int midYear = cp.state.midYear ?? 2024;
      return NavBtn(
        midYear: midYear,
        isForward: isNext,
        onTap: () => cp.onNavigate(isNext),
      );
    });
  }

  // calendar
  Widget _calendarBody() {
    return Consumer<CalendarStateProvider>(
        builder: (BuildContext context, CalendarStateProvider cp, _) {
      final List<CalendarDay> days = cp.state.sequentialDates;
      final DateTime selectedDay = cp.state.selectedDay.date;
      if (days.isEmpty) return const Center(child: CircularProgressIndicator.adaptive());
      return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: days.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0.1,
            crossAxisCount: 7,
            crossAxisSpacing: 13,
            childAspectRatio: 2.7 / 2.3),
        itemBuilder: (context, index) {
          if (days[index].date == selectedDay) {
            return _selector(context, days[index]);
          }
          return _calendarDates(context, days[index]);
        },
      );
    });
  }

  // calendar element, not selected day
  Widget _calendarDates(BuildContext context, CalendarDay calendarDate) {
    final bool isWeekend = calendarDate.date.weekday == DateTime.sunday ||
        calendarDate.date.weekday == DateTime.saturday;
    final Color weekendColor =
        Color.lerp(Colors.grey, Colors.red, 0.34) ?? Colors.blueGrey.shade700;
    return InkWell(
      onTap: () => context.read<CalendarStateProvider>().onDateSelect(calendarDate),
      child: Center(
        child: Text('${calendarDate.date.day}',
            style: TextStyle(
              color: (calendarDate.thisMonth)
                  ? isWeekend
                      ? weekendColor
                      : Colors.grey
                  : isWeekend
                      ? weekendColor.withOpacity(0.4)
                      : Colors.grey.withOpacity(0.45),
            )),
      ),
    );
  }

  // date selector - selected day
  Widget _selector(BuildContext context, CalendarDay calendarDate) {
    return Container(
      // width: 33,
      // height: 33,
      decoration: BoxDecoration(
          color: context.theme.highlightColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: context.theme.focusColor, width: 4.3),
          gradient: LinearGradient(
              colors: [context.theme.focusColor, context.theme.highlightColor],
              stops: const [0.1, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Center(
        child: Text('${calendarDate.date.day}',
            style: context.bodySmall?.copyWith(color: context.colors.primary, fontSize: 15)),
      ),
    );
  }

  // show months list, select month
  Widget _showMonthsList(BuildContext context) {
    // _selectedDateTime = DateTime(_date.year, _date.month, _date.day);
    return Column(children: <Widget>[
      // year:
      InkWell(
        onTap: () => context.read<CalendarStateProvider>().calendarType = CalendarType.yearSelect,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('${context.read<CalendarStateProvider>().state.currentDate.year}',
              style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
        ),
      ),
      const Divider(thickness: 1.4, height: 0.0),
      // months list:
      Expanded(
        child: Consumer<CalendarStateProvider>(
            builder: (BuildContext context, CalendarStateProvider cp, _) {
          final List<String> monthsNames = cp.monthNames;
          final DateTime current = cp.state.currentDate;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: monthsNames.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => cp.onMonthSelected(current.year, index + 1),
              title: Center(
                child: Text(monthsNames[index],
                    style: context.bodyLarge?.copyWith(
                        fontWeight:
                            index == current.month - 1 ? FontWeight.bold : FontWeight.normal)),
              ),
            ),
          );
        }),
      ),
    ]);
  }

  // years list views, select year
  Widget _yearsView(int midYear) {
    // _selectedDateTime = DateTime(_date.year, _date.month, _date.day);
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        _calendarNavigationBtn(),
        _calendarNavigationBtn(isNext: true),
      ]),
      Expanded(
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              int thisYear;
              if (index < 1) {
                thisYear = midYear - (1 - index);
              } else if (index > 1) {
                thisYear = midYear + (index - 1);
              } else {
                thisYear = midYear;
              }
              return Consumer<CalendarStateProvider>(
                  builder: (BuildContext context, CalendarStateProvider cp, _) {
                final int currentYear = cp.state.currentDate.year;
                final int currentMonth = cp.state.currentDate.month;
                return ListTile(
                  onTap: () => cp.onYearSelected(thisYear, currentMonth),
                  title: Text('$thisYear',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontSize: thisYear == currentYear ? 23 : 18)),
                );
              });
            }),
      ),
    ]);
  }
}
