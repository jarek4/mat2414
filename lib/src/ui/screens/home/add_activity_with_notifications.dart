import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/activity_add_update/activity_add_update_view.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/ui/widgets/add_activity_widget.dart';
import 'package:mat2414/src/ui/widgets/animated_user_notification.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bottom_sheet;

class AddActivityWithNotifications extends StatefulWidget {
  const AddActivityWithNotifications({Key? key}) : super(key: key);

  @override
  State<AddActivityWithNotifications> createState() => _AddActivityWithNotificationsState();
}

class _AddActivityWithNotificationsState extends State<AddActivityWithNotifications> {
  Timer? timer;
  var saved = 'OK, saved.', notSaved = 'Not saved!';
  String? tempInfo;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    saved = AppLocalizations.of(context).addActivityBtnSavedNotification;
    notSaved = AppLocalizations.of(context).addActivityBtnNotSavedNotification;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (tempInfo != null) AnimatedUserNotification(height: 28, msg: tempInfo ?? ''),
      // button +
      AddActivityWidget(
        isSmall: false,
        handle: () => _handleAddNevActivityBtn(),
      )
    ]);
  }

  Future<void> _handleAddNevActivityBtn() async {
    final Activity? a = await _openAddBottomSheet(context);
    if (a == null) {
      _setTemporaryNotification(notSaved);
    } else {
      _setTemporaryNotification(saved);
    }
  }

  void _cancelTimer() {
    if (timer != null && timer!.isActive) timer?.cancel();
  }

  void _setTemporaryNotification(String info) {
    _cancelTimer();
    setState(() => tempInfo = info);
    timer = Timer(const Duration(milliseconds: 3000), () {
      if (mounted) setState(() => tempInfo = null);
    });
  }

  Future<Activity?> _openAddBottomSheet(BuildContext context) async {
    return await utils_bottom_sheet.showCustomBottomSheet<Activity>(
        context, const ActivityAddUpdateView());
  }
}
