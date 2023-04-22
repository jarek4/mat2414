import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';

class ServiceYearCard extends StatelessWidget {
  /// List<Stream<String>> data: [placements, videos, time, return visits, mean bible studies, LDC Time]
  const ServiceYearCard({Key? key, required this.data}) : super(key: key);

  /// Order is important! [placements, videos, time, return visits, mean bible studies, LDC Time]
  final List<Stream<String>> data;

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
    return Column(children: [
      Table(
          key: UniqueKey(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border:
              TableBorder.all(width: 1.1, borderRadius: const BorderRadius.all(Radius.circular(8))),
          children: [
            _buildReportTableHeading(),
            _buildTableDataRow(data),
          ]),
    ]);
  }

  TableRow _buildReportTableHeading() {
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

  TableRow _buildTableDataRow(List<Stream<String>?> dataStream) {
    var content = <Widget>[];
    for (int i = 0; i < dataStream.length; i++) {
      var cell = StreamBuilder<String>(
        stream: dataStream[i],
        initialData: '',
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
          if (snapshot.hasError) return const Center(child: Text('E'));
          final String data = snapshot.data ?? '';
          final style = context.bodySmall
              ?.copyWith(decoration: i == 4 ? TextDecoration.overline : TextDecoration.none);
          return SizedBox(
            height: 24,
            child: Shimmer(
              child: ShimmerLoading(
                  isLoading: isWaiting,
                  child: isWaiting
                      ? Container(height: 24, color: Colors.black)
                      : Center(
                          child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            data,
                            // line above bible studies number - indicates an average value (mean)
                            style: style,
                          ),
                        ))),
            ),
          );
        },
      );
      content.add(cell);
    }

    return TableRow(children: content);
  }
}
