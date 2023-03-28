import 'package:flutter/material.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import 'layouts/detail_narrowed.dart';
import 'layouts/detail_wide.dart';
import 'detail_state.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final CalendarDay selected = Provider.of<CalendarStateProvider>(context, listen: false).state.selectedDay;
    return ChangeNotifierProxyProvider<CalendarStateProvider, DetailState>(
      create: (_) => DetailState(selected),
      update: (_, calendar, detailState) => detailState!..update(calendar.state.selectedDay),
      builder: (BuildContext context, _) {
        return LayoutBuilder(builder: (context, constraints) {
          if (constraints.isMobile || isPortrait) {
            // return _mobileView(context, constraints);
            final bool isWide = constraints.isTablet;
            final double maxH = constraints.maxHeight;
            return ReportNarrowed(isWide: isWide, maxHeight: maxH);
          }
          return const ReportWide();
        });
      },
    );
  }
}
