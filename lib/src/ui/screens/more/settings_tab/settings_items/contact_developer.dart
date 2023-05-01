import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/screens/more/settings_tab/settings_tab_state.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class ContactDeveloper extends StatefulWidget {
  const ContactDeveloper({Key? key}) : super(key: key);

  @override
  State<ContactDeveloper> createState() => _ContactDeveloperState();
}

class _ContactDeveloperState extends State<ContactDeveloper> {
  late String _privacyStatementLocale;

  @override
  void didChangeDependencies() {
    _privacyStatementLocale = context.loc.settingsContactDev;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('settingsPrivacyStatementView'),
      title: Text(_privacyStatementLocale, style: context.titleSmall),
      subtitle: Text('4forin@gmail.com', style: context.bodySmall),
      onTap: () => context.read<SettingsTabState>().mailTo('Mat2414_contact'),
    );
  }

  // onTapHandling open mail box - in native
}
