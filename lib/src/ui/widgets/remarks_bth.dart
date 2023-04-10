import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';

class RemarksBtn extends StatelessWidget {
  const RemarksBtn(this.onPressedHandle, {Key? key}) : super(key: key);

  final Function onPressedHandle;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onPressedHandle(),
      icon: const Icon(Icons.edit),
      label: Text(context.loc.generalRemarks),
    );
  }
}
