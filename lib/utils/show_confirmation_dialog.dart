import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

Future<bool?> showConfirmationDialog(
  BuildContext context,
  String title, [
  String confirmText = 'Yes',
  String refuseText = 'No',
]) {
  TextStyle titleStyle = context.titleMedium ?? TextStyle(color: context.colors.onSurface, fontSize: 20);
  TextStyle btnTextStyle = titleStyle.copyWith(fontWeight: FontWeight.w500);
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        titleTextStyle: titleStyle,
          title: Text(title), actions: [
        TextButton(
          onPressed: () => Navigator.pop<bool>(context, false),
          child: Text(refuseText, style: btnTextStyle),
        ),
        TextButton(
          onPressed: () => Navigator.pop<bool>(context, true),
          child: Text(confirmText, style: btnTextStyle),
        )
      ]);
    },
  );
}
