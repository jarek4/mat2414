import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/screens/report/report_state_provider.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key, required this.sy}) : super(key: key);

  final List<String> sy;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Consumer<ReportStateProvider>(
                builder: (BuildContext context, ReportStateProvider provider, _) {
                  return AddActivityWidget(handle: () => print('add small'));
                }),
          ),
          Expanded(
            child: ListView(
              children: [
                ReportCard(sy: sy[0]),
                ReportCard(sy: 'man - k'),
                ReportCard(sy: '${sy[1]}-1'),
              ],
            ),
          ),
        ]
    );
  }
}
