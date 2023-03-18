import 'package:flutter/material.dart';

Future<T?> showCustomBottomSheet<T>(BuildContext context, Widget content) {
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
}
