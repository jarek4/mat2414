import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class ReportSimpleView extends StatelessWidget {
  const ReportSimpleView({Key? key, required this.data}) : super(key: key);

  final List<String> data;

  static final List<Image> _headerIcons = [
    Image.asset(AssetPath.imgMagazine512, height: 12, width: 12),
    Image.asset(AssetPath.imgVideoCamera512, height: 12, width: 12),
    Image.asset(AssetPath.imgHourglass512, height: 12, width: 12),
    Image.asset(AssetPath.imgTwoPersons512, height: 12, width: 12),
    Image.asset(AssetPath.imgTwoPeronAtTable, height: 18, width: 18),
    Image.asset(AssetPath.icEngineer305, height: 12, width: 12),
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
        key: UniqueKey(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildReportTableHeading(context),
          _buildTableDataRow(context, data),
        ]);
  }

  TableRow _buildReportTableHeading(BuildContext context) {
    List<Widget> rows = [];
    for (Image i in _headerIcons) {
      rows.add(Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(child: i),
        ),
      ));
    }
    return TableRow(children: rows);
  }

  TableRow _buildTableDataRow(BuildContext context, List<String> data) {
    var content = <Widget>[];
    for (int i = 0; i < data.length; i++) {
      content.add(Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(data[i], style: context.bodySmall),
        ),
      ));
    }
    return TableRow(children: content);
  }
}
