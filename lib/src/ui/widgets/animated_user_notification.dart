import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class AnimatedUserNotification extends StatefulWidget {
  const AnimatedUserNotification({required this.msg, this.isError = false, Key? key})
      : super(key: key);

  final bool isError;
  final String msg;

  @override
  State<AnimatedUserNotification> createState() => _AnimatedUserNotificationState();
}

class _AnimatedUserNotificationState extends State<AnimatedUserNotification>  {


  @override
  Widget build(BuildContext context) {
    final TextStyle errorStyle = context.labelMedium != null
        ? context.labelMedium!.copyWith(color: Colors.red)
        : const TextStyle(color: Colors.red);
    final TextStyle infoStyle = context.labelMedium != null
        ? context.labelMedium!.copyWith(color: Colors.blue)
        : const TextStyle(color: Colors.blue);
    return SizedBox(
      height: 38,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 400),
        builder: (BuildContext context, double val, Widget? child) {
          return Opacity(
            opacity: val,
            child: Container(
            constraints: BoxConstraints(
              maxHeight: val * 30 < 6 ? 5 : val * 34,
                minHeight: 4,
                minWidth: 20,
            ),
                child: child),
          );

        },
        child: Text(widget.msg, style: widget.isError ? errorStyle : infoStyle, overflow: TextOverflow.fade, maxLines: 2, softWrap: true)
      ),
    );
    /*return AnimatedCrossFade(
      crossFadeState: CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 400),
      firstChild: Text(
        widget.msg,
        style: context.labelLarge!.copyWith(color: Colors.red, fontSize: 2),
      ),
      secondChild: Text(
        widget.msg,
        style: context.labelLarge!.copyWith(color: Colors.red, fontSize: 14),
      ),
    );*/

  }
}
