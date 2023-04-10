import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<T?> showCustomBottomSheet<T>(BuildContext context, Widget content) {
  if (Theme.of(context).platform == TargetPlatform.android) {
    return showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        // if DraggableScrollableSheet expand: false:
        // backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          // AnimatedPadding, padding MediaQuery.of(context).viewInsets.bottom and
          // isScrollControlled: true - are important to lift up when keyboard is shown!
          return AnimatedPadding(
            duration: const Duration(milliseconds: 50),
            curve: Curves.bounceIn,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: content,
          );
        });
  } else {
    return showCupertinoModalPopup<T>(
        context: context,
        builder: (BuildContext builder) {
          return CupertinoPopupSurface(isSurfacePainted: true, child: content);
        });
  }
}
