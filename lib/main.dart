import 'package:flutter/material.dart';
import 'locator.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // LocalDb? ob = await LocalDb.create();
  // print('mrb.getAll: ${ob.mrb.getAll().toList()}');
  // Activity? ob1 = ob.ab.get(1);
  // Activity? ob2 = ob.ab.get(2);
  // Activity? ob3 = ob.ab.get(3);
  // Activity? ob4 = ob.ab.get(4);

  // print('ob1 == ob2:${ob1 == ob2};');
  // // print('mr1 == mr2: ${mr1 == mr2}; ob1 == ob2: ${ob1 == ob2}');
  // print('ob3: $ob1');
  // print('ob4: $ob2');
  // print('mrb.getAll: ${ob.mrb.getAll().toList()}');


  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();


// (Optional) Close at some later point.
  //admin.close();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
