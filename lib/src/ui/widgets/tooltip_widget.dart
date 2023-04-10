import 'package:flutter/material.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({Key? key, required this.info}) : super(key: key);

  final String info;

  @override
  Widget build(BuildContext context) {
    final String tip = info.isNotEmpty ? info : '?';
    return Visibility(
      visible: context.read<SettingsController>().user.preferences.showTips,
      child: Tooltip(
        showDuration: const Duration(seconds: 4),
        triggerMode: TooltipTriggerMode.tap,
        message: tip,
        child: Icon(Icons.info_outline_rounded, color: context.colors.tertiary),
      ),
    );
  }
}
