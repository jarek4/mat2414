import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class AddActivityWidget extends StatelessWidget {
  const AddActivityWidget({Key? key, this.isSmall = true, required this.handle}) : super(key: key);
  final bool isSmall;
  final Function handle;

  @override
  Widget build(BuildContext context) => isSmall ? _buildSmall(context) : _buildBig(context);

  Widget _buildBig(BuildContext context) {
    final bigStyle = context.headlineSmall ?? const TextStyle().copyWith(fontSize: 24);
    return Column(children: [
      IconButton(
          onPressed: () => handle(),
          icon: Icon(
            Icons.add_circle,
            size: 38,
            color: context.colors.primary,
          )),
      Text(context.loc.addActivityNewActivity, style: bigStyle)
    ]);
  }

  Widget _buildSmall(BuildContext context) {
    final smallStyle = context.labelMedium ?? const TextStyle().copyWith(fontSize: 14);
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(context.loc.addActivityNewActivity, style: smallStyle),
      IconButton(
        onPressed: () => handle(),
        icon: Icon(Icons.add_circle, size: 24, color: context.colors.primary),
      ),
    ]);
  }
}
