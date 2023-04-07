import 'package:flutter/material.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;
import 'package:mat2414/src/ui/theme/theme.dart';

class WeekDaysHeader extends StatelessWidget {
  const WeekDaysHeader(this.style, {Key? key}) : super(key: key);

  final TextStyle? style;

  // static const List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // children: _weekDays
      children: _translateWeekDays(context)
          .map((day) => Text(
                day,
                style: style ?? context.labelLarge?.copyWith(color: Colors.orange),
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
              ))
          .toList(),
    );
  }

  List<String> _translateWeekDays(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    if (locale == 'en') return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    var abbrWeekDaysFromLocale = <String>[];
    final dateNow = DateTime.now();
    // find the first week day from _dateNow
    var weekDay = dateNow.weekday;
    // if weekDay=1 (monday) => monday = now.subtract(Duration(days: 1 - 1));
    // if weekDay=7 (sunday) => monday = now.subtract(Duration(days: 7 - 1));
    final mondayDateTime = dateNow.subtract(Duration(days: weekDay - 1));
    var tempDay = mondayDateTime;
    for (int i = 1; i <= 7; i++) {
      var name = utils.dateFormatter(tempDay, 'E', locale).trim().replaceAll('.', '');
      if (name.length > 3) name = name.substring(0, 3);
      abbrWeekDaysFromLocale.add(name.capitalize());
      tempDay = tempDay.add(const Duration(days: 1));
    }
    if(abbrWeekDaysFromLocale.length < 7) {
      return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    }
    return abbrWeekDaysFromLocale;
  }
}
