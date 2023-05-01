import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/utils/scaffold_key.dart';

void showSnackBarInfo(BuildContext context, String msg) {
  final platform = Theme.of(context).platform;
  if (platform == TargetPlatform.iOS) {
    showCupertinoDialog<bool>(
        barrierDismissible: true,
        barrierLabel: 'dismiss',
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop<bool>(context, false),
                  child: const Text('OK')),
            ],
          );
        });
  } else {
    ScaffoldMessenger.of(context).clearSnackBars();
    final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
    if (scaffold != null) {
      scaffold.clearSnackBars();
      scaffold.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ));
    }
  }
}
