import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class LDCHoursOption extends StatelessWidget {
  const LDCHoursOption({required this.isSelected, required this.handle, Key? key})
      : super(key: key);

  final bool isSelected;
  final VoidCallback handle;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ActionChip(
          tooltip:
              'Mark if this is not the time spent in the field service. This hours will be saved in remarks',
          avatar: Icon(isSelected ? Icons.check : Icons.remove_circle_outline_rounded,
              color: isSelected ? Colors.green : Colors.red),
          backgroundColor:
              isSelected ? context.colors.primaryContainer : context.colors.secondaryContainer,
          elevation: isSelected ? 4.8 : 0.0,
          shadowColor: context.colors.primaryContainer,
          label: const Text('LDC hours'),
          onPressed: handle),
    );
  }
}
