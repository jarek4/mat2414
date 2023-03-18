import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/screens/report/report_state_provider.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:provider/provider.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bottom_sheet;

import '../../../activity_add_update/activity_add_update.dart';
import '../../../data/models/models.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key}) : super(key: key);

  // opening AddEditModalBottomSheet with a given date (the date user has picked up on calendar).
  // If showBottomSheet returns not null value it means new activity was created ans saved into DB.
  // In this case the UI have to be refreshed to to reflect the changes.
  Future<void> _handleAddNewActivityBtn(BuildContext context) async {
    final ReportStateProvider state = Provider.of<ReportStateProvider>(context, listen: false);
    final DateTime date = state.selectedDate.date;
    _openAddEditModalBottomSheet(context, selectedDate: date).then((v) {
      // if new activity was added refresh the activities list for the given day!
      if (v != null) state.refreshForADayActivities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: AddActivityWidget(handle: () => _handleAddNewActivityBtn(context))),
      Expanded(
          child: StreamBuilder<UnmodifiableListView<Activity>?>(
        stream: Provider.of<ReportStateProvider>(context).watchForADay(),
        initialData: UnmodifiableListView<Activity>([]),
        builder: (BuildContext context, AsyncSnapshot<UnmodifiableListView<Activity>?> snapshot) {
          final bool isWaiting = snapshot.connectionState == ConnectionState.waiting;
          final bool isActive = snapshot.connectionState == ConnectionState.active;
          // to show info that list is empty after waiting for data:
          // isWaiting: false; hasData: true; connectionState: ConnectionState.active
          if (snapshot.hasError) return const Center(child: CircularProgressIndicator.adaptive());
          if (isActive && snapshot.hasData && (snapshot.data == null || snapshot.data!.isEmpty)) {
            return const Center(child: Text('No activities.'));
          }
          final UnmodifiableListView<Activity> data =
              snapshot.data ?? UnmodifiableListView<Activity>([]);

          return Shimmer(
            child: ListView.builder(
              itemBuilder: (context, i) {
                return ShimmerLoading(
                  isLoading: isWaiting,
                  child: DismissibleActivityListItem(
                    item: data.isEmpty ? ConstantValues.emptyActivity : data[i],
                    onDelete: () => Provider.of<ReportStateProvider>(context, listen: false)
                        .deleteActivity(data[i].id),
                    onUpdate: () => _openAddEditModalBottomSheet(context, item: data[i]),
                  ),
                );
              },
              itemCount: isWaiting ? 1 : data.length,
            ),
          );
        },
      )),
    ]);
  }

  Future<Activity?> _openAddEditModalBottomSheet(BuildContext context,
      {Activity? item, DateTime? selectedDate}) {
    return utils_bottom_sheet.showCustomBottomSheet<Activity>(
        context, ActivityAddUpdateView(activityToUpdate: item, initialDate: selectedDate));
  }
}
