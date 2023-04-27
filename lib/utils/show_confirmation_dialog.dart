import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';

Future<bool?> showConfirmationDialog(
  BuildContext context,
  String contentText, {
  Widget? title,
  String? confirmText,
  String? refuseText,
}) {
  const barrierLabel = 'Do you want to cancel this action?';
  confirmText ??= context.loc.generalYes;
  refuseText ??= context.loc.generalNo;

  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return showCupertinoDialog<bool>(
        barrierDismissible: true,
        barrierLabel: barrierLabel,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: title,
            content: Text(contentText),
            actions: [
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop<bool>(context, false),
                  child: Text(refuseText ?? 'No')),
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop<bool>(context, true),
                  child: Text(confirmText ?? 'Yes')),
            ],
          );
        });
  } else {
    return showGeneralDialog<bool>(
      barrierLabel: barrierLabel,
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
            TextButton(
                onPressed: () => Navigator.pop<bool>(context, false),
                child: Text(refuseText ?? 'No')),
            TextButton(
                onPressed: () => Navigator.pop<bool>(context, true),
                child: Text(confirmText ?? 'Yes'))
          ]),
        );
      },
      transitionDuration: const Duration(milliseconds: 380),
    );
  }
}
