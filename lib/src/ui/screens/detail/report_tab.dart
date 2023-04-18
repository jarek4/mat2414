import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/screens/detail/detail_state.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/show_confirmation_dialog.dart' as utils_alert;
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bottom_sheet;
import 'package:mat2414/utils/date_formatter.dart' as utils_time;
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  // subscription to the data stream will notify UI that it needs to be refreshed
  // late StreamSubscription<void> _reportSubscription;
  late Stream<Report> _reportStream;
  Stream<bool>? _isReportClosed;
  Stream<String>? _timeLDC;
  Stream<String>? _remarks;
  Stream<String>? _monthYear;
  Stream<String>? _time;
  Stream<String>? _placements;
  Stream<String>? _videos;
  Stream<String>? _visits;
  var _showButtonLDCHours = false;

  /* @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Maybe! It is better to this staff here instead of in initState() when it comes to updating UI
    _reportStream = Provider.of<DetailState>(context, listen: false).watchReport().asBroadcastStream();
    _remarks = _reportStream.map((report) => report.remarks).distinct(); ...
  }*/

  @override
  void initState() {
    super.initState();
    _reportStream =
        Provider.of<DetailState>(context, listen: false).watchReport().asBroadcastStream();
    final isLdc = !context.read<SettingsController>().user.preferences.showButtonLDCHours;
    if (isLdc) {
      _timeLDC = _reportStream.map((r) => _formatTime(r.hoursLDC, r.minutesLDC)).distinct();
      _showButtonLDCHours = isLdc;
    }
    _remarks = _reportStream.map((report) => report.remarks).distinct();
    _monthYear = _reportStream.map((report) => _formatDate(report.year, report.month)).distinct();
    _placements = _reportStream.map((report) => report.placements.toString()).distinct();
    _videos = _reportStream.map((report) => report.videos.toString()).distinct();
    _visits = _reportStream.map((report) => report.returnVisits.toString()).distinct();
    _time = _reportStream.map((r) => _formatTime(r.hours, r.minutes)).distinct();
    _isReportClosed = _reportStream.map((report) => report.isClosed); // no distinct()!
  }

