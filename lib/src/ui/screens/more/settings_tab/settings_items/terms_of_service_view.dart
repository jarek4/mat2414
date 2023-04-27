import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

class TermsOfServiceView extends StatefulWidget {
  const TermsOfServiceView({Key? key}) : super(key: key);

  @override
  State<TermsOfServiceView> createState() => _TermsOfServiceViewState();
}

class _TermsOfServiceViewState extends State<TermsOfServiceView> {
  late String _privacyStatementLocale;

  @override
  void didChangeDependencies() {
    _privacyStatementLocale = context.loc.settingsTermsOfUse;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('settingsPrivacyStatementView'),
      title: Text(_privacyStatementLocale, style: context.titleSmall),
      // subtitle: Text('name', style: context.bodySmall),
      onTap: () => _openAboutDialog(),
    );
  }

  void _openAboutDialog() => showAboutDialog(
      context: context,
      applicationVersion: '1.0.5',
      applicationIcon: Image.asset(AssetPath.imgPreacher, width: 40, height: 40),
      applicationLegalese: 'BSD 2 License');

}
