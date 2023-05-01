import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

Future<T?> showCustomBottomSheet<T>(BuildContext context, Widget content) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return showCupertinoModalPopup<T>(
        context: context,
        builder: (BuildContext builder) {
          return CupertinoPopupSurface(
            isSurfacePainted: false,
            child: Material(
              color: context.colors.tertiaryContainer.withOpacity(0.94),
              child: Builder(
                  builder: (context) {
                    // return content;
                    return AnimatedPadding(
                      duration: const Duration(milliseconds: 80),
                      curve: Curves.bounceIn,
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: content,
                    );
                  }
              ),
            ),
          );
        });
  } else {
    return showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        // if DraggableScrollableSheet expand: false:
        // backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          // AnimatedPadding, padding MediaQuery.of(context).viewInsets.bottom and
          // isScrollControlled: true - are important to lift up when keyboard is shown!
          return AnimatedPadding(
            duration: const Duration(milliseconds: 80),
            curve: Curves.bounceIn,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SafeArea(child: content),
          );
        });
  }
}
