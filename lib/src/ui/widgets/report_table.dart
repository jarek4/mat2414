import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';

/// data = List<int>[placements, videoShowings, returnVisits]. duration=Duration(hours: 1, minutes: 15)
class ReportTable extends StatelessWidget {
  const ReportTable({
    required this.placements,
    required this.returnVisits,
    required this.time,
    required this.videoShowings,
    this.isMonthly = false,
    /*this.data = const [0, 0, 0],
    this.duration = const Duration(hours: 0, minutes: 1),*/
    Key? key,
  }) : super(key: key);

  final Stream<String>? placements, returnVisits, time, videoShowings;

  // final Stream<String>? returnVisits;
  // final Stream<String>? time;
  // final Stream<String>? videoShowings;

  final bool isMonthly;

  // final Duration duration;
  // final List<int> data;
/*
  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {*/
  @override
  Widget build(BuildContext context) {
    return Table(
        key: UniqueKey(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border:
            TableBorder.all(width: 1.1, borderRadius: const BorderRadius.all(Radius.circular(8))),
        children: [
          _buildHeader(context),
          _buildDataRows(context),
        ]);
  }

  TableRow _buildHeader(BuildContext context) {
    String placementsTitle = 'Placements',
        returnsTitle = 'Return Visits',
        hoursTitle = 'Hours',
        videosTitle = 'Video Showings';
    placementsTitle = AppLocalizations.of(context)?.generalPlacements ?? placementsTitle;
    returnsTitle = AppLocalizations.of(context)?.generalReturnVisits ?? returnsTitle;
    hoursTitle = AppLocalizations.of(context)?.generalHour(2) ?? hoursTitle;
    videosTitle = AppLocalizations.of(context)?.generalVideoShowings ?? videosTitle;
    final List<Map<String, dynamic>> headers = [
      {'title': placementsTitle, 'icon': Image.asset(AssetPath.imgMagazine512, height: 12)},
      {'title': videosTitle, 'icon': Image.asset(AssetPath.imgVideoCamera512, height: 12)},
      {'title': hoursTitle, 'icon': Image.asset(AssetPath.imgHourglass512, height: 12)},
      {'title': returnsTitle, 'icon': Image.asset(AssetPath.imgTwoPersons512, height: 12)},
    ];
    final TextStyle? style =
        context.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 9);
    final TextStyle? monthlyStyle = context.labelMedium?.copyWith(fontWeight: FontWeight.w500 ,fontSize: 8.5);

    List<Widget> rows = [];
    for (Map<String, dynamic> m in headers) {
      rows.add(Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.5, bottom: 3),
                child: Text(m['title'],
                    textAlign: TextAlign.center, style: isMonthly ? monthlyStyle : style),
              ),
              isMonthly ? FittedBox(child: m['icon']) : const SizedBox.shrink(),
            ],
          ),
        ),
      ));
    }
    return TableRow(children: rows);
  }

  TableRow _buildDataRows(BuildContext context) {
    return TableRow(children: [
      _TableDataCell(data: placements, isMonthlyReport: isMonthly), // Placements
      _TableDataCell(data: videoShowings, isMonthlyReport: isMonthly), // Video Showings
      _TableDataCell(data: time, isMonthlyReport: isMonthly), // Hours
      _TableDataCell(data: returnVisits, isMonthlyReport: isMonthly), // Return Visits
      // _buildDataCell(context, data.first.toString()), // Placements
      // _buildDataCell(context, data[1].toString()), // Video Showings
      // _buildDataCell(context, _makeTime(duration)), // Hours
      // _buildDataCell(context, data.last.toString()), // Return Visits
    ]);
  }
/*
  String _makeTime(Duration duration) {
    final String hoursAndMinutes = duration.hoursAndMinutesString();
    if (hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }

  Widget _buildDataCell(BuildContext context, String value) {
    final TextStyle monthlyStyle =
        context.bodySmall?.copyWith(fontWeight: FontWeight.w500) ?? const TextStyle();
    final TextStyle style =
        context.bodySmall?.copyWith(fontWeight: FontWeight.w500, fontSize: 10) ?? const TextStyle();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
          child: Text(value, textAlign: TextAlign.center, style: isMonthly ? monthlyStyle : style)),
    );
  }*/
}

class _TableDataCell extends StatefulWidget {
  const _TableDataCell({
    required this.data,
    required this.isMonthlyReport,
    Key? key,
  }) : super(key: key);

  final Stream<String>? data;
  final bool isMonthlyReport;

  @override
  State<_TableDataCell> createState() => _TableDataCellState();
}

class _TableDataCellState extends State<_TableDataCell> {
  TextStyle? noMonthlyStyle;
  TextStyle? monthlyStyle;
  Stream<String>? _dataStream;

  @override
  void initState() {
    super.initState();
    _dataStream = widget.data;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    noMonthlyStyle = context.bodySmall?.copyWith(fontWeight: FontWeight.w500, fontSize: 10);
    monthlyStyle = context.bodySmall?.copyWith(fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    // Text('value', textAlign: TextAlign.center, style: isMonthlyReport ? monthlyStyle : noMonthlyStyle))
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: StreamBuilder<String>(
          stream: _dataStream,
          initialData: '?',
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
            if (snapshot.hasError) return const Center(child: Text('E'));
            final String data = snapshot.data ?? '';
            return Shimmer(
              child: ShimmerLoading(
                isLoading: isWaiting,
                child: Text(data,
                    textAlign: TextAlign.center,
                    style: widget.isMonthlyReport ? monthlyStyle : noMonthlyStyle),
              ),
            );
          },
        ),
      ),
    );
  }
}
