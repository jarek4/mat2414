import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import 'input_value_widget.dart';
import 'input_leading.dart';

class ActivityInputField extends StatelessWidget {
  const ActivityInputField({
    Key? key,
    required this.icon,
    required this.name,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  final Widget icon;
  final String name;
  final ValueChanged<int> onChange;
  final int value;

  static const double _height = 36.0;
  static const double _minWidth = 180.0;
  static const double _maxWidth = 380.0;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = context.bodySmall;
    return Container(
      constraints: const BoxConstraints(
          minHeight: _height - 3, minWidth: _minWidth, maxHeight: _height, maxWidth: _maxWidth),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: context.colors.surface),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InputLeading(child: icon),
        Expanded(
          flex: 5,
          child: Row(children: [
            Expanded(
              flex: 5,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(name,
                      style: textStyle, overflow: TextOverflow.fade, maxLines: 1, softWrap: false)),
            ),
            _buildDivider(),
            Expanded(flex: 2, child: InputValueWidget(value: '$value')),
          ]),
        ),
        Expanded(
          flex: 2,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Flexible(
              child: FittedBox(
                child: IconButton(onPressed: () => onChange(-1), icon: const Icon(Icons.remove)),
              ),
            ),
            _buildDivider(),
            Flexible(
              child: FittedBox(
                child: IconButton(onPressed: () => onChange(1), icon: const Icon(Icons.add)),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _buildDivider() =>
      const VerticalDivider(indent: 4.0, endIndent: 4.0, thickness: 0.8, width: 4);
}
