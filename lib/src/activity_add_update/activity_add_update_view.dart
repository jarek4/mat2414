import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../custom_date_picker/custom_date_picker.dart';
import 'add_update_state.dart';
import 'widgets/widgets.dart';

class ActivityAddUpdateView extends StatefulWidget {
  /// on close returns through Navigator.pop<Activity?>() created or updated Activity item
  /// or null if has been canceled, error occurs or not created/updated
  const ActivityAddUpdateView({Key? key, this.activityToUpdate, this.initialDate}) : super(key: key);

  final Activity? activityToUpdate;
  final DateTime? initialDate;

  @override
  State<ActivityAddUpdateView> createState() => _ActivityAddUpdateViewState();
}

class _ActivityAddUpdateViewState extends State<ActivityAddUpdateView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddUpdateState>(
      create: (_) => AddUpdateState(activity: widget.activityToUpdate, selectedDate: widget.initialDate),
      builder: (BuildContext context, Widget? widget) {
        final bool userWantLCDButton = context.read<AddUpdateState>().userWantLCDButton;
        return DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.9,
            minChildSize: 0.4,
            builder: (context, controller) {
              return ListView(
                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
                  shrinkWrap: true,
                  controller: controller,
                  children: [
                    // top bottom sheet draggable indicator
                    const LineIndicator(),
                    _buildHeaderArea([
                      _buildTitle(),
                      _buildDataPicker(context),
                    ]),
                    _buildDivider(),
                    _buildTimeField(),
                    if (!userWantLCDButton) _buildLCDHoursBtn(),
                    _buildDivider(),
                    _buildPlacementsField(),
                    _buildVideoShowingsField(),
                    _buildReturnVisitsField(),
                    _buildAddRemarksArea(context),
                    _buildBottomButtons(context),
                  ]);
            });
      },
    );
  }

  Widget _buildHeaderArea(List<Widget> children) {
    return SizedBox(
      height: 32,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children),
    );
  }

  Widget _buildTitle() {
    return Selector<AddUpdateState, bool>(
        selector: (_, state) => state.isUpdateMode,
        shouldRebuild: (bool pre, bool next) {
          return pre != next;
        },
        builder: (BuildContext context, isUpdate, __) {
          final String title = isUpdate ? 'Edit' : 'New activity';
          return Text(title, style: context.labelLarge);
        });
  }

  FittedBox _buildDataPicker(BuildContext context) {
    return FittedBox(child: CustomDatePicker(
        onDatePicked: context.read<AddUpdateState>().setDate,
      date: context.watch<AddUpdateState>().date,
    ));
  }

  Widget _buildTimeField() {
    return const Align(alignment: Alignment.center, child: ActivityTimeInput());
  }

  Widget _buildLCDHoursBtn() {
    return SizedBox(
      height: 32,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Selector<AddUpdateState, bool>(
              selector: (_, state) => state.areLCDHours,
              shouldRebuild: (bool pre, bool next) {
                return pre != next;
              },
              builder: (BuildContext context, areLCDHours, __) {
                return LCDHoursOption(
                  isSelected: areLCDHours,
                  handle: () => context.read<AddUpdateState>().onLCDHoursChange(),
                );
              }),
        ),
      ),
    );
  }

  Widget _buildPlacementsField() {
    // Align() prevent stretch to max ListView width!
    return Align(
      alignment: Alignment.center,
      child: Selector<AddUpdateState, int>(
          selector: (_, state) => state.placements,
          shouldRebuild: (int pre, int next) {
            return pre != next;
          },
          child: Image.asset(AssetPath.imgMagazine512),
          builder: (BuildContext context, placements, icon) {
            return ActivityInputField(
                icon: icon!,
                name: 'Placements',
                onChange: (int v) => context.read<AddUpdateState>().setPlacements(v),
                value: placements);
          }),
    );
  }

  Widget _buildVideoShowingsField() {
    return Align(
      alignment: Alignment.center,
      child: Selector<AddUpdateState, int>(
          selector: (_, state) => state.video,
          shouldRebuild: (int pre, int next) {
            return pre != next;
          },
          child: Image.asset(AssetPath.imgVideoCamera512),
          builder: (BuildContext context, video, icon) {
            return ActivityInputField(
                icon: icon!,
                name: 'Video Showings',
                onChange: (int v) => context.read<AddUpdateState>().setVideoShowings(v),
                value: video);
          }),
    );
  }

  Widget _buildReturnVisitsField() {
    return Align(
      alignment: Alignment.center,
      child: Selector<AddUpdateState, int>(
          selector: (_, state) => state.returns,
          shouldRebuild: (int pre, int next) {
            return pre != next;
          },
          child: Image.asset(AssetPath.imgTwoPersons512),
          builder: (BuildContext context, returns, icon) {
            return ActivityInputField(
                icon: icon!,
                name: 'Return visits',
                onChange: (int v) => context.read<AddUpdateState>().setReturnVisits(v),
                value: returns);
          }),
    );
  }

  Widget _buildAddRemarksArea(BuildContext context) {
    return Selector<AddUpdateState, bool>(
        selector: (_, state) => state.showRemarksInput,
        shouldRebuild: (bool pre, bool next) {
          return pre != next;
        },
        // Align() prevent stretch to max ListView width!
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 40,
            child: FittedBox(
                child: RemarksBtn(() => context.read<AddUpdateState>().addRemarksRequest(),
                    text: 'Add remarks')),
          ),
        ),
        builder: (BuildContext context, showRemarksInput, addRemarksButton) {
          final Function(String) onChange = context.read<AddUpdateState>().remarksOnChange;
          if (showRemarksInput) {
            return TextFormField(
                decoration: const InputDecoration(labelText: 'Remarks', hintText: '...'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                autofocus: true,
                maxLength: 150,
                onChanged: (v) => onChange(v));
          }
          return addRemarksButton!;
        });
  }

  Row _buildBottomButtons(BuildContext context) {
    final ButtonStyle saveBtnStyle = const ButtonStyle().copyWith(
        textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.bold)));
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      // show errors/notifications in this view if it is not disposed!
      // the shown massage has a duration because AddUpdateStateStatus.error will change
      Flexible(
        child: Selector<AddUpdateState, AddUpdateStateStatus>(
          selector: (_, state) => state.status,
          shouldRebuild: (AddUpdateStateStatus pre, AddUpdateStateStatus next) {
            return pre != next;
          },
          builder: (BuildContext context, status, empty) {
            final String er = context.read<AddUpdateState>().errorMessage;
            if (status == AddUpdateStateStatus.error && er.isNotEmpty) {
              return Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedUserNotification(msg: er, isError: true));
            }
            return empty!;
          },
          child: const SizedBox(), // empty
        ),
      ),
      TextButton(onPressed: () => _closeBottomSheet(null), child: const Text('Cancel')),
      Selector<AddUpdateState, AddUpdateStateStatus>(
          selector: (_, state) => state.status,
          shouldRebuild: (AddUpdateStateStatus pre, AddUpdateStateStatus next) {
            return pre != next;
          },
          child: const Text('Save'),
          builder: (BuildContext context, status, text) {
            final bool isDisabled =
                status == AddUpdateStateStatus.loading || status == AddUpdateStateStatus.error;
            onPressed() async {
              final Activity? savedActivity = await context.read<AddUpdateState>().onSaveRequest();
              if (savedActivity != null) _closeBottomSheet(savedActivity);
              // _closeBottomSheet(savedActivity);
            }

            return TextButton(
                style: saveBtnStyle,
                onPressed: isDisabled ? null : () => onPressed(),
                child: text!);
          }),
      const SizedBox(width: 8.0),
    ]);
  }

  void _closeBottomSheet(Activity? savedActivity) {
    if (mounted) Navigator.pop<Activity?>(context, savedActivity);
  }

  Widget _buildDivider() => const Divider(thickness: 1.4, height: 4.0);
}
