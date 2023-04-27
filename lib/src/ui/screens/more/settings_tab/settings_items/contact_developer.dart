import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/terms_view.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bs;

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
      // onTap: () => _onTapHandling(),
    );
  }

  // onTapHandling open mail box - in native
}
