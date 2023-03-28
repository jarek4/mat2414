import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:provider/provider.dart';

import 'home_screen_state_provider.dart';

class LastActivities extends StatefulWidget {
  const LastActivities({Key? key}) : super(key: key);

  @override
  State<LastActivities> createState() => _LastActivitiesState();
}

class _LastActivitiesState extends State<LastActivities> {
  Stream<UnmodifiableListView<Activity>>? items;

  @override
  void didChangeDependencies() {
    items = Provider.of<HomeScreenStateProvider>(context, listen: false).last3().distinct();
    super.didChangeDependencies;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<Activity>?>(
      stream: items,
      initialData: UnmodifiableListView<Activity>([]),
      builder: (BuildContext context, AsyncSnapshot<UnmodifiableListView<Activity>?> snapshot) {
        final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
        final bool isActive = snapshot.connectionState == ConnectionState.active;
        // to show info that list is empty after waiting for data:
        // isWaiting: false; hasData: true; connectionState: ConnectionState.active
        if (snapshot.hasError) return const Center(child: CircularProgressIndicator.adaptive());
        if (isActive && snapshot.hasData && (snapshot.data == null || snapshot.data!.isEmpty)) {
          return _buildEmptyInfo();
        }
        final UnmodifiableListView<Activity> data =
            snapshot.data ?? UnmodifiableListView<Activity>([]);

        return Shimmer(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              /*return ShimmerLoading(
                isLoading: isWaiting,
                child: ActivitySimpleView(
                  data: [
                    data.isEmpty ? 0 : data[i].placements,
                    data.isEmpty ? 0 : data[i].videos,
                    data.isEmpty ? 0 : data[i].returnVisits
                  ],
                  duration: Duration(
                      hours: data.isEmpty ? 0 : data[i].hours,
                      minutes: data.isEmpty ? 0 : data[i].minutes),
                ),
              );*/
              return ShimmerLoading(
                  isLoading: isWaiting,
                  child: ActivitySimpleView(
                      item: snapshot.data!.isEmpty
                          ? ConstantValues.emptyActivity
                          : snapshot.data![i]));
            },
            itemCount: isWaiting ? 1 : data.length,
            // itemCount: 1,
          ),
        );
      },
    );
  }

  Widget _buildEmptyInfo() {
    return const Text('No activities yet');
  }
}
