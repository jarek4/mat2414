import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../../widgets/widgets.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        // height: 190,
        width: double.maxFinite,
        child: Card(
          // key: Key('value'),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Theme.of(context).colorScheme.tertiary),
              ),
              color: context.colors.background,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Date: 2022/23 FEV', style: context.labelLarge),
                ),
                /*Wrap(
                  // runAlignment: WrapAlignment.spaceBetween,
                  spacing: 40,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('Date: 2022/23 FEV', style: context.labelLarge),
                    OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.copy), label: Text('Copy Report'))
                  ],
                ),*/
                const SizedBox(height: 4),
                const ReportTable(
                    isMonthly: true, data: [3, 2, 5], duration: Duration(hours: 2, minutes: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child:
                            Image.asset('assets/images/two_person_table_t_ic512.png', height: 22)),
                    Flexible(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Bible studies:',
                            style: context.bodyMedium,
                          ),
                        )),
                    Flexible(
                      // flex: 2,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        const Text('1'),
                        SizedBox(
                          height: 60,
                          child: FittedBox(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    padding: const EdgeInsets.all(2.0),
                                    tooltip: 'Increase bible studies quantity',
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                    )),
                                IconButton(
                                    padding: const EdgeInsets.all(2.0),
                                    tooltip: 'Decrease bible studies quantity',
                                    onPressed: () {},
                                    icon: const Icon(Icons.keyboard_arrow_down_rounded))
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const TooltipWidget(
                        info:
                            'Use arrows to increase or decrease bible studies quantity. The number you set will be shown the next month. \nFor more information see More/Settings/Help'),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                      onPressed: () {}, icon: const Icon(Icons.edit), label: const Text('Remarks')),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'data assets/ images/two_person_table_t_ic512. pngimages/two_person_table_t_ic512.',
                      style: context.bodySmall),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton.icon(
                        onPressed: () {},
                        // icon: Icon(Icons.copy),
                        icon: Image.asset('assets/images/notes_t_ic512.png', height: 15),
                        label: const Text('Copy Report')),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TooltipWidget(
                          info:
                              'You cannot undo closing the month! You will also not be able to make changes. \nFor more information see More/Settings/Help'),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
