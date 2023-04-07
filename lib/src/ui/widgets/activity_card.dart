import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/data/models/models.dart';
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
  var _deleteTxt = 'Delete', _remarksTxt = 'Remarks';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _deleteTxt = AppLocalizations.of(context)?.generalDelete ?? _deleteTxt;
    _remarksTxt = AppLocalizations.of(context)?.generalRemarks ?? _remarksTxt;
  }

  @override
  void initState() {
    super.initState();
    _activityAsStream = widget.activity.asStream().asBroadcastStream();
    _formattedDate = _activityAsStream
        .map((Activity a) => _makeDateWithDayMonthAbbrAndCreatedTime(a))
        .distinct();
    _placements = _activityAsStream.map((Activity a) => a.placements.toString()).distinct();
    _remarks = _activityAsStream.map((Activity a) => a.remarks).distinct();
    _returnVisits = _activityAsStream.map((Activity a) => a.returnVisits.toString()).distinct();
    _time = _activityAsStream.map((Activity a) => _makeTimeString(a.hours, a.minutes)).distinct();
    _videoShowings = _activityAsStream.map((Activity a) => a.videos.toString()).distinct();
  }

  String _makeDateWithDayMonthAbbrAndCreatedTime(Activity a) {
    final activityDate = DateTime(a.year, a.month, a.day);
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

  List<String> _separateDateAndTime(String? dateString) {
    List<String> separated = ['date...', 'time...'];
    if (dateString == null) return separated;
    List<String> list = dateString.split(';');
    if (list.isEmpty) return separated;

    if (list[0].isNotEmpty) separated.insert(0, list[0].trim());
    if (list[1].isNotEmpty) separated.insert(1, list[1].trim());

    return separated;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        // height: 190,
        width: double.maxFinite,
        child: Card(
          key: widget.key ?? Key('${widget.activity.hashCode}'),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(width: 2.0, color: Colors.orange),
              ),
              color: context.colors.background,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6),
                  child: StreamBuilder<String>(
                      stream: _formattedDate,
                      initialData: '...',
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Align(
                              alignment: Alignment.centerLeft, child: Text('Date: ...'));
                        }
                        if (snapshot.hasData) {
                          final List<String> dayAndTime = _separateDateAndTime(snapshot.data);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(dayAndTime[0],
                                  style: context.labelMedium, overflow: TextOverflow.ellipsis),
                              Text(dayAndTime[1],
                                  style: context.labelMedium, overflow: TextOverflow.ellipsis)
                            ],
                          );
                        }
                        if (snapshot.hasError) {
                          return const Align(
                              alignment: Alignment.centerLeft, child: Text('Date: Error'));
                        }
                        return const SizedBox(height: 6);
                      }),
                ),
                ReportTable(
                  placements: _placements,
                  returnVisits: _returnVisits,
                  time: _time,
                  videoShowings: _videoShowings,
                ),
                StreamBuilder<String>(
                    stream: _remarks,
                    initialData: '',
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(height: 6);
                      }
                      if (snapshot.hasData) {
                        final String remarks = snapshot.data ?? '';
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
                      if (snapshot.hasError) {
                        return const Text('Error');
                      }
                      return const SizedBox(height: 6);
                    }),
                /*isWithRemarks
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text('Remarks: ${widget.activity.remarks}'.trimRight(),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodySmall),
                        ),
                      )
                    : const SizedBox(height: 6)*/
              ]),
            ),
          ),
        ));
  }
}
