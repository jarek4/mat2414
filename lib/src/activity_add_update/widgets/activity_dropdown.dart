import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class ActivityDropdown extends StatelessWidget {
  const ActivityDropdown({
    Key? key,
    required this.onChangeHandle,
    required this.items,
    required this.value,
  }) : super(key: key);

  final ValueChanged<int?> onChangeHandle;
  final List<int> items;
  final int value;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = context.titleSmall != null
        ? context.titleSmall!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue)
        : const TextStyle(color: Colors.blue);
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 40),
        child: DropdownButton<int>(
          icon: const SizedBox(),
          // alignment: AlignmentDirectional.center,
          style: textStyle,
          isExpanded: true,
          menuMaxHeight: 220.0,
          items: _buildDropdownMenuItems(items),
          value: value,
          onChanged: onChangeHandle,
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownMenuItems(List<int> values) {
    return values
        .map((e) => DropdownMenuItem<int>(
              alignment: AlignmentDirectional.center,
              value: e,
              child: FittedBox(child: Text('$e')),
            ))
        .toList();
  }
}
