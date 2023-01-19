import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;

/// data = List<int>[placements, videoShowings, returnVisits]. duration=Duration(hours: 1, minutes: 15)
class ActivitySimpleView extends StatelessWidget {
  const ActivitySimpleView({
    Key? key,
    required this.data,
    required this.duration,
  }) : super(key: key);

  final Duration duration;
  final List<int> data;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    Color color = context.colors.primaryContainer;
    final String time = _makeTime(duration);
    return Container(
      // height: 70.0,
      // minHeight:isEditable 69 : 38 !
      constraints: const BoxConstraints(minHeight: 40),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(child: Text('FEB', style: textTheme.labelMedium, textAlign: TextAlign.center)),
                const SizedBox(height: 2),
                Center(child: Text('27', style: textTheme.titleSmall, textAlign: TextAlign.center)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/magazine_t_ic512.png', height: 18),
                const SizedBox(height: 2),
                Center(child: Text('${data[0]}', style: textTheme.labelLarge, textAlign: TextAlign.center)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/video_camera_t_ic512.png', height: 18),
                const SizedBox(height: 2),
                Text('${data[1]}', style:textTheme.labelLarge, textAlign: TextAlign.center),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/hourglass_t_ic512.png', height: 18),
                const SizedBox(height: 2),
                Text(time, style: textTheme.labelLarge, textAlign: TextAlign.center),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/two_person_t_ic512.png', height: 18),
                const SizedBox(height: 2),
                Text('${data[2]}', style: textTheme.labelLarge, textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _makeTime(Duration duration) {
    final String hoursAndMinutes = utils.formatHoursAndMinutesDuration(duration);
    if(hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }
}
