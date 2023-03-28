import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/report/report_state.dart';
import 'package:mat2414/src/ui/screens/detail/detail_state.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mat2414/utils/show_confirmation_dialog.dart' as utils_alert;
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bottom_sheet;

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  late Stream<Report> _reportStream;

  // Stream<String>? _bibleStudies;
  Stream<String>? _placements;
  Stream<String>? _returnVisits;
  Stream<String>? _time;
  Stream<String>? _videoShowings;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reportStream = Provider.of<ReportState>(context, listen: false).report.stream;
    _reportStream = Provider.of<DetailState>(context, listen: false).reportController.stream;
    // _remarks = _reportStream.map((report) => report.remarks).distinct();
    // _monthAndServiceYear = _reportStream.map((report) => '${report.month}, ${report.serviceYear}').distinct();
    _placements = _reportStream.map((report) => report.placements.toString()).distinct();
    _videoShowings = _reportStream.map((report) => report.videos.toString()).distinct();
    _returnVisits = _reportStream.map((report) => report.returnVisits.toString()).distinct();
    // _bibleStudies = _reportStream.map((report) => report.bibleStudies.toString()).distinct();
    _time = _reportStream.map((r) => _makeTimeString(r.hours, r.minutes)).distinct();
  }

  String _makeTimeString(int h, int min) {
    final String hoursAndMinutes = Duration(hours: h, minutes: min).hoursAndMinutesString();
    if (hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }

  @override
  Widget build(BuildContext context) {
    final CalendarDay date =
        Provider.of<CalendarStateProvider>(context, listen: false).state.selectedDay;
    return ChangeNotifierProxyProvider<CalendarStateProvider, ReportState>(
        create: (_) => ReportState(date),
        update: (_, calendar, reportState) => reportState!..update(calendar.state.selectedDay),
        builder: (BuildContext context, Widget? widget) {
          ReportStateStatus err = ReportStateStatus.error;
          return Selector<ReportState, ReportStateStatus>(
              selector: (_, state) => state.status,
              shouldRebuild: (ReportStateStatus pre, ReportStateStatus next) {
                return pre == err || next == err;
              },
              builder: (BuildContext context, status, _) {
                if (status == err) {
                  return Center(
                    child: TextButton(
                        onPressed: () => Provider.of<ReportState>(context, listen: false).refresh(),
                        child: const Text('Error. Tap here to refresh.')),
                  );
                }
                return Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  // height: 190,
                  // width: double.maxFinite,
                  child: _buildReportCardWrapperWithPadding([
                    _buildTitleWithMonth(),
                    ReportTable(
                      isMonthly: true,
                      placements: _placements,
                      returnVisits: _returnVisits,
                      time: _time,
                      videoShowings: _videoShowings,
                    ),
                    _buildBibleStudiesRow(context),
                    _buildRemarksBtn(),
                    _buildRemarksText(),
                    _buildCopyReportBtn()
                  ]),
                );
              });
        });
  }

  Widget _buildTitleWithMonth() {
    return Align(
      alignment: Alignment.topLeft,
      child: Selector<ReportState, CalendarDay>(
          selector: (_, state) => state.selectedDate,
          shouldRebuild: (CalendarDay pre, CalendarDay next) {
            return pre.month != next.month || pre.year != next.year;
          },
          builder: (BuildContext context, date, _) {
            final int month = date.month;
            final String serviceYear = date.serviceYear;
            return Text('Month: $month, $serviceYear', style: context.labelLarge);
          }),
    );
  }

  Widget _buildReportCardWrapperWithPadding(List<Widget> children) {
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
              // to shrink Card! Without MainAxisSize.min the card is expanded!
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
        // this FittedBox child must have width: !
        FittedBox(
            child:
                Image.asset('assets/images/two_person_table_t_ic512.png', height: 22, width: 22)),
        FittedBox(
          // flex: 4,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Bible studies:', style: context.bodyMedium)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Selector<ReportState, int>(
              selector: (_, state) => state.bibleStudies,
              shouldRebuild: (int pre, int next) {
                return pre != next;
              },
              builder: (BuildContext context, bibleStudies, __) {
                return SizedBox(
                    width: 35, child: Text(bibleStudies.toString(), style: context.bodyLarge));
              }),
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
                    onPressed: () =>
                        Provider.of<ReportState>(context, listen: false).onBibleStudiesChange(1),
                    icon: const Icon(Icons.keyboard_arrow_up_rounded),
                  ),
                  IconButton(
                      padding: const EdgeInsets.all(2.0),
                      tooltip: 'Decrease bible studies quantity',
                      onPressed: () =>
                          Provider.of<ReportState>(context, listen: false).onBibleStudiesChange(-1),
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
          child: RemarksBtn(() => _handleEditRemarks()),
        ),
      ),
    );
  }

  Future<void> _handleEditRemarks() {
    String? updatedRemarks;
    return _openEditRemarksBottomSheet(context, 'data assets/ images/two_person_table_t_ic512.')
        .then((userEditedRemarks) {
      if (userEditedRemarks != null) {
        // if value is null - the remarks was not changed
        updatedRemarks = userEditedRemarks;
        _showConfirmationDialog().then((userConfirmed) {
          if (userConfirmed) {
            /*Provider.of<DetailState>(context, listen: false)
              .onMonthReportRemarksChange(updatedRemarks);*/
          }
        });
      }
    });
  }

  Future<bool> _showConfirmationDialog() {
    return utils_alert
        .showConfirmationDialog(context, 'Do you want to save changes?')
        .then((bool? value) => value ?? false);
  }

  Align _buildRemarksText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        /*child: Text('data assets/ images/two_person_table_t_ic512.\ndata assets',
            style: context.bodySmall, softWrap: true, maxLines: 3, overflow: TextOverflow.ellipsis),*/
        child: Selector<ReportState, ReportStateStatus>(
            selector: (_, state) => state.status,
            shouldRebuild: (ReportStateStatus pre, ReportStateStatus next) {
              return true;
            },
            builder: (BuildContext context, remarks, __) {
              return Text('remarks',
                  style: context.bodySmall,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis);
            }),
      ),
    );
  }

  Row _buildCopyReportBtn() {
    const String tip =
        'You cannot undo closing the month! You will also not be able to make changes. \nFor more information see More/Settings/Help';
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
            child: TooltipWidget(info: tip),
          ),
        ]);
  }

  /// if no changes was made (initialValue not updated) returns null.
  Future<String?> _openEditRemarksBottomSheet(BuildContext context, String? initialValue) async {
    TextStyle titleStyle =
        context.bodyMedium ?? TextStyle(color: context.colors.onSurface, fontSize: 20);
    String? changedRemarks;
    await utils_bottom_sheet.showCustomBottomSheet<String>(
      context,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: titleStyle,
          decoration: const InputDecoration(labelText: 'Remarks:'),
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 6,
          autofocus: true,
          maxLength: 650,
          initialValue: initialValue,
          onChanged: (v) => changedRemarks = v,
        ),
      ),
    );
    return changedRemarks;
  }
}
