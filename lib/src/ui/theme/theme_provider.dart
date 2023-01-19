import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_color_utilities/blend/blend.dart';

import 'custom_screen_tab_style.dart';
import 'theme.dart';

class ThemeSettingChange extends Notification {
  ThemeSettingChange({required this.settings});

  // ThemeSettings(Color sourceColor, ThemeMode themeMode)
  final ThemeSettings settings;
}

class ThemeProvider extends InheritedWidget {
  const ThemeProvider(
      {super.key,
      required this.themeSettings,
      required this.lightDynamic,
      required this.darkDynamic,
      required super.child});

  final ValueNotifier<ThemeSettings> themeSettings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  Color custom(CustomBlendColor custom) {
    if (custom.blend) {
      return blend(custom.color);
    } else {
      return custom.color;
    }
  }

  Color blend(Color targetColor) {
    // material_color_utilities :
    return Color(Blend.harmonize(targetColor.value, themeSettings.value.sourceColor.value));
    // return Color.alphaBlend(targetColor, themeSettings.value.sourceColor);
    // return targetColor;
  }

  // main color
  Color source(Color? target) {
    Color source = themeSettings.value.sourceColor;
    if (target != null) source = blend(target);
    return source;
  }

  ColorScheme colors(Brightness brightness, Color? targetColor) {
    final dynamicPrimary =
        brightness == Brightness.light ? lightDynamic?.primary : darkDynamic?.primary;
    return ColorScheme.fromSeed(
      seedColor: dynamicPrimary ?? source(targetColor),
      brightness: brightness,
    );
  }

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  CardTheme cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      titleTextStyle: const TextStyle().copyWith(fontFamily: 'Montserrat'),
    );
  }

  TextButtonThemeData textButtonThemeData() {
    final ButtonStyle style = const ButtonStyle().copyWith(textStyle: MaterialStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Montserrat')),);
    return TextButtonThemeData(style: style);
  }
  // TextTheme textTheme(Color color) {
  //   return const TextTheme().apply(fontFamily: 'Montserrat', bodyColor: color);
  // }

  NavigationBarThemeData navigationBarTheme(ColorScheme colors) {
    return NavigationBarThemeData(
      // height: 60.0,
      // indicatorColor: colors.onSurface,
      labelTextStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Montserrat')),
    );
  }

  ThemeData light([Color? targetColor]) {
    final colorScheme = colors(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
    textButtonTheme: textButtonThemeData(),
      // textTheme: textTheme(colorScheme.tertiary),
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colorScheme,
      appBarTheme: appBarTheme(colorScheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(colorScheme),
      navigationBarTheme: navigationBarTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      extensions: <ThemeExtension<dynamic>>[
        CustomScreenTabStyle(
          backgroundColor: colorScheme.tertiaryContainer,
          borderRadius: 18.0,
          activeTabColor:Colors.white,
          inactiveTabColor: Colors.grey.withOpacity(0.36),
        ),
      ],
      useMaterial3: true,
    );
  }

  ThemeData dark([Color? targetColor]) {
    final colorScheme = colors(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      textButtonTheme: textButtonThemeData(),
      // textTheme: textTheme(colorScheme.onSurface),
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colorScheme,
      appBarTheme: appBarTheme(colorScheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      extensions: <ThemeExtension<dynamic>>[
        CustomScreenTabStyle(
          backgroundColor: colorScheme.tertiaryContainer,
          borderRadius: 18.0,
          activeTabColor:Colors.grey,
          inactiveTabColor: Colors.grey.withOpacity(0.36),
        ),
      ],
      useMaterial3: true,
    );
  }

  ThemeMode themeMode() {
    return themeSettings.value.themeMode;
  }

  ThemeData theme(BuildContext context, [Color? targetColor]) {
    final brightness = MediaQuery.of(context).platformBrightness;
    /*return*/ brightness == Brightness.light ? light(targetColor) : dark(targetColor);
    return ThemeData(fontFamily: 'Montserrat', brightness: brightness);
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.themeSettings != themeSettings;
  }
}

Color randomColor() {
  return Color(Random().nextInt(0xFFFFFFFF));
}

class CustomBlendColor {
  const CustomBlendColor({
    required this.name,
    required this.color,
    this.blend = true,
  });

  final String name;
  final Color color;
  final bool blend;

  Color value(ThemeProvider provider) {
    return provider.custom(this);
  }
}
