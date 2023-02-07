import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../../widgets/widgets.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      // height: 190,
      // width: double.maxFinite,
      child: _buildCartWrapperWithPadding(context, [
        Align(
            alignment: Alignment.topLeft,
            child: Text('Date: 2022/23 FEV', style: context.labelLarge)),
        const SizedBox(height: 4),
        const ReportTable(
            isMonthly: true, data: [3, 2, 5], duration: Duration(hours: 2, minutes: 15)),
        _buildBibleStudiesRow(context),
        _buildRemarksBtn(),
        _buildRemarksText(context),
        _buildCopyReportBtn()
      ]),
    );
  }

  Widget _buildCartWrapperWithPadding(BuildContext context, List<Widget> children) {
    final Color borderColor = context.colors.tertiary;
    final Color backgroundColor = context.colors.background;
    return Card(
      key: UniqueKey(),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 2.0, color: borderColor)),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
          child: Column(
              // to shrink Card! without MainAxisSize.min is expanded!
              mainAxisSize: MainAxisSize.min,
              children: children),
        ),
      ),
    );
  }

  Widget _buildBibleStudiesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // this FittedBox must have width: !
        FittedBox(child: Image.asset('assets/images/two_person_table_t_ic512.png', height: 22, width: 22)),
        FittedBox(
            // flex: 4,
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Bible studies:', style: context.bodyMedium),
        )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('1', style: context.bodyLarge),
          SizedBox(
            height: 60,
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(2.0),
                    tooltip: 'Increase bible studies quantity',
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_up_rounded),
                  ),
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
        const TooltipWidget(
            info:
                'Use arrows to increase or decrease bible studies quantity. The number you set will be shown the next month. \nFor more information see More/Settings/Help'),
      ],
    );
  }

  Widget _buildRemarksBtn() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 40,
        child: FittedBox(
          child: TextButton.icon(
              onPressed: () {}, icon: const Icon(Icons.edit), label: const Text('Remarks')),
        ),
      ),
    );
  }

  Align _buildRemarksText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Text(
            'data assets/ images/two_person_table_t_ic512. pngimages/two_person_table_t_ic512.',
            style: context.bodySmall),
      ),
    );
  }

  Row _buildCopyReportBtn() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.copy),
                // icon: Image.asset('assets/images/notes_t_ic512.png', height: 15),
                label: const Text('Copy Report')),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: TooltipWidget(
                info:
                    'You cannot undo closing the month! You will also not be able to make changes. \nFor more information see More/Settings/Help'),
          ),
        ]);
  }
}
