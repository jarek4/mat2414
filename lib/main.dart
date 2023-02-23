import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/src/data/database/local_db.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'locator.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final settingsController = SettingsController(SettingsService());
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  PlatformDispatcher.instance.onError = (error, stack) {
    // myBackend.sendError(error, stack);

    if (kDebugMode) {
      print('PlatformDispatcher ERROR: $error\n StackTrace: $stack');
    }
    return true;
  };
  runApp(MyApp(settingsController: settingsController));
}
