import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class InputLeading extends StatelessWidget {
  const InputLeading({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38.0,
      // height: ActivityAddUpdateWidget._height + 6,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(15.0)),
          color: context.colors.tertiary.withOpacity(0.7)),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      // child: const Icon(Icons.access_time),
      child: child,
    );
  }
}