/*  @override
  void dispose() {
    super.dispose();
  }*/

  String _formatDate(int y, int m) {
    final currentLocale = Localizations.localeOf(context).toString();
    return utils_time.dateFormatter(DateTime(y, m), 'M.y', currentLocale);
  }

  String _formatTime(int h, int m) {
    if (h == 0 && m == 0) return '0:00';
    final String hoursAndMinutes = Duration(hours: h, minutes: m).hoursAndMinutesString();
    if (hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      // height: 190,
      // width: double.maxFinite,
      child: _buildReportCardWrapperWithPadding(context, [
        _buildHeaderWithDate(),
        const SizedBox(height: 4),
        ReportDataTable(
          placements: _placements,
          returnVisits: _visits,
          time: _time,
          videoShowings: _videos,
          isMonthly: true,
        ),
        _buildBibleStudiesRow(context),
        if (_showButtonLDCHours) _buildTimeLDC(),
        _buildRemarksBtn(),
        _buildRemarksText(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: _buildDeleteReportBtn()),
            _buildCloseOrCopyReportBtn(),
          ],
        )
      ]),
    );
  }

  Widget _buildHeaderWithDate() {
    return Align(
      alignment: Alignment.topLeft,
      child: StreamBuilder<String?>(
          stream: _monthYear,
          initialData: '...',
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
            // print('_monthAndServiceYear StreamBuilder');
            return Shimmer(
              child: ShimmerLoading(
                  isLoading: isWaiting,
                  child: Text(snapshot.data ?? '', style: context.labelLarge)),
            );
          }),
    );
    /*   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      StreamBuilder<String?>(
          stream: _monthYear,
          initialData: '...',
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
            // print('_monthAndServiceYear StreamBuilder');
            return Shimmer(
              child: ShimmerLoading(
                  isLoading: isWaiting,
                  child: Text(snapshot.data ?? '', style: context.labelLarge)),
            );
          }),
      _buildDeleteReportBtn(),
    ],);*/
  }

  Widget _buildReportCardWrapperWithPadding(BuildContext context, List<Widget> children) {
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
    var bStudies = AppLocalizations.of(context).generalBibleStudies;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // this FittedBox child must have width: !
        FittedBox(child: Image.asset(AssetPath.imgTwoPeronAtTable, height: 22, width: 22)),
        Selector<DetailState, int>(
            selector: (_, state) => state.monthlyReport.bibleStudies,
            shouldRebuild: (int pre, int next) {
              return pre != next;
            },
            builder: (BuildContext context, bibleStudies, __) {
              return SizedBox(
                  width: 35, child: Text(bibleStudies.toString(), style: context.bodyLarge));
            }),
        FittedBox(
          // flex: 4,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(bStudies, style: context.bodyMedium)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          /*Selector<DetailState, int>(
              selector: (_, state) => state.monthlyReport.bibleStudies,
              shouldRebuild: (int pre, int next) {
                return pre != next;
              },
              builder: (BuildContext context, bibleStudies, __) {
                return SizedBox(
                    width: 35, child: Text(bibleStudies.toString(), style: context.bodyLarge));
              }),*/
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
                          Provider.of<DetailState>(context, listen: false).onBibleStudiesChange(1),
                      icon: const Icon(Icons.keyboard_arrow_up_rounded),
                    ),
                    IconButton(
                        padding: const EdgeInsets.all(2.0),
                        tooltip: 'Decrease bible studies quantity',
                        onPressed: () => Provider.of<DetailState>(context, listen: false)
                            .onBibleStudiesChange(-1),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded))
                  ]),
            ),
          ),
        ]),
        const TooltipWidget(
            info:
                'Use arrows to increase or decrease bible studies quantity. The number you set will be shown the next month. \nFor more information see More/Settings/Help'),
      ],
    );
  }

  Widget _buildTimeLDC() {
    return StreamBuilder<String?>(
        stream: _timeLDC,
        initialData: '0:00',
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          final zeroTime =
              snapshot.data == '0:00' || snapshot.data == null || snapshot.data!.isEmpty;
          if (zeroTime) return const SizedBox.shrink();
          return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            FittedBox(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 18),
                  child: Image.asset(AssetPath.icEngineer305, height: 20, width: 20)),
            ),
            Text('${snapshot.data}', style: context.bodyLarge)
          ]);
        });
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
    // context.read<DetailState>().monthlyReport.remarks
    return _openEditRemarksBottomSheet(context, context.read<DetailState>().monthlyReport.remarks)
        .then((userEditedRemarks) {
      if (userEditedRemarks != null) {
        // if value is null - the remarks was not changed
        updatedRemarks = userEditedRemarks;
        _showConfirmationDialog(context, context.loc.dialogWantToSave).then((userConfirmed) {
          if (userConfirmed) {
            Provider.of<DetailState>(context, listen: false)
                .onMonthReportRemarksChange(updatedRemarks);
          }
        });
      }
    });
  }

  Align _buildRemarksText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: StreamBuilder<String?>(
          stream: _remarks,
          initialData: '...',
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
            return Shimmer(
              child: ShimmerLoading(
                  isLoading: isWaiting,
                  child: Text('${snapshot.data}',
                      style: context.bodySmall,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)),
            );
          }),
    );
  }

  Row _buildCloseOrCopyReportBtn() {
    const String tip =
        'You cannot undo closing the month! You will also not be able to make changes. \nFor more information see More/Settings/Help';
    final copy = context.loc.reportCopyReportBtn;
    final close = context.loc.reportCloseReportBtn;
    final copyWidget = Text(copy, key: ValueKey<String>(copy));
    final closeWidget = Text(close, key: ValueKey<String>(close));
    final copyIcon = Icon(Icons.copy, key: ValueKey<String>('$copy-copyIcon'));
    final closeIcon = Icon(Icons.done_outline_rounded, key: ValueKey<String>('$close-closeIcon'));
    final w = MediaQuery.of(context).size.width * 0.58;
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              height: 40,
              width: 180,
              child: StreamBuilder<bool>(
                  stream: _isReportClosed,
                  initialData: false,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
                    final bool isClosed = snapshot.data ?? false;
                    VoidCallback? handle;
                    if (!isWaiting && isClosed) {
                      handle = () {
                        Provider.of<DetailState>(context, listen: false)
                            .copyReportToClipboard()
                            .then((_) {
                          /// TODO: handle copied or not
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                              //margin: EdgeInsets.symmetric(vertical: double.maxFinite),
                              content: Text(
                                context.loc.reportReportWasCopied,
                                textAlign: TextAlign.center,
                              )));
                        });
                      };
                    }
                    if (!isClosed) {
                      handle = () => Provider.of<DetailState>(context, listen: false).closeReport();
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('${context.loc.generalError}!'));
                    }
                    return AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: OutlinedButton.icon(
                          onPressed: isWaiting ? null : handle,
                          icon: isClosed ? copyIcon : closeIcon,
                          label: isClosed ? copyWidget : closeWidget),
                    );
                  }),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: TooltipWidget(info: tip),
          ),
        ]);
  }

  Widget _buildDeleteReportBtn() {
    return StreamBuilder<bool>(
        stream: _isReportClosed,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          final isWaiting = snapshot.connectionState == ConnectionState.waiting;
          final hasError = snapshot.hasError;
          final isClosed = snapshot.data ?? false;
          if (hasError || !isClosed) return const SizedBox.shrink();
              /*return TextButton(
                onPressed: () => print('delete'), child: const Icon(Icons.delete_outline));*/
          if (hasError) return FittedBox(child: Text(context.loc.generalError));
          return TextButton(
              onPressed: isWaiting ? null : () => _showConfirmationDialog(context, context.loc.dialogWantToDelete).then((userConfirmed) {
                if (userConfirmed) {
                  // Provider.of<DetailState>(context, listen: false)
                  //     .onMonthReportRemarksChange(updatedRemarks);
                  print('confirmed');
                  context.read<DetailState>().deleteReport();
                }
              }),
              child: Icon(Icons.delete_outline, color: context.colors.error),
          );
        });
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String question) {
    return utils_alert
        .showConfirmationDialog(context, question)
        .then((bool? value) => value ?? false);
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
            decoration: InputDecoration(labelText: '${context.loc.generalRemarks}:'),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 6,
            autofocus: true,
            maxLength: 650,
            initialValue: initialValue,
            onChanged: (v) => changedRemarks = v),
      ),
    );
    return changedRemarks;
  }
}
