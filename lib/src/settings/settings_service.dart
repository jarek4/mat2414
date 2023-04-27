import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/user/user.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';

import 'native_code/n_open_link.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  final IUserRepository _userRepository = locator<IUserRepository>();

  Future<User> getUser() async => _userRepository.user;

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode()  async {
    try {
      // 0 - system, 1 - light, 2 - dark
      var index = _userRepository.user.preferences.themeMode;
      return ThemeMode.values[index];
    } catch (e) {
      if (kDebugMode) print('SettingsService-themeMode E: $e');
      return ThemeMode.system;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(int theme) async {
    try {
      final user = _userRepository.user;
      final prefs = user.preferences;
      await _userRepository.update(user.copyWith(preferences: prefs.copyWith(themeMode: theme)));
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> updateUser(User user) async {
    await _userRepository.update(user);
  }

  Future<bool> openStoreUrl() async {
    var url = 'https://google.com';
    if (Platform.isIOS) url = 'https://www.apple.com/app-store/';
    if (Platform.isAndroid) url = 'https://play.google.com/store';

    await NOpenLink.openUrl(url);

    return true;
  }
}
