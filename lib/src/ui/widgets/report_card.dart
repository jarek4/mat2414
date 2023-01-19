import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key, required this.sy}) : super(key: key);

  final String sy;

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
              border: const Border(
                top: BorderSide(width: 2.0, color: Colors.orange),
              ),
              color: context.colors.background,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date: $sy', style: context.labelLarge?.copyWith(fontSize: 16)),
                    TextButton(
                        key: Key('value_$sy'),
                        onPressed: () {
                          showCustomModalBottomSheet(
                              context,
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                                child: Column(mainAxisSize: MainAxisSize.min, children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                                    child: SizedBox(width: 300, height: 80, child: TextFormField()),
                                  ),
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel')),
                                ]),
                              ));
                        },
                        child: const Text('Edit'))
                  ],
                ),
                const SizedBox(height: 4),
                const ReportTable(data: [0, 0, 1], duration: Duration(hours: 0, minutes: 30)),
                Text('Note: jnjrnrbn jhbhb kj, onen nnue kmk. KLkjubnu jjhh',
                    style: context.bodyLarge),
              ]),
            ),
          ),
        ));
  }

  TableRow _buildRows(BuildContext context) {
    List<String> cells = ['2', '1', '3', '1'];
    TextStyle style = context.bodySmall?.copyWith(fontWeight: FontWeight.w500) ?? const TextStyle();
    return TableRow(
        children: cells
            .map((e) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(child: Text(e, textAlign: TextAlign.center, style: style)),
                ))
            .toList());
  }

  TableRow _buildHeader(BuildContext context) {
    List<String> cells = ['Placements', 'Video Showings', 'Hours', 'Return Visits'];
    TextStyle style = context.bodySmall?.copyWith(fontWeight: FontWeight.bold) ?? const TextStyle();
    return TableRow(
        children: cells
            .map((e) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(e, textAlign: TextAlign.center, style: style),
                  ),
                ))
            .toList());
  }
}
