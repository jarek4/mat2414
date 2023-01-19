import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScreenTabStyle extends ThemeExtension<CustomScreenTabStyle> {
  CustomScreenTabStyle({
    required this.activeTabColor,
    required this.inactiveTabColor,
    required this.backgroundColor,
    this.borderRadius = 18.0,
  });

  final Color activeTabColor;
  final Color backgroundColor;
  final double borderRadius;
  final Color inactiveTabColor;

  @override
  ThemeExtension<CustomScreenTabStyle> copyWith({
    Color? activeTabColor,
    Color? backgroundColor,
    double? borderRadius,
    Color? inactiveTabColor,
  }) {
    return CustomScreenTabStyle(
      activeTabColor: activeTabColor ?? this.activeTabColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      inactiveTabColor: inactiveTabColor ?? this.inactiveTabColor,
    );
  }

  @override
  ThemeExtension<CustomScreenTabStyle> lerp(ThemeExtension<CustomScreenTabStyle>? other, double t) {
    if (other is! CustomScreenTabStyle) {
      return this;
    }
    return CustomScreenTabStyle(
      activeTabColor: Color.lerp(activeTabColor, other.activeTabColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      inactiveTabColor: Color.lerp(inactiveTabColor, other.inactiveTabColor, t)!,
    );
  }
}
