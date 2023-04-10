import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;

class ActivityCard extends StatefulWidget {
  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  final Future<Activity> activity;

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  late Stream<Activity> _activityAsStream;
  late Stream<String>? _formattedDate, _placements, _remarks, _returnVisits, _time, _videoShowings;
  late Stream<ActivityType>? _type;
  var _remarksTxt = 'Remarks', _dateTxt = 'Date', _timeTxt = 'Time';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _remarksTxt = context.loc.generalRemarks;
    _dateTxt = context.loc.generalDate;
    _timeTxt = context.loc.generalTime;
  }

  @override
  void initState() {
    super.initState();

    _activityAsStream = widget.activity.asStream().asBroadcastStream();
    _formattedDate = _activityAsStream
        .map((Activity a) => _makeDateWithDayMonthAbbrAndCreatedTime(a))
        .distinct();
    _type = _activityAsStream.map((Activity a) => a.type).distinct();
    _placements = _activityAsStream.map((Activity a) => a.placements.toString()).distinct();
    _remarks = _activityAsStream.map((Activity a) => a.remarks).distinct();
    _returnVisits = _activityAsStream.map((Activity a) => a.returnVisits.toString()).distinct();
    _time = _activityAsStream.map((Activity a) => _makeTimeString(a.hours, a.minutes)).distinct();
    _videoShowings = _activityAsStream.map((Activity a) => a.videos.toString()).distinct();
  }

  String _makeDateWithDayMonthAbbrAndCreatedTime(Activity a) {
    final activityDate = DateTime(a.year, a.month, a.day, 12, 12);
    try {
      // used for translation month or day name
      final currentLocale = Localizations.localeOf(context).toString();
      final formattedDate = utils.dateFormatter(activityDate, 'EEEE, d MMM', currentLocale);
      final createdAtTime = utils.dateFormatter(a.createdAt, 'H:m', currentLocale);
      // date and time are split with ;
      return '$formattedDate; $createdAtTime';
    } catch (e) {
      final createdAtTime = utils.dateFormatter(a.createdAt, 'H:m');
      final formattedDate = utils.dateFormatter(activityDate, 'EEEE, d MMM');
      // date and time are split with ;
      return '$formattedDate; $createdAtTime';
    }
  }

  String _makeTimeString(int h, int min) {
    final String hoursAndMinutes = Duration(hours: h, minutes: min).hoursAndMinutesString();
    if (hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: double.maxFinite,
        child: Card(
          key: widget.key ?? Key('${widget.activity.hashCode}'),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                border: const Border(top: BorderSide(width: 2.0, color: Colors.orange)),
                color: context.colors.background),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(children: [
                _buildDateAndCreatedAt(),
                ReportDataTable(
                    placements: _placements,
                    returnVisits: _returnVisits,
                    time: _time,
                    videoShowings: _videoShowings),
                StreamBuilder<String>(
                    stream: _remarks,
                    initialData: '',
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(height: 6);
                      }
                      if (snapshot.hasData) return _buildRemarksTextWidget(snapshot.data ?? '');
                      if (snapshot.hasError) return _buildErrorTextWidget();
                      return const SizedBox(height: 6);
                    }),
                StreamBuilder<ActivityType>(
                    stream: _type,
                    initialData: ActivityType.normal,
                    builder: (BuildContext context, AsyncSnapshot<ActivityType> snap) {
                      final type = snap.data ?? ActivityType.normal;
                      if (snap.hasData) return _buildActivityTypeIcon(type);
                      if (snap.hasError) return _buildErrorTextWidget();
                      return const SizedBox.shrink();
                    }),
              ]),
            ),
          ),
        ));
  }

  Widget _buildRemarksTextWidget(String remarks) {
    final bool hasRemarks = remarks.trim().isNotEmpty;
    if (hasRemarks) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text('$_remarksTxt: $remarks',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall),
        ),
      );
    } else {
      return const SizedBox(height: 6);
    }
  }

  Widget _buildActivityTypeIcon(ActivityType type) {
    switch (type) {
      case ActivityType.normal:
        return const SizedBox.shrink();
      case ActivityType.transferred:
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
              child: Image.asset(AssetPath.icTimeTransfer, height: 20, width: 20)),
        );
      case ActivityType.ldc:
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
              child: Image.asset(AssetPath.icEngineer305, height: 20, width: 20)),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Padding _buildDateAndCreatedAt() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
      child: StreamBuilder<String>(
          stream: _formattedDate,
          initialData: '...',
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              final date = context.loc.generalDate;
              return Align(alignment: Alignment.centerLeft, child: Text('$date: ...'));
            }
            if (snapshot.hasData && snapshot.data != null) {
              final List<String> dayAndTime = _separateDateAndTime(snapshot.data);
              return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // formatted date
                Text(dayAndTime[0], style: context.labelMedium, overflow: TextOverflow.ellipsis),
                // formatted created at time
                Text(dayAndTime[1], style: context.labelMedium, overflow: TextOverflow.ellipsis)
              ]);
            }
            if (snapshot.hasError) {
              return Align(alignment: Alignment.centerLeft, child: _buildErrorTextWidget());
            }
            return const SizedBox(height: 6);
          }),
    );
  }

  /// returns Array<String>'monday, 2 jan', '11:05'. String argument have to be split with ;
  List<String> _separateDateAndTime(String? dateString) {
    var separated = <String>['$_dateTxt...', '$_timeTxt...'];
    if (dateString == null) return separated;
    List<String> list = dateString.split(';');
    if (list.isEmpty) return separated;

    if (list[1].isNotEmpty) return separated = [list[0].trim(), list[1].trim()];

    // after split second element in the list in empty
    separated.removeAt(0);
    separated.insert(0, list[0].trim());

    return separated;
  }

  Widget _buildErrorTextWidget() {
    final er = context.loc.generalError;
    return Text(er);
  }
}
