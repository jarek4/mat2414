import 'package:flutter/material.dart';

class ThemeSettings {
  ThemeSettings({
    required this.sourceColor,
    required this.themeMode,
    required this.localeCode,
  });

  final Color sourceColor;
  final ThemeMode themeMode;
  final String localeCode;

  ThemeSettings copyWitch({
    Color? sourceColor,
    ThemeMode? themeMode,
    String? localeCode,
  }) {
    return ThemeSettings(
        sourceColor: sourceColor ?? this.sourceColor,
        themeMode: themeMode ?? this.themeMode,
        localeCode: localeCode ?? this.localeCode);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeSettings &&
            (identical(other.sourceColor, sourceColor) ||
                other.sourceColor == sourceColor) &&
            (identical(other.localeCode, localeCode) ||
                other.localeCode == localeCode) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    sourceColor,
    themeMode,
    localeCode,
  ]);
}