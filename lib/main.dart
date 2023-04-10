import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'locator.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  // locator.registerSingletonAsync<Isar> have to complete this async!
  await locator.allReady();
  // final settingsController = SettingsController(SettingsService());
  final settingsController = locator<SettingsController>();
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
