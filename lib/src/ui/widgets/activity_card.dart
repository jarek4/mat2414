import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final int h = activity.hours;
    final int m = activity.minutes;
    final int p = activity.placements;
    final int r = activity.returnVisits;
    final int v = activity.videos;
    final String date = utils.dateFormatter(DateTime(activity.year, activity.month, activity.day), 'EEEE, d MMMM');
    final bool isWithRemarks = activity.remarks.isNotEmpty;
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        // height: 190,
        width: double.maxFinite,
        child: Card(
          key: Key('${activity.toString()}-${activity.hashCode}'),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(width: 2.0, color: Colors.orange),
              ),
              color: context.colors.background,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text('Date: $date // ${activity.id}', style: context.labelMedium, overflow: TextOverflow.ellipsis),
                  ),
                ),
                ReportTable(data: [p, v, r], duration: Duration(hours: h, minutes: m)),
                isWithRemarks ? Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                        'Remarks: ${activity.remarks}'.trimRight(),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.bodySmall),
                  ),
                ) : const SizedBox(height: 6)
              ]) ,
            ),
          ),
        ));
  }
}
