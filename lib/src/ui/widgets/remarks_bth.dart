import 'package:flutter/material.dart';

class RemarksBtn extends StatelessWidget {
  const RemarksBtn(this.onPressedHandle, {this.text = 'Remarks', Key? key}) : super(key: key);

  final Function onPressedHandle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onPressedHandle(),
      icon: const Icon(Icons.edit),
      label: Text(text),
    );
  }
}
