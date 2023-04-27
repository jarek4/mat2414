import 'package:flutter/material.dart';

void showSnackBarInfo(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
    content: Text(
      msg,
      textAlign: TextAlign.center,
    ),
  ));
}
