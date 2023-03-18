import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../overview_tab.dart';
import '../report_state_provider.dart';
import '../summary_tab.dart';

class ReportNarrowed extends StatelessWidget {
  const ReportNarrowed({Key? key, required this.isWide, required this.maxHeight}) : super(key: key);

  final bool isWide;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final double headerH = maxHeight * 0.36 - 28.0;
    return Container(
      color: context.colors.primaryContainer,
      constraints: const BoxConstraints(maxHeight: double.maxFinite, minWidth: double.maxFinite),
      child: Column(children: [
        const SizedBox(height: 28.0),
        Align(alignment: Alignment.topCenter, child: _buildScreenHeader(context, headerH)),
        Expanded(child: _buildScreenBody(context)),
        // _buildScreenBody(context),
      ]),
    );
  }

  Container _buildScreenHeader(BuildContext context, double height) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isWide ? 68 : 1.0, vertical: isWide ? 8 : 1),
      constraints: BoxConstraints(
        // maxHeight: maxHeight * 0.36 - 28.0,
        maxHeight: height,
        maxWidth: isWide ? width * 0.7 : width * 0.90,
      ),
      child: const CustomCalendarView(),
    );
  }

  Container _buildScreenBody(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.maxFinite),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius:
            const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
          children: [
            const SizedBox(height: 12.0),
            Align(
              alignment: Alignment.topCenter,
              child: Selector<ReportStateProvider, int>(
                  selector: (_, state) => state.tabIndex,
                  shouldRebuild: (int pre, int next) {
                    return pre != next;
                  },
                  builder: (BuildContext context, index, _) {
                    return CustomTabBar(
                      key: const Key('ReportNarrowed'),
                      activeIndex: index,
                      pageNames: context.read<ReportStateProvider>().tabs,
                      onTap: context.read<ReportStateProvider>().onTabIndexChange,
                    );
                  }),
            ),
            const SizedBox(height: 8),
            Flexible(
                child: Selector<ReportStateProvider, int>(
                    selector: (_, state) => state.tabIndex,
                    shouldRebuild: (int pre, int next) {
                      return pre != next;
                    },
                    builder: (BuildContext context, index, __) {
                      switch (index) {
                        case 0:
                          return const OverviewTab();
                        case 1:
                          return const SummaryTab();
                        default:
                          return const OverviewTab();
                      }
                    }))
          ]),
    );
  }
}
