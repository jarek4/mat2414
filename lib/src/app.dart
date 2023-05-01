import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/ui/navigation/navigation.dart';

import 'package:mat2414/src/ui/root_widget.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/scaffold_key.dart' as global_key;
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
  ValueNotifier<ThemeSettings> settingsNotifier = ValueNotifier(ThemeSettings(
      sourceColor: AppColors.primaryBrandColor,
      themeMode: locator<SettingsController>().themeMode,
      localeCode: locator<SettingsController>().user.languageCode));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsController>.value(value: widget.settingsController),
          ChangeNotifierProvider<BottomNavigationController>(
              create: (_) => BottomNavigationController()),
          ChangeNotifierProvider<CalendarStateProvider>(create: (_) => CalendarStateProvider()),
        ],
        child: Consumer<SettingsController>(builder: (context, settings, _) {
          settingsNotifier.value = ThemeSettings(
              sourceColor: AppColors.primaryBrandColor,
              themeMode: settings.themeMode,
              localeCode: settings.user.languageCode);
          return DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) => ThemeProvider(
                lightDynamic: lightDynamic,
                darkDynamic: darkDynamic,
                themeSettings: settingsNotifier,
                child: NotificationListener<ThemeSettingChange>(
                  onNotification: (notification) {
                    settingsNotifier.value = notification.settings;
                    return true;
                  },
                  child: ValueListenableBuilder<ThemeSettings>(
                    valueListenable: settingsNotifier,
                    builder: (context, value, _) {
                      final theme = ThemeProvider.of(context);
                      Locale? loc = settingsNotifier.value.localeCode.isEmpty
                          ? null
                          : Locale(settingsNotifier.value.localeCode);
                      return MaterialApp(
                        restorationScopeId: 'app',
                        scaffoldMessengerKey: global_key.scaffoldKey,
                        // localizationsDelegates: const [
                        //   AppLocalizations.delegate,
                        //   GlobalMaterialLocalizations.delegate,
                        //   GlobalWidgetsLocalizations.delegate,
                        //   GlobalCupertinoLocalizations.delegate,
                        // ],
                        localizationsDelegates: AppLocalizations.localizationsDelegates,
                        // supportedLocales: AppLocales.all,
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: loc,
                        onGenerateTitle: (BuildContext context) =>
                            AppLocalizations.of(context).appTitle,
                        theme: theme.light(settingsNotifier.value.sourceColor),
                        darkTheme: theme.dark(settingsNotifier.value.sourceColor),
                        themeMode: settingsNotifier.value.themeMode,

                        home: Selector<SettingsController, bool>(
                            selector: (_, settings) => settings.user.isOnboardingPassed,
                            shouldRebuild: (bool pre, bool next) {
                              return pre != next;
                            },
                            builder: (BuildContext context, isOnboarded, __) {
                              return const RootWidget();
                              // if (isOnboarded) return const RootWidget();
                              // return const OnboardingScreen();
                            }),
                      );
                    },
                  ),
                )),
          );
        }));
  }
}
