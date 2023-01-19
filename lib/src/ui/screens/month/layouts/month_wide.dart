import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../month_screen_state_provider.dart';
import '../summary_view.dart';

class MonthWide extends StatelessWidget {
  const MonthWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 0, crossAxisCount: 2, crossAxisSpacing: 3, childAspectRatio: 3 / 2.0),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          // constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36),
          // color: Colors.grey,
          child: const CustomCalendarView(),
        ),
        Container(
            constraints: const BoxConstraints(minWidth: double.maxFinite),
            decoration: BoxDecoration(
              color: context.colors.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Column(children: [
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topCenter,
                child: Selector<MonthScreenStateProvider, int>(
                    selector: (_, provider) => provider.wideLayoutTabIndex,
                    shouldRebuild: (int pre, int next) {
                      return pre != next;
                    },
                    builder: (BuildContext context, index, __) {
                      return CustomTabBar(
                        key: Key('MonthWide'),
                        activeIndex: index,
                        pageNames: ['Month view', 'Summary'],
                        onTap: context.read<MonthScreenStateProvider>().onWideTabIndexChange,
                      );
                    }
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: AddActivityWidget(handle: ()=>print('add small')),

              ),
              const SizedBox(height: 4),
              Consumer<MonthScreenStateProvider>(
                  builder: (BuildContext context, MonthScreenStateProvider provider, _) {
                    final int index = provider.wideLayoutTabIndex;
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
                        return Expanded(
                          child: ListView(
                            //shrinkWrap: true,
                              children: [const SummaryView()]),
                        );
                      default:
                        return const Placeholder();
                    }
                  }),
              const SizedBox(height: 4),
            ]))
      ],
    );
  }
}
