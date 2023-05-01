import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/localization/locale_notifier.dart';
import 'package:mat2414/src/settings/native_code/n_open_link.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/asset_path.dart';
import 'package:mat2414/utils/constant_values.dart';

enum SettingsTabStatus { loading, success }

class SettingsTabState with ChangeNotifier {
  SettingsTabState() {
    setup();
  }

  final SettingsController _settings = locator<SettingsController>();

  final ILocaleNotifier _s = locator<ILocaleNotifier>();

  SettingsTabStatus _status = SettingsTabStatus.loading;

  SettingsTabStatus get status => _status;

  // 0 - system, 1 - light, 2 - dark
  int _themeModeIndex = 0;

  int get themeModeIndex => _themeModeIndex;

  Future<void> updateTheme(int themeIndex) async {
    if (themeIndex < 0 || themeIndex > 2) themeIndex = 0;
    if (_themeModeIndex != themeIndex) {
      _themeModeIndex = themeIndex;
      await _settings.updateThemeMode(themeIndex);
      notifyListeners();
    }
  }

  List<Locale> _supportedLocales = [];

  List<Locale> get supportedLocales => _supportedLocales;

  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  Future<void> updateLanguage(String localeCode) async {
    Locale? newLocale;
    if (localeCode.isNotEmpty && _checkLocale(localeCode)) newLocale = Locale(localeCode);
    if (_currentLocale != newLocale) {
      _currentLocale = newLocale;
      await _settings.updateUser(_settings.user.copyWith(languageCode: localeCode));
      notifyListeners();
    }
  }

  bool _checkLocale(String code) {
    return _supportedLocales.contains(Locale(code));
  }

  Map<int, String> get avatars => AssetPath.availableAvatars;

  int _selectedAvatarIndex = 0;

  int get selectedAvatarIndex => _selectedAvatarIndex;

  Future<void> updateAvatar(int index) async {
    if (!avatars.containsKey(index)) index = avatars.keys.first;
    if (_selectedAvatarIndex != index) {
      _selectedAvatarIndex = index;
      await _settings.updateUser(_settings.user.copyWith(avatarIndex: index));
      notifyListeners();
    }
  }

  String _username = '';

  String get username => _username;

  Future<void> updateUsername(String name) async {
    if (_username != name) {
      _username = name;
      await _settings.updateUser(_settings.user.copyWith(name: name));
      notifyListeners();
    }
  }

  Future<void> mailTo(String title) async {
    final user = _settings.user.name;
    await NOpenLink.openMailTo(subject: title, from: user);
  }

  void setup() {
    if (_status != SettingsTabStatus.loading) {
      _status = SettingsTabStatus.loading;
      notifyListeners();
    }
    _themeModeIndex = _settings.themeMode.index;
    _supportedLocales = _s.supportedLocales;
    _currentLocale = _s.currentLocale;
    _selectedAvatarIndex = _settings.user.avatarIndex;
    if (_settings.user.name != ConstantValues.emptyUser.name && _settings.user.name != _username) {
      _username = _settings.user.name;
    }
    _status = SettingsTabStatus.success;
    notifyListeners();
  }

  bool _isMounted = true;

  @override
  void notifyListeners() {
    if (_isMounted) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false;
  }
}
