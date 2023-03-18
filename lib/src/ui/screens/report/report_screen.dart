import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import 'layouts/report_narrowed.dart';
import 'layouts/report_wide.dart';
import 'report_state_provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    CalendarDay selected = Provider.of<CalendarStateProvider>(context, listen: false).state.selectedDay;
    return ChangeNotifierProxyProvider<CalendarStateProvider, ReportStateProvider>(
      create: (_) => ReportStateProvider(selected),
      update: (_, calendar, msp) => msp!..update(calendar.state.selectedDay),
      builder: (BuildContext context, _) {
        return LayoutBuilder(builder: (context, constraints) {
          if (constraints.isMobile || isPortrait) {
            // return _mobileView(context, constraints);
            final bool isWide = constraints.isTablet;
            final double maxH = constraints.maxHeight;
            return ReportNarrowed(isWide: isWide, maxHeight: maxH);
          }
          // return _wideView(context, constraints);
          return const ReportWide();
        });
      },
    );
  }
}
