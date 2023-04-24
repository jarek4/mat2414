import 'package:flutter/material.dart';

void showSnackBarInfo(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).clearMaterialBanners();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
    //margin: EdgeInsets.symmetric(vertical: double.maxFinite),
    content: Text(
      msg,
      textAlign: TextAlign.center,
    ),
  ));
}
