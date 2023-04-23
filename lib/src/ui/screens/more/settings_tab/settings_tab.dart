import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../more_screen_state_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoreScreenStateProvider>(
      create: (_) => MoreScreenStateProvider(),
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          key: const Key('More-SettingsScreen'),
          shrinkWrap: true,
          children: [
            _buildDonateTile(context),
            _buildThemeModeTile(),
            _buildLanguageTile(context),
            _buildHelpTile(context),
            _buildRateAppTile(context),
            _buildTermsTile(),
            _buildPrivacyTile(),
          ]),
    );
  }

  Widget _buildDonateTile(BuildContext context) {
    return ListTile(title: Text('DONATE'));
  }

  Widget _buildThemeModeTile() {
    return ListTile(title: Text('THEME MODE'));
  }

  Widget _buildLanguageTile(BuildContext context) {
    return ListTile(title: Text('LANGUAGE'));
  }

  Widget _buildHelpTile(BuildContext context) {
    return ListTile(title: Text('HELP'));
  }

  Widget _buildRateAppTile(BuildContext context) {
    return ListTile(title: Text('RATE APP'));
  }

  Widget _buildTermsTile() {
    return ListTile(title: Text('TERMS OF SERVICE'));
  }

  Widget _buildPrivacyTile() {
    return ListTile(title: Text('PRIVACY STATMENT'));
  }
}
