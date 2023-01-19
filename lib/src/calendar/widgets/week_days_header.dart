import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class WeekDaysHeader extends StatelessWidget {
  const WeekDaysHeader(this.style, {Key? key}) : super(key: key);

  final TextStyle? style;

  static const List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _weekDays
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
}
