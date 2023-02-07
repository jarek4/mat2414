import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../overview_tab.dart';
import '../report_state_provider.dart';
import '../summary_tab.dart';

class ReportWide extends StatelessWidget {
  const ReportWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 0, crossAxisCount: 2, crossAxisSpacing: 3, childAspectRatio: 3 / 2.0),
      children: [_buildCalendar(), _buildReportTabs(context)],
    );
  }

  Container _buildCalendar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      // constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36),
      // color: Colors.grey,
      child: const CustomCalendarView(),
    );
  }

  Container _buildReportTabs(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: double.maxFinite),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Column(children: [
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.topCenter,
            child: Selector<ReportStateProvider, int>(
                selector: (_, state) => state.wideLayoutTabIndex,
                shouldRebuild: (int pre, int next) {
                  return pre != next;
                },
                builder: (BuildContext context, index, __) {
                  return CustomTabBar(
                    key: const Key('ReportWide'),
                    activeIndex: index,
                    pageNames: context.read<ReportStateProvider>().tabs,
                    onTap: context.read<ReportStateProvider>().onWideTabIndexChange,
                  );
                }),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Consumer<ReportStateProvider>(
                builder: (BuildContext context, ReportStateProvider provider, _) {
              final int index = provider.wideLayoutTabIndex;
              final String sy = provider.selectedDate.serviceYear;

              switch (index) {
                case 0:
                // return Expanded(child: _buildMonthTab(sy));
                  return OverviewTab(sy: [sy, 'man', '$sy-2']);
                case 1:
                  return const SingleChildScrollView(child: SummaryTab());
                default:
                  return const Placeholder();
              }
              /*switch (index) {
                case 0:
                  return Expanded(
                    child: ListView(
                      //shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: AddActivityWidget(handle: () => print('add small')),
                        ),
                        ReportCard(sy: sy),
                        ReportCard(sy: 'man'),
                        ReportCard(sy: '$sy-2'),
                      ],
                    ),
                  );
                case 1:
                  return Expanded(
                    child: ListView(
                        //shrinkWrap: true,
                        children: [const SummaryTab()]),
                  );
                default:
                  return const Placeholder();
              }*/
            }),
          ),
          const SizedBox(height: 4),
        ]));
  }


}
