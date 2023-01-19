import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../month_screen_state_provider.dart';
import '../summary_view.dart';

class MonthNarrowed extends StatelessWidget {
  const MonthNarrowed({Key? key, required this.isWide, required this.maxHeight}) : super(key: key);

  final bool isWide;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.colors.primaryContainer,
        constraints: const BoxConstraints(maxHeight: double.maxFinite, minWidth: double.maxFinite),
        child: Column(
          children: [
            const SizedBox(height: 28.0),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: isWide ? 68 : 18.0, vertical: isWide ? 18 : 1),
                constraints: BoxConstraints(maxHeight: maxHeight * 0.36 - 28.0),
                child: const CustomCalendarView(),
              ),
            ),
            Expanded(
                child: Container(
                    constraints: const BoxConstraints(minWidth: double.maxFinite),
                    decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(height: 12.0),
                          Align(
                            alignment: Alignment.topCenter,
                            // child: _tapBar(constraints, context),
                            child: Selector<MonthScreenStateProvider, int>(
                                selector: (_, provider) => provider.narrowedLayoutTabIndex,
                                shouldRebuild: (int pre, int next) {
                                  return pre != next;
                                },
                                builder: (BuildContext context, index, __) {
                                return CustomTabBar(
                                  key: Key('MonthNarrowed'),
                                  activeIndex: index,
                                  pageNames: ['Month view', 'Summary'],
                                  onTap: context.read<MonthScreenStateProvider>().onNarrowedTabIndexChange,
                                );
                              }
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Consumer<MonthScreenStateProvider>(
                                builder: (BuildContext context, MonthScreenStateProvider provider, _) {
                                return AddActivityWidget(handle: () => print('add small'));
                              }
                            ),
                          ),
                          const SizedBox(height: 4),
                          Consumer<MonthScreenStateProvider>(
                              builder: (BuildContext context, MonthScreenStateProvider provider, _) {
                            final int index = provider.narrowedLayoutTabIndex;
                            final String sy = provider.selectedDate.serviceYear;
                            switch (index) {
                              case 0:
                                return Expanded(
                                  child: ListView(
                                    //shrinkWrap: true,
                                    children: [
                                      ReportCard(sy: sy),
                                      ReportCard(sy: 'man'),
                                      ReportCard(sy: '$sy-2'),
                                    ],
                                  ),
                                );
                              case 1:
                                return Expanded(child: const SummaryView());
                              default:
                                return const Placeholder();
                            }
                            /*return Expanded(
                              child: ListView(
                                //shrinkWrap: true,
                                children: const [
                                  ActivityCard(),
                                  ActivityCard(),
                                  ActivityCard(),
                                ],
                              ),
                            );*/
                          }),
                        ]))),
          ],
        ));
  }
}
