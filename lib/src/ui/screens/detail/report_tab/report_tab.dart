import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:mat2414/utils/show_confirmation_dialog.dart' as utils_alert;
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bottom_sheet;
import 'package:mat2414/utils/date_formatter.dart' as utils_time;
import 'package:mat2414/utils/convert_duration.dart' as utils_cd;
import 'package:mat2414/utils/snackbar_info.dart' as utils_sb;
import 'package:provider/provider.dart';

import 'report_tab_state.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Maybe! It is better to this staff here instead of in initState() when it comes to updating, refreshing UI
    _reportStream =
        Provider.of<ReportTabState>(context, listen: false).watchReport().asBroadcastStream();
    final isLdc = !context.read<SettingsController>().user.preferences.showButtonLDCHours;
    if (isLdc) {
      _timeLDC = _reportStream.map((r) => _formatTime(r.minutesLDC)).distinct();
      _showButtonLDCHours = isLdc;
    }
    _remarks = _reportStream.map((report) => report.remarks).distinct();
    _monthYear = _reportStream.map((report) => _formatDate(report.year, report.month)).distinct();
    _placements = _reportStream.map((report) => report.placements.toString()).distinct();
    _videos = _reportStream.map((report) => report.videos.toString()).distinct();
    _visits = _reportStream.map((report) => report.returnVisits.toString()).distinct();
    _time = _reportStream.map((r) => _formatTime(r.durationInMinutes)).distinct();
    _isReportClosed = _reportStream.map((report) => report.isClosed); // no distinct()!
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _formatDate(int y, int m) {
    final currentLocale = Localizations.localeOf(context).toString();
    return utils_time.dateFormatter(DateTime(y, m), 'M.y', currentLocale);
  }

  String _formatTime(int m) {
    final hoursAndMinutes = utils_cd.minutesDurationToFormattedString(m);
    if (hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
        const SizedBox(height: 4),
        _buildBibleStudiesRow(context),
        if (_showButtonLDCHours) _buildTimeLDC(),
        const SizedBox(height: 4),
        _buildRemarksBtn(),
        _buildRemarksText(context),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(child: _buildDeleteReportBtn()),
          _buildCloseOrCopyReportBtn(),
        ])
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
            return Shimmer(
              child: ShimmerLoading(
                  isLoading: isWaiting,
                  child: Text(snapshot.data ?? '', style: context.labelLarge)),
            );
          }),
    );
  }

  Widget _buildReportCardWrapperWithPadding(BuildContext context, List<Widget> children) {
    final Color borderColor = context.colors.tertiary;
    final Color backgroundColor = context.colors.background;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Card(
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
      ),
    );
  }

  Widget _buildBibleStudiesRow(BuildContext context) {
    var bStudies = AppLocalizations.of(context).generalBibleStudies;
    final tt = context.loc.reportBibleStudiesToolTipWidgetText;
    //  'Use arrows to increase or decrease bible studies quantity. The number you set will be shown the next month. \nFor more information see More/Settings/Help';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Row(children: [
            TooltipWidget(info: tt),
            const SizedBox(width: 8),
            SizedBox(
              width: 150,
              child: Text(bStudies,
                  style: context.bodySmall,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.fade),
            ),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Row(children: [
            // this FittedBox child must have width: !
            FittedBox(child: Image.asset(AssetPath.imgTwoPeronAtTable, height: 22, width: 22)),
            const SizedBox(width: 12),
            Selector<ReportTabState, int>(
                selector: (_, state) => state.monthlyReport.bibleStudies,
                shouldRebuild: (int pre, int next) {
                  return pre != next;
                },
                builder: (BuildContext context, bibleStudies, __) {
                  return Text(bibleStudies.toString(), style: context.bodyLarge);
                }),
            const Expanded(child: SizedBox()),
            Selector<ReportTabState, bool>(
                selector: (_, state) => state.monthlyReport.isClosed,
                shouldRebuild: (bool pre, bool next) {
                  return pre != next;
                },
                builder: (BuildContext context, isClosed, _) {
                  if (isClosed) return const SizedBox.shrink();
                  return SizedBox(
                    height: 60,
                    child: FittedBox(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                padding: const EdgeInsets.all(2.0),
                                tooltip: context.loc.reportIncreaseBibleStudiesBtnToolTip,
                                onPressed: () => Provider.of<ReportTabState>(context, listen: false)
                                    .onBibleStudiesChange(1),
                                icon: const Icon(Icons.keyboard_arrow_up_rounded)),
                            IconButton(
                                padding: const EdgeInsets.all(2.0),
                                tooltip: context.loc.reportDecreaseBibleStudiesBtnToolTip,
                                onPressed: () => Provider.of<ReportTabState>(context, listen: false)
                                    .onBibleStudiesChange(-1),
                                icon: const Icon(Icons.keyboard_arrow_down_rounded))
                          ]),
                    ),
                  );
                }),
          ]),
        ),
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
          return Row(children: [
            const Expanded(flex: 3, child: SizedBox.shrink()),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    FittedBox(child: Image.asset(AssetPath.icEngineer305, height: 20, width: 20)),
                    const SizedBox(width: 12),
                    Text('${snapshot.data}', style: context.bodyLarge),
                  ],
                )),
          ]);
        });
  }

  Widget _buildRemarksBtn() {
    return Selector<ReportTabState, bool>(
        selector: (_, state) => state.monthlyReport.isClosed,
        shouldRebuild: (bool pre, bool next) {
          return pre != next;
        },
        builder: (BuildContext context, isClosed, _) {
          if (isClosed) return const SizedBox.shrink();
          return Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 40,
              child: FittedBox(
                child: RemarksBtn(() => _handleEditRemarks()),
              ),
            ),
          );
        });
  }

  Future<void> _handleEditRemarks() {
    String? updatedRemarks;
    return _openEditRemarksBottomSheet(
            context, context.read<ReportTabState>().monthlyReport.remarks)
        .then((userEditedRemarks) {
      if (userEditedRemarks != null) {
        // if value is null - the remarks was not changed
        updatedRemarks = userEditedRemarks;
        _showConfirmationDialog(context, context.loc.dialogWantToSave).then((userConfirmed) {
          if (userConfirmed) {
            Provider.of<ReportTabState>(context, listen: false)
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
    final String tip = context.loc.reportCopyReportToolTipWidgetText;
    //  'You cannot undo closing the month! You will also not be able to make changes. \nFor more information see More/Settings/Help';
    final copy = context.loc.reportCopyReportBtn;
    final close = context.loc.reportCloseReportBtn;
    final copyWidget = Text(copy, key: ValueKey<String>(copy));
    final closeWidget = Text(close, key: ValueKey<String>(close));
    final copyIcon = Icon(Icons.copy, key: ValueKey<String>('$copy-copyIcon'));
    final closeIcon = Icon(Icons.done_outline_rounded, key: ValueKey<String>('$close-closeIcon'));
    // final w = MediaQuery.of(context).size.width * 0.58;
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
                      handle = () => _handlingCopyReport();
                    }
                    if (!isClosed) {
                      handle = () => _handlingCloseReport();
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
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: TooltipWidget(info: tip),
          ),
        ]);
  }

  void _handlingCopyReport() {
    context.read<ReportTabState>().copyReportToClipboard().then((_) {
      utils_sb.showSnackBarInfo(context, context.loc.reportReportWasCopied);
    });
  }

  void _handlingCloseReport() {
    final time = context.read<ReportTabState>().monthlyReport.durationInMinutes;
    if (time > 60 && time % 60 != 0) {
      // the report will transfer minutes to the next month
      _showConfirmationDialog(
              context, context.loc.dialogCreateReportTransferredMinutesWarning(time % 60))
          .then((userConfirmed) {
        if (userConfirmed) {
          context.read<ReportTabState>().closeReport().then((id) {
            if (id > 0) {
              utils_sb.showSnackBarInfo(
                  context, context.loc.reportTransferredMinutesTxt(time % 60));
            }
          });
        }
      });
    } else {
      context.read<ReportTabState>().closeReport();
    }
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
          if (hasError) return FittedBox(child: Text(context.loc.generalError));
          return TextButton(
            onPressed: isWaiting ? null : () => _handlingDeleteReport(),
            child: Icon(Icons.delete_outline, color: context.colors.error),
          );
        });
  }

  void _handlingDeleteReport() {
    final transferredMin = context.read<ReportTabState>().monthlyReport.transferredMinutes;
    var question = context.loc.dialogWantToDelete;
    if (transferredMin > 0) {
      question = context.loc.dialogDeleteReportTransferredMinutesActivityWillBeDeleted(
          context.read<ReportTabState>().monthlyReport.transferredMinutes);
    }
    _showConfirmationDialog(context, question).then((isAccept) {
      if (isAccept) context.read<ReportTabState>().deleteReport();
    });
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String question) {
    return utils_alert
        .showConfirmationDialog(context, question)
        .then((bool? value) => value ?? false);
  }

  /// if no changes was made (initialValue was not updated) returns null.
  Future<String?> _openEditRemarksBottomSheet(BuildContext context, String? initialValue) async {
    final titleStyle =
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
