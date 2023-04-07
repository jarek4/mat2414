import 'package:flutter/material.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/user/user.dart';

import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService

  /* = locator<SettingsService>()*/;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;

  // User _user = User(createdAt: DateTime.now(), lastModified: DateTime.now(), id: 4, preferences: Preferences(minutesPrecision: MinutesPrecision.thirty, showButtonLCDHours: false));
  late User _user;

  User get user => _user;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _user = await _settingsService.getUser();
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateUser(User user) async {
    await _settingsService.updateUser(user);
    _user = await _settingsService.getUser();
    notifyListeners();
  }

  Future<void> updateUserRateTheApp(bool wasRated) async {
   /* var tempUser = _user;
    if (wasRated) {
      tempUser = tempUser.copyWith(haveRatedTheApp: true, nextRateRequestDate: null);
    } else {
      var nextAfterDays = 35;
      var displayedRequests = tempUser.displayedRatingRequestsNo;
      if (displayedRequests < 2) nextAfterDays = 15;
      if (displayedRequests > 5) nextAfterDays = 85;
      var nextDate = DateTime.now().add(Duration(days: nextAfterDays));
      tempUser = tempUser.copyWith(haveRatedTheApp: false,
          nextRateRequestDate: nextDate,
          displayedRatingRequestsNo: displayedRequests + 1);
    }
    await _settingsService.updateUser(user);
    _user = await _settingsService.getUser();
    notifyListeners();*/
    print('updateUserRateTheApp(bool $wasRated)');
  }

}

