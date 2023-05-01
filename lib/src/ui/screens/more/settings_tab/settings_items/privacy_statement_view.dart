import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/terms_view.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bs;

class PrivacyStatementView extends StatefulWidget {
  const PrivacyStatementView({Key? key}) : super(key: key);

  @override
  State<PrivacyStatementView> createState() => _PrivacyStatementViewState();
}

class _PrivacyStatementViewState extends State<PrivacyStatementView> {
  late String _privacyStatementLocale;

  @override
  void didChangeDependencies() {
    _privacyStatementLocale = context.loc.settingsPrivacyStatement;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('settingsPrivacyStatementView'),
      title: Text(_privacyStatementLocale, style: context.titleSmall),
      onTap: () => _openBottomSheet(),
    );
  }

  Future<void> _openBottomSheet() async {
    return await utils_bs.showCustomBottomSheet(context, TermsView(filePath: AssetPath.txtPrivacy));
  }
}
