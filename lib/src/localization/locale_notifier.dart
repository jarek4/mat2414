import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

class LocaleNotifier with ChangeNotifier implements ILocaleNotifier {
  LocaleNotifier();

  Locale _currentLocale = ui.window.locale;

  final List<Locale> _supportedLocales = AppLocalizations.supportedLocales;

  @override
  void update(List<Locale> supported, Locale locale) {
    if (supported.contains(locale)) {
      _currentLocale = locale;
      _loc = lookupAppLocalizations(locale);
    } else {
      _loc = lookupAppLocalizations(const Locale('en'));
    }
    notifyListeners();
  }

  AppLocalizations _loc = lookupAppLocalizations(
      basicLocaleListResolution([ui.window.locale], AppLocalizations.supportedLocales));

  @override
  AppLocalizations get loc => _loc;

  @override
  Locale get currentLocale => _currentLocale;

  @override
  List<Locale> get supportedLocales => _supportedLocales;
}

abstract class ILocaleNotifier {
  void update(List<Locale> supported, Locale locale);

  AppLocalizations get loc;

  Locale get currentLocale;

  List<Locale> get supportedLocales;
}
