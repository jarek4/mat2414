import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class MonthView extends StatelessWidget {
  const MonthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Add new activity', style: context.labelMedium),
              IconButton(
                  onPressed: () => print('ADD btn'), icon: const Icon(Icons.add_circle, size: 24)),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildActivity(context);
                  /*_buildActivity(context),
                _buildActivity(context),*/
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildActivity(BuildContext context) {
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
              child: Column(
                children: [
                  /*Align(
                      alignment: Alignment.topRight,
                      child: TextButton(onPressed: (){}, child: Text('Edit'))),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date: 14/01', style: context.labelLarge?.copyWith(fontSize: 16)),
                      TextButton(key: Key('value'), onPressed: () {}, child: Text('Edit'))
                    ],
                  ),
                  const SizedBox(height: 4),
                  Table(
                    // key: Key('value'),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(
                        width: 1.3, borderRadius: BorderRadius.all(Radius.circular(8))),
                    children: [
                      _buildHeader(context),
                      _buildRows(context),
                    ],
                  ),
                  Text('Remarks: jnjrnrbn jhbhb kj, onen nnue kmk. KLkjubnu jjhh',
                      style: context.bodyLarge),
                ],
              ),
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
