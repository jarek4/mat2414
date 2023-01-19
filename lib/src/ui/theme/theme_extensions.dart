import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  // TextTheme get textTheme => GoogleFonts.montserratTextTheme(theme.textTheme);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  // very very big
  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  //  very big
  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  // how to use: style: context.displaySmall
  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
    fontFamily: 'Montserrat',
    // color: colors.onSurface,
  );
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
    color: colors.onSurface,
  );
  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
    fontFamily: 'Montserrat',
    //color: colors.onSurface,
  );
  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
    fontFamily: 'Montserrat',
    //color: colors.onSurface,
  );
  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
    fontFamily: 'Montserrat',
    color: colors.onSurface,
  );
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}
/*extension CustomScreenTabStyle on BuildContext {
  ThemeExtension<dynamic> screenTabStyle = CustomScreenTabStyle();
  ThemeData get theme => Theme.of(this).copyWith(
      extensions: ThemeExtension<dynamic>{
  CustomScreenTabStyle(),
  });
  // extensions: ThemeExtension<dynamic>{
  // CustomScreenTabStyle(),

}*/


// extension DurationString on String {
//   /// Assumes a string (roughly) of the format '\d{1,2}:\d{2}'
//   Duration toDuration() {
//     final chunks = split(':');
//     if (chunks.length == 1) {
//       throw Exception('Invalid duration string: $this');
//     } else if (chunks.length == 2) {
//       return Duration(
//         minutes: int.parse(chunks[0].trim()),
//         seconds: int.parse(chunks[1].trim()),
//       );
//     } else if (chunks.length == 3) {
//       return Duration(
//         hours: int.parse(chunks[0].trim()),
//         minutes: int.parse(chunks[1].trim()),
//         seconds: int.parse(chunks[2].trim()),
//       );
//     } else {
//       throw Exception('Invalid duration string: $this');
//     }
//   }
// }

// extension HumanizedDuration on Duration {
//   String toHumanizedString() {
//     final seconds = '${inSeconds % 60}'.padLeft(2, '0');
//     String minutes = '${inMinutes % 60}';
//     if (inHours > 0 || inMinutes == 0) {
//       minutes = minutes.padLeft(2, '0');
//     }
//     String value = '$minutes:$seconds';
//     if (inHours > 0) {
//       value = '$inHours:$minutes:$seconds';
//     }
//     return value;
//   }
// }