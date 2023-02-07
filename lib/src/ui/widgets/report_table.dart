import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;

/// data = List<int>[placements, videoShowings, returnVisits]. duration=Duration(hours: 1, minutes: 15)
class ReportTable extends StatelessWidget {
  const ReportTable({
    Key? key,
    this.isMonthly = false,
    this.data = const [0, 0, 0],
    this.duration = const Duration(hours: 0, minutes: 1),
  }) : super(key: key);

  final bool isMonthly;
  final Duration duration;
  final List<int> data;

  @override
  Widget build(BuildContext context) {
    return Table(
        key: UniqueKey(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border:
            TableBorder.all(width: 1.1, borderRadius: const BorderRadius.all(Radius.circular(8))),
        children: [
          _buildHeader(context),
          _buildDataRows(context),
        ]);
  }

  TableRow _buildHeader(BuildContext context) {
    final List<Map<String, dynamic>> headers = [
      {
        'title': 'Placements',
        'icon': Image.asset('assets/images/magazine_t_ic512.png', height: 12)
      },
      {
        'title': 'Video Showings',
        'icon': Image.asset('assets/images/video_camera_t_ic512.png', height: 12)
      },
      {'title': 'Hours', 'icon': Image.asset('assets/images/hourglass_t_ic512.png', height: 12)},
      {
        'title': 'Return Visits',
        'icon': Image.asset('assets/images/two_person_t_ic512.png', height: 12)
      },
    ];
    final TextStyle style = context.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 9) ?? const TextStyle();
    final TextStyle monthlyStyle = context.labelSmall?.copyWith(fontSize: 8) ?? const TextStyle();

    List<Widget> rows = [];
    for (Map m in headers) {
      rows.add(Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.5, bottom: 3),
                child: Text(m['title'],
                    textAlign: TextAlign.center, style: isMonthly ? monthlyStyle : style),
              ),
              isMonthly ? FittedBox(child: m['icon']) : const SizedBox.shrink(),
            ],
          ),
        ),
      ));
    }
    return TableRow(children: rows);
  }

  TableRow _buildDataRows(BuildContext context) {
    return TableRow(children: [
      _buildDataCell(context, data.first.toString()), // Placements
      _buildDataCell(context, data[1].toString()), // Video Showings
      _buildDataCell(context, _makeTime(duration)), // Hours
      _buildDataCell(context, data.last.toString()), // Return Visits
    ]);
  }
  String _makeTime(Duration duration) {
    final String hoursAndMinutes = utils.formatHoursAndMinutesDuration(duration);
    if(hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }

  Widget _buildDataCell(BuildContext context, String value) {
    final TextStyle monthlyStyle =
        context.bodySmall?.copyWith(fontWeight: FontWeight.w500) ?? const TextStyle();
    final TextStyle style =
        context.bodySmall?.copyWith(fontWeight: FontWeight.w500, fontSize: 10) ?? const TextStyle();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
          child: Text(value, textAlign: TextAlign.center, style: isMonthly ? monthlyStyle : style)),
    );
  }
}
