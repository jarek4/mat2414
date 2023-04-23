import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../custom_date_picker/custom_date_picker.dart';
import 'add_update_state.dart';
import 'widgets/widgets.dart';

class ActivityAddUpdateView extends StatefulWidget {
  /// on close returns through Navigator.pop<Activity?>() created or updated Activity item
  /// or null if has been canceled, error occurs or not created/updated
  const ActivityAddUpdateView({Key? key, this.activityToUpdate, this.initialDate})
      : super(key: key);

  final Activity? activityToUpdate;
  final DateTime? initialDate;

  @override
  State<ActivityAddUpdateView> createState() => _ActivityAddUpdateViewState();
}

class _ActivityAddUpdateViewState extends State<ActivityAddUpdateView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddUpdateState>(
      create: (_) =>
          AddUpdateState(activity: widget.activityToUpdate, selectedDate: widget.initialDate),
      builder: (BuildContext context, Widget? widget) {
        final bool userWantLDCButton = context.read<AddUpdateState>().userWantLDCButton;
        return DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.9,
            minChildSize: 0.4,
            builder: (context, controller) {
              return SafeArea(
                top: false,
                child: ListView(
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
                      if (!userWantLDCButton) _buildLDCHoursBtn(),
                      _buildDivider(),
                      _buildPlacementsField(),
                      _buildVideoShowingsField(),
                      _buildReturnVisitsField(),
                      _buildAddRemarksArea(context),
                      _buildBottomButtons(context),
                      // iOS CupertinoPopupSurface does not lift up when keyboard is visible:
                      const SizedBox(height: 60),
                      const SizedBox(height: 60),
                      const SizedBox(height: 80),
                    ]),
              );
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
          final localeEdit = context.loc.generalEdit;
          final localeNew = context.loc.addActivityNewActivity;
          final String title = isUpdate ? localeEdit : localeNew;
          return Text(title, style: context.labelLarge);
        });
  }

  FittedBox _buildDataPicker(BuildContext context) {
    return FittedBox(
        child: CustomDatePicker(
      onDatePicked: context.read<AddUpdateState>().setDate,
      date: context.watch<AddUpdateState>().date,
    ));
  }

  Widget _buildTimeField() {
    return const Align(alignment: Alignment.center, child: ActivityTimeInput());
  }

  Widget _buildLDCHoursBtn() {
    return SizedBox(
      height: 32,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Selector<AddUpdateState, bool>(
              selector: (_, state) => state.areLDCHours,
              shouldRebuild: (bool pre, bool next) {
                return pre != next;
              },
              builder: (BuildContext context, areLDCHours, __) {
                return LDCHoursOption(
                  isSelected: areLDCHours,
                  handle: () => context.read<AddUpdateState>().onLDCHoursChange(
                      /*context.loc.generalLDCHours*/),
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
                name: context.loc.generalPlacements,
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
                name: context.loc.generalVideoShowings,
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
                name: context.loc.generalReturnVisits,
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
              child: RemarksBtn(() => context.read<AddUpdateState>().addRemarksRequest()),
            ),
          ),
        ),
        builder: (BuildContext context, showRemarksInput, addRemarksButton) {
          final Function(String) onChange = context.read<AddUpdateState>().remarksOnChange;
          final initRemarks = context.read<AddUpdateState>().remarks;
          if (showRemarksInput) {
            return TextFormField(
                decoration: InputDecoration(labelText: context.loc.generalRemarks, hintText: '...'),
                keyboardType: TextInputType.multiline,
                initialValue: initRemarks.isEmpty ? null : initRemarks,
                minLines: 1,
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
            final AddUpdateErrorCode code = context.read<AddUpdateState>().errorCode;
            final isErrWithInfo =
                status == AddUpdateStateStatus.error && code != AddUpdateErrorCode.noErrors;
            if (isErrWithInfo) return _buildResolvingErrorCodes(code);
            return empty!;
          },
          child: const SizedBox(), // empty
        ),
      ),
      TextButton(onPressed: () => _closeBottomSheet(null), child: Text(context.loc.generalCancel)),
      Selector<AddUpdateState, AddUpdateStateStatus>(
          selector: (_, state) => state.status,
          shouldRebuild: (AddUpdateStateStatus pre, AddUpdateStateStatus next) {
            return pre != next;
          },
          child: Text(context.loc.generalSave),
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

  Widget _buildResolvingErrorCodes(AddUpdateErrorCode errorCode) {
    String info = '';
    switch (errorCode) {
      case AddUpdateErrorCode.isEmpty:
        info = context.loc.addActivityEmptyError;
        break;
      case AddUpdateErrorCode.noChangesMade:
        info = context.loc.addActivityNoChangesMadeError;
        break;
      case AddUpdateErrorCode.notCreated:
        info = context.loc.addActivityNotCreatedError;
        break;
      case AddUpdateErrorCode.notUpdated:
        info = context.loc.addActivityBtnNotSavedNotification;
        break;
      default:
        break;
    }
    return Align(
        alignment: Alignment.centerLeft, child: AnimatedUserNotification(msg: info, isError: true));
  }

  void _closeBottomSheet(Activity? savedActivity) {
    if (mounted) Navigator.pop<Activity?>(context, savedActivity);
  }

  Widget _buildDivider() => const Divider(thickness: 1.4, height: 4.0);
}
