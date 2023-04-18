import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

class LocaleNotifier implements ILocaleNotifier {
  LocaleNotifier();

  @override
  void update(List<Locale> supported, Locale locales) {
    if (supported.contains(locales)) {
      _loc = lookupAppLocalizations(locales);
    } else {
      _loc = lookupAppLocalizations(const Locale('en'));
    }
  }

  AppLocalizations _loc = lookupAppLocalizations(
      basicLocaleListResolution([ui.window.locale], AppLocalizations.supportedLocales));

  @override
  AppLocalizations get loc => _loc;
}

abstract class ILocaleNotifier {

  void update(List<Locale> supported, Locale locales);

  AppLocalizations get loc;
}
