import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key, required this.sy, this.isDismissible = true}) : super(key: key);

  final String sy;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return DismissibleWidget<String>(
      // key: ObjectKey(sy),
      item: sy,
      onDelete: () {},
      onUpdate: () {},
      isDismissible: isDismissible,
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          // height: 190,
          width: double.maxFinite,
          child: Card(
            // key: Key('value'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Text('Date: $sy', style: context.labelMedium),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 4),
                  const ReportTable(data: [0, 0, 1], duration: Duration(hours: 0, minutes: 30)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                        'Note: jnjrnrbn jhbhb kj, onen nnue kmk. KLkjubnu jjhh. jnjrnrbn jhbhb kj, onen nnue kmk. KLkjubnu jjhh. --. KLkjubnu jjhh. --',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.bodySmall),
                  )
                ]),
              ),
            ),
          )),
    );
  }
}
/*TextButton(
                          key: Key('value_$sy'),
                          onPressed: () {
                            showCustomModalBottomSheet(
                                context,
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                                      child:
                                          SizedBox(width: 300, height: 80, child: TextFormField()),
                                    ),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel')),
                                  ]),
                                ));
                          },
                          child: const Text('Edit'))*/
