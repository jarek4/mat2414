import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/screens/detail/report_tab/report_tab_state.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import 'activity_tab/activity_tab_state.dart';
import 'layouts/detail_narrowed.dart';
import 'layouts/detail_wide.dart';
import 'detail_state.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final CalendarDay selected =
        Provider.of<CalendarStateProvider>(context, listen: false).state.selectedDay;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetailState>(create: (_) => DetailState()),
        ChangeNotifierProxyProvider<CalendarStateProvider, ActivityTabState>(
          create: (_) => ActivityTabState(selected),
          update: (_, calendar, activityState) =>
              activityState!..update(calendar.state.selectedDay),
        ),
        ChangeNotifierProxyProvider<CalendarStateProvider, ReportTabState>(
          create: (_) => ReportTabState(selected),
          update: (_, calendar, reportState) => reportState!..update(calendar.state.selectedDay),
        ),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.isMobile || isPortrait) {
          // return _mobileView(context, constraints);
          final bool isWide = constraints.isTablet;
          final double maxH = constraints.maxHeight;
          return DetailNarrowed(isWide: isWide, maxHeight: maxH);
        }
        return const DetailWide();
      }),
    );
  }
}
