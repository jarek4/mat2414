import 'package:flutter/material.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/user/user.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  final IUserRepository _userRepository = locator<IUserRepository>();

  Future<User> getUser() async => _userRepository.user;

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }

  Future<void> updateUser(User user) async {
    await _userRepository.update(user);
  }
}
