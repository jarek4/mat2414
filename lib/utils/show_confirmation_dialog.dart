import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(
  BuildContext context,
  String contentText, {
  Widget? title,
  String confirmText = 'Yes',
  String refuseText = 'No',
}) {
  return showGeneralDialog<bool>(
    barrierLabel: 'Do you want to cancel this action?',
    barrierDismissible: true,
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, _) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: AlertDialog(title: title, content: Text(contentText), actions: [
          TextButton(onPressed: () => Navigator.pop<bool>(context, false), child: Text(refuseText)),
          TextButton(onPressed: () => Navigator.pop<bool>(context, true), child: Text(confirmText))
        ]),
      );
    },
    transitionDuration: const Duration(milliseconds: 380),
  );
  /*return showDialog<bool>(
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
  );*/
}
