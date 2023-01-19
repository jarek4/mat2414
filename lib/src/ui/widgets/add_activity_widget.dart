import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class AddActivityWidget extends StatelessWidget {
  const AddActivityWidget({Key? key, this.isSmall = true, required this.handle}) : super(key: key);
  final bool isSmall;
  final Function handle;

  @override
  Widget build(BuildContext context) {
    TextStyle bigStyle = context.headlineSmall ?? const TextStyle().copyWith(fontSize: 24);
    TextStyle smallStyle = context.labelMedium ?? const TextStyle().copyWith(fontSize: 14);
    if (isSmall) {
      return _buildSmall(smallStyle);
    }
    return _buildBig(bigStyle);
  }

  Widget _buildBig(TextStyle bigStyle) {
    return Column(
      children: [
        IconButton(
            onPressed: () => handle(),
            icon: const Icon(
              Icons.add_circle,
              size: 38,
            )),
        Text('Add new activity', style: bigStyle)
      ],
    );
  }

  Widget _buildSmall(TextStyle smallStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Add new activity', style: smallStyle),
        IconButton(onPressed: () => handle(), icon: const Icon(Icons.add_circle, size: 24)),
      ],
    );
  }
}
