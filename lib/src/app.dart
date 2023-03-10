import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/ui/navigation/navigation.dart';
import 'package:mat2414/src/ui/root_widget.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import 'calendar/calendar_state_provider.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: AppColors.primaryBrandColor,
    themeMode: ThemeMode.system,
  ));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsController>.value(value: widget.settingsController),
        ChangeNotifierProvider<BottomNavigationController>(
            create: (_) => BottomNavigationController()),
        ChangeNotifierProvider<CalendarStateProvider>(create: (_) => CalendarStateProvider()),
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
            lightDynamic: lightDynamic,
            darkDynamic: darkDynamic,
            themeSettings: settings,
            child: NotificationListener<ThemeSettingChange>(
              onNotification: (notification) {
                settings.value = notification.settings;
                return true;
              },
              child: ValueListenableBuilder<ThemeSettings>(
                valueListenable: settings,
                builder: (context, value, _) {
                  final theme = ThemeProvider.of(context);
                  return MaterialApp(
                    restorationScopeId: 'app',
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en', ''), // English, no country code
                    ],
                    onGenerateTitle: (BuildContext context) =>
                        AppLocalizations.of(context)!.appTitle,
                    theme: theme.light(settings.value.sourceColor).copyWith(),
                    darkTheme: theme.dark(settings.value.sourceColor),
                    themeMode: theme.themeMode(),
                    home: const RootWidget(),
                  );
                },
              ),
            )),
      ),
    );
  }
}
