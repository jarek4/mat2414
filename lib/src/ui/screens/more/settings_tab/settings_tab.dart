import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'settings_items/settings_items.dart';
import 'settings_tab_state.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsTabState>(
      create: (_) => SettingsTabState(),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        key: const Key('More-SettingsTab'),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _settingsItems[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(thickness: 1.2, height: 0.1);
        },
        itemCount: _settingsItems.length,
      ),
    );
  }

  static final _settingsItems = <Widget>[
    const UsernameChanger(),
    const ThemeChanger(),
    const LanguageChanger(),
    const SupportDevOption(),
    const AvatarChanger(),
    const RateTheApp(),
    const HelpView(),
    const TermsOfServiceView(),
    const PrivacyStatementView(),
    const ContactDeveloper(),
  ];
}
