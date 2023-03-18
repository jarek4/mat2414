/*
import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';


// NOT USED - TO REMOVE!
class ReportCard extends StatelessWidget {
  const ReportCard({Key? key, required this.item, this.isDismissible = true}) : super(key: key);

  final Activity item;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    // final int h = item.hours;
    // final int m = item.minutes;
    // final int p = item.placements;
    // final int r = item.returnVisits;
    // final int v = item.videos;
    // final String date = utils.dateFormatter(DateTime(item.year, item.month, item.day), 'EEEE, d MMMM');
    // final bool isWithRemarks = item.remarks.isNotEmpty;
    return DismissibleActivityListItem(
      key: Key('${item.createdAt}-${item.hashCode}'),
     item: item,
      // onDelete: () {},
      // onUpdate: () {},
      */
/*child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          // height: 190,
          width: double.maxFinite,
          child: Card(
            key: Key('${item.toString()}-${item.hashCode}'),
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
                      child: Text('Date: $date // ${item.id}', style: context.labelMedium, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  ReportTable(data: [p, v, r], duration: Duration(hours: h, minutes: m)),
                 isWithRemarks ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                          'Remarks: ${item.remarks}'.trimRight(),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodySmall),
                    ),
                  ) : const SizedBox(height: 6)
                ]) ,
              ),
            ),
          )),*//*

    );
  }

}*/
