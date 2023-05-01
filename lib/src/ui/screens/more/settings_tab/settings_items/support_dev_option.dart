import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/snackbar_info.dart' as utils_sb;
import 'package:provider/provider.dart';

import '../settings_tab_state.dart';

class SupportDevOption extends StatefulWidget {
  const SupportDevOption({Key? key}) : super(key: key);

  @override
  State<SupportDevOption> createState() => _SupportDevOptionState();
}

class _SupportDevOptionState extends State<SupportDevOption> {
  late String _donationLocale;

  @override
  void didChangeDependencies() {
    _donationLocale = context.loc.settingsSupportDev;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('settingsSupportDevOption'),
      title: Text(_donationLocale, style: context.titleSmall),
      subtitle: _buildExpansionTileWithOptions(context),
    );
  }

  Widget _buildExpansionTileWithOptions(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    final rev = '${context.loc.generalCopy} Revtag';
    final paypal = '${context.loc.generalCopy} PayPal username';
    return Theme(
      data: theme,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        trailing: const SizedBox.shrink(),
        title: Text(context.loc.generalThx, style: context.bodySmall),
        children: [
          _buildSupportOption(rev, AssetPath.icRevolut, () => _handleCopy('myRevtag')),
          const SizedBox(height: 12),
          _buildSupportOption(paypal, AssetPath.icPaypal, () => _handleCopy('paypalusernam')),
          const SizedBox(height: 12),
          _buildMoreOptions(context),
        ],
      ),
    );
  }

  Widget _buildSupportOption(String txt, String imgPath, VoidCallback handling) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: 30,
        child: TextButton.icon(
            onPressed: handling,
            icon: const FittedBox(child: Icon(Icons.copy)),
            label: FittedBox(child: Text(txt))),
      ),
      SizedBox(width: 40, height: 20, child: Image.asset(imgPath)),
    ]);
  }

  Future<void> _handleCopy(String data) async {
    await Clipboard.setData(ClipboardData(text: data))
        .then((value) => utils_sb.showSnackBarInfo(context, 'Copied: $data'));
  }

  Align _buildMoreOptions(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 30,
        child: TextButton.icon(
          onPressed: () => context.read<SettingsTabState>().mailTo('Mat2414_donations'),
          icon: const FittedBox(child: Icon(Icons.alternate_email)),
          label: FittedBox(child: Text(context.loc.settingsSupportDevMoreOptions)),
        ),
      ),
    );
  }
}