import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class LineIndicator extends StatelessWidget {
  /// A thin darker line indicating  the ability to pull up / down. widthFactor=0.32
  const LineIndicator({Key? key, this.widthFactor = 0.32}) : super(key: key);

  final double widthFactor;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.32;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width,
        height: 4,
        decoration: BoxDecoration(
            color: context.colors.onTertiaryContainer.withOpacity(0.7),
            borderRadius: const BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}
