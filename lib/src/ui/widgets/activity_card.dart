import 'package:flutter/material.dart';
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
  Stream<String>? _formattedDate;
  Stream<String>? placements;
  Stream<String>? _remarks;
  Stream<String>? returnVisits;
  Stream<String>? time;
  Stream<String>? videoShowings;

  @override
  void initState() {
    super.initState();
    _activityAsStream = widget.activity.asStream().asBroadcastStream();
    _formattedDate = _activityAsStream
        .map((Activity a) => utils.dateFormatter(DateTime(a.year, a.month, a.day), 'EEEE, d MMM'))
        .distinct();
    placements = _activityAsStream.map((Activity a) => a.placements.toString()).distinct();
    _remarks = _activityAsStream.map((Activity a) => a.remarks).distinct();
    returnVisits = _activityAsStream.map((Activity a) => a.returnVisits.toString()).distinct();
    time = _activityAsStream.map((Activity a) => _makeTimeString(a.hours, a.minutes)).distinct();
    videoShowings = _activityAsStream.map((Activity a) => a.videos.toString()).distinct();
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: StreamBuilder<String>(
                        stream: _formattedDate,
                        initialData: '...',
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text('Date: ...');
                          }
                          if (snapshot.hasData) {
                            return Text('Date: ${snapshot.data} ',
                                style: context.labelMedium, overflow: TextOverflow.ellipsis);
                           /* final String? activity = snapshot.data;
                            if (activity != null) {
                              final String date = utils.dateFormatter(
                                  DateTime(activity.year, activity.month, activity.day),
                                  'EEEE, d MMMM');
                              return Text('Date: ${snapshot.data} ',
                                  style: context.labelMedium, overflow: TextOverflow.ellipsis);
                            } else {
                              return const SizedBox(height: 6);
                            }*/
                          }
                          if (snapshot.hasError) {
                            return const Text('Date: Error');
                          }
                          return const SizedBox(height: 6);
                        }),
                  ),
                ),
                ReportTable(
                  placements: placements,
                  returnVisits: returnVisits,
                  time: time,
                  videoShowings: videoShowings,
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
                              child: Text('Remarks: $remarks',
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
