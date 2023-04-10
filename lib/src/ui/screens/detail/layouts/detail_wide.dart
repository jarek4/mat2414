import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../activity_tab.dart';
import '../detail_state.dart';
import '../report_tab.dart';

class DetailWide extends StatelessWidget {
  const DetailWide({Key? key}) : super(key: key);

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
            child: Selector<DetailState, int>(
                selector: (_, state) => state.tabIndex,
                shouldRebuild: (int pre, int next) {
                  return pre != next;
                },
                builder: (BuildContext context, index, __) {
                  return CustomTabBar(
                      key: const Key('DetailWideLayout'),
                      activeIndex: index,
                      pageNames: context.read<DetailState>().tabs,
                      onTap: context.read<DetailState>().onTabIndexChange);
                }),
          ),
          const SizedBox(height: 4),
          Expanded(
              child: Selector<DetailState, int>(
                  selector: (_, state) => state.tabIndex,
                  shouldRebuild: (int pre, int next) {
                    return pre != next;
                  },
                  builder: (BuildContext context, index, __) {
                    switch (index) {
                      case 0:
                        return const ActivityTab();
                      case 1:
                        return const SingleChildScrollView(child: ReportTab());
                      default:
                        return const ActivityTab();
                    }
                  })),
          const SizedBox(height: 4),
        ]));
  }
}
