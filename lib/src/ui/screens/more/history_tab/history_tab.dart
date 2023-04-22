import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/report_simple_view.dart';
import 'package:mat2414/src/ui/widgets/service_year_card.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:mat2414/utils/convert_duration.dart' as utils_cd;
import 'package:mat2414/utils/date_formatter.dart' as utils_df;

import 'package:provider/provider.dart';

import 'history_tab_state.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _buildSelectServiceYear(context), // label and dropdown in row
        _buildServiceYearReportCard(), // card with table
        _buildServiceYearReports(context), // list of given service year monthly reports
      ]),
    );
  }

  Row _buildSelectServiceYear(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 20),
      // label
      Text(context.loc.generalServiceYear),
      const SizedBox(width: 20),
      // dropdown select
      FutureBuilder<UnmodifiableListView<String>>(
          future: context.read<HistoryTabState>().readStoredServiceYears(),
          initialData: UnmodifiableListView<String>(['']),
          builder: (context, snapshot) {
            final isWaiting = snapshot.connectionState == ConnectionState.waiting;
            final items = snapshot.data?.toList() ?? [''];
            return Shimmer(
              child: ShimmerLoading(
                isLoading: isWaiting,
                child: isWaiting
                    ? _buildOnWaitShimmerBox(context)
                    : _buildServiceYearDropdown(context, items),
              ),
            );
          }),
    ]);
  }

  Widget _buildServiceYearDropdown(BuildContext context, List<String> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: _buildDropdownBoxDecoration(context),
      height: 45,
      width: 150,
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        hint: const Text('select'),
        dropdownColor: context.colors.secondaryContainer.withOpacity(0.94),
        value: context.watch<HistoryTabState>().selectedServiceYear,
        items: items.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
        onChanged: (v) => context.read<HistoryTabState>().onServiceYearChange(v),
      ),
    );
  }

  Widget _buildOnWaitShimmerBox(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6.0), // to keep the height constant (when is/is not waiting)
        decoration: _buildDropdownBoxDecoration(context),
        height: 41,
        width: 150);
  }

  BoxDecoration _buildDropdownBoxDecoration(BuildContext context) => BoxDecoration(
      color: context.colors.secondaryContainer,
      borderRadius: const BorderRadius.all(Radius.circular(25)));

  Widget _buildServiceYearReportCard() {
    return Selector<HistoryTabState, String?>(
        selector: (_, state) => state.selectedServiceYear,
        shouldRebuild: (String? pre, String? next) {
          return pre != next;
        },
        builder: (BuildContext context, _, __) {
          final stream = context.read<HistoryTabState>().serviceYear().asBroadcastStream();
          final ldcTime = stream.map((sy) => _formatTime(sy.minutesLDC)).distinct();
          final meanStudies = stream.map((sy) => sy.bibleStudies.toString()).distinct();
          final placements = stream.map((sy) => sy.placements.toString()).distinct();
          final returns = stream.map((sy) => sy.returnVisits.toString()).distinct();
          final time = stream.map((sy) => _formatTime(sy.durationInMinutes)).distinct();
          final videos = stream.map((sy) => sy.videos.toString()).distinct();
          return ServiceYearCard(data: [placements, videos, time, returns, meanStudies, ldcTime]);
        });
  }

  Widget _buildServiceYearReports(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 4.0),
        child: SingleChildScrollView(
          child: ExpansionPanelList.radio(elevation: 0, children: [
            ExpansionPanelRadio(
              backgroundColor: context.colors.background,
              value: 'unique ExpansionPanelRadio buildServiceYearReports',
              headerBuilder: (context, isExpanded) => const ListTile(title: Text('months:')),
              body: Selector<HistoryTabState, HistoryTabStatus>(
                  selector: (_, state) => state.status,
                  shouldRebuild: (HistoryTabStatus pre, HistoryTabStatus next) {
                    return pre != next;
                  },
                  builder: (BuildContext context, status, __) {
                    final isLoading = status == HistoryTabStatus.loading;
                    if (isLoading) return _buildIndicator();
                    return _buildReportsList(context.read<HistoryTabState>().reports());
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildReportsList(Stream<UnmodifiableListView<Report>> stream) {
    return StreamBuilder<UnmodifiableListView<Report>>(
      stream: stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<UnmodifiableListView<Report>> snapshot) {
        if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
          final data = snapshot.data ?? [];
          return ExpansionPanelList.radio(
              expandedHeaderPadding: EdgeInsets.zero,
              elevation: 0,
              children: data.map((r) => _monthReportView(context, r)).toList());
        }
        if (snapshot.data == null || snapshot.data!.isEmpty) return const SizedBox();
        return const Text('Loading...');
      },
    );
  }

  Widget _buildIndicator() => const Center(child: CircularProgressIndicator.adaptive());

  ExpansionPanel _monthReportView(BuildContext context, Report report) {
    final locale = Localizations.localeOf(context).toString();
    final name = utils_df.dateFormatter(DateTime(report.year, report.month), 'MMMM', locale);
    final p = report.placements.toString(),
        v = report.videos.toString(),
        t = _formatTime(report.durationInMinutes),
        r = report.returnVisits.toString(),
        b = report.bibleStudies.toString(),
        ldc = _formatTime(report.minutesLDC);
    return ExpansionPanelRadio(
      backgroundColor: context.colors.background,
      value: report,
      headerBuilder: (context, isExpanded) => ListTile(dense: true, title: Text(name)),
      body: ListTile(
        title: ReportSimpleView(data: [p, v, t, r, b, ldc]),
      ),
    );
  }

  String _formatTime(int m) => utils_cd.minutesDurationToFormattedString(m, false);
}
