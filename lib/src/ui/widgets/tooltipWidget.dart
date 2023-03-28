import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/asset_path.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({Key? key, required this.info}) : super(key: key);

  final String info;

  @override
  Widget build(BuildContext context) {
    final String tip = info.isNotEmpty ? info : '?';
    return Tooltip(
      showDuration: const Duration(seconds: 4),
      triggerMode: TooltipTriggerMode.tap,
      message: tip,
        child: SizedBox(
            height: 16.0, width: 16.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(AssetPath.icQuestionMark512, /*height: 12.0, width: 12.0*/)),
        ),
      /*child: Container(
          height: 17,
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: context.colors.tertiaryContainer,
              // color: Theme.of(context).colorScheme.tertiaryContainer
    ),
          child: FittedBox(
            // child: Icon(Icons.question_mark_outlined, color: context.colors.outline),
            // Image.asset must have height and width!
            // child: Image.asset('assets/images/cloudlet_t_ic512.png', height: 10.0, width: 10.0),
            child: Image.asset(AssetPath.icQuestionMark512, height: 10.0, width: 10.0),
          )),*/
    );
  }
}
