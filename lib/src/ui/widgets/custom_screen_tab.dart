import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../theme/custom_screen_tab_style.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, required this.activeIndex, required this.pageNames, required this.onTap}) : super(key: key);

  final int activeIndex;
  final List<String> pageNames;
  final Function onTap;
/*

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _activeIndex = 0;
*/

  @override
  Widget build(BuildContext context) {
    final CustomScreenTabStyle? defStyle = Theme.of(context).extension<CustomScreenTabStyle>();
    final double borderRadius = defStyle?.borderRadius ?? 18.0;
    final Color backgroundColor = defStyle?.backgroundColor ?? context.colors.tertiaryContainer;
    final Color activeTabColor = defStyle?.activeTabColor ?? Colors.white;
    final Color inactiveTabColor = defStyle?.inactiveTabColor ?? Colors.grey.withOpacity(0.36);
    return Container(
      height: 38.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.65),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: List.generate(pageNames.length, (int index) {
          return Expanded(
            child: AnimatedContainer(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: index == activeIndex ? activeTabColor : inactiveTabColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              child: _buildTab(index, context),
            ),
          );
        }).toList(),
      ),
    );
    ;
  }

  InkWell _buildTab(int index, BuildContext context) {
    TextStyle? textStyle = context.titleMedium?.copyWith(
      color: index == activeIndex
          ? context.colors.secondary
          : context.colors.tertiary.withOpacity(0.5),
      fontWeight: FontWeight.bold,
    );
    return InkWell(
      key: Key('CustomTabBar_${key}_$index-${pageNames[index]}'),
      child: FittedBox(
        child: Text(
          pageNames[index],
          style: textStyle,
        ),
      ),
      onTap: () => onTap(index),
    );
  }
}
