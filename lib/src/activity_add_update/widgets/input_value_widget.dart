import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class InputValueWidget extends StatelessWidget {
  const InputValueWidget({this.value = '0', Key? key}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = context.bodyMedium != null
        ? context.bodySmall!.copyWith(fontWeight: FontWeight.w600)
        : null;
    return Text(value,
        textAlign: TextAlign.center,
        style: textStyle, overflow: TextOverflow.fade, maxLines: 1, softWrap: false);
  }
}
