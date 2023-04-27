import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bs;
import 'package:mat2414/utils/show_confirmation_dialog.dart' as utils_alert;

import '../settings_tab_state.dart';



class UsernameChanger extends StatefulWidget {
  const UsernameChanger({Key? key}) : super(key: key);

  @override
  State<UsernameChanger> createState() => _UsernameChangerState();
}

class _UsernameChangerState extends State<UsernameChanger> {
  late String _usernameLocale;

  @override
  void didChangeDependencies() {
    _usernameLocale = context.loc.settingsUpdateUsername;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsTabState, String>(
      selector: (_, state) => state.username,
      shouldRebuild: (String pre, String next) {
        return pre != next;
      },
      builder: (BuildContext context, name, title) {
        return ListTile(
          key: const Key('settingsUsernameChanger'),
          title: title,
          subtitle: Text(name, style: context.bodySmall),
          onTap: () => _onTapHandling(context),
        );
      },
      child: Text(_usernameLocale, style: context.titleSmall),
    );
  }

  Future<void> _onTapHandling(BuildContext context) async {
    await _getUsernameFromInput().then((name) {
      final title = Text(context.loc.dialogWantToSave);
      final question = '$_usernameLocale: ${name ?? ''}';
      utils_alert
          .showConfirmationDialog(context, question,title: title)
          .then((res) {
        if(res != null && res) context.read<SettingsTabState>().updateUsername(name ?? '');
      });
    });
  }

  Future<String?> _getUsernameFromInput() async {
    final titleStyle = context.bodyMedium;
    String? name;
    await utils_bs.showCustomBottomSheet<String>(
      context,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: TextFormField(
                style: titleStyle,
                decoration: InputDecoration(labelText: '${context.loc.onBoardingYourName}:'),
                keyboardType: TextInputType.name,
                autofocus: true,
                maxLength: 20,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[&=!\*\+\.\?\$\(\{\\]')),
                ],
                onChanged: (v) => name = v),
          ),
          Expanded(
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              ),
              onPressed: () => Navigator.pop<String>(context, name),
              child: Text(context.loc.generalSave,
                  style: context.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
        ]),
      ),
    );
    return name;
  }

}