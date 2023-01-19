import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';
import 'layouts/month_narrowed.dart';
import 'layouts/month_wide.dart';
import 'month_screen_state_provider.dart';

class MonthScreen extends StatefulWidget {
  const MonthScreen({Key? key}) : super(key: key);

  @override
  State<MonthScreen> createState() => _MonthScreenState();
}

class _MonthScreenState extends State<MonthScreen> {

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    CalendarDay selected = Provider.of<CalendarStateProvider>(context).state.selectedDay;
    return ChangeNotifierProxyProvider<CalendarStateProvider, MonthScreenStateProvider>(
        create: (_) => MonthScreenStateProvider(selected),
        update: (_, calendar, msp) => msp!..update(calendar.state.selectedDay),
        builder: (BuildContext context, _) {
          return LayoutBuilder(builder: (context, constraints) {
            if (constraints.isMobile || isPortrait) {
              // return _mobileView(context, constraints);
              final bool isWide = constraints.isTablet;
              final double maxH = constraints.maxHeight;
              return MonthNarrowed(isWide: isWide, maxHeight: maxH);
            }
            // return _wideView(context, constraints);
            return const MonthWide();
          });
        },
    );
  }

 /* Widget _mobileView(BuildContext context, BoxConstraints constraints) {
    bool isWide = constraints.isTablet;
    // double maxH = constraints.maxHeight;
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
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36 - 28.0),
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
                            child: CustomTabBar(
                              key: Key('MonthScreen'),
                              pageNames: ['Month view', 'Summary'],
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: AddActivityWidget(handle: ()=>print('add small')),
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: ListView(
                              //shrinkWrap: true,
                              children: const [
                                ActivityCard(),
                                ActivityCard(),
                                ActivityCard(),
                              ],
                            ),
                          ),
                        ]))),
          ],
        ));
  }*/

  /*Widget _wideView(BuildContext context, BoxConstraints constraints) {
    //  print('_wideView isTablet ${constraints.isTablet}');
    bool isWide = constraints.isTablet;
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 0, crossAxisCount: 2, crossAxisSpacing: 3, childAspectRatio: 3 / 2.4),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.topCenter,
                child: CustomTabBar(
                  pageNames: ['Month view', 'Summary'],
                  onTap: () {},
                ),
              ),
              FittedBox(child: Text('Hello!', style: context.textTheme.headlineSmall)),
            ]))
      ],
    );
  }*/

}
