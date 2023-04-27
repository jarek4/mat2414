import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bs;

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  late String _helpLocale;

  @override
  void didChangeDependencies() {
    _helpLocale = context.loc.settingsHelp;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('settingsHelpView'),
      title: Text(_helpLocale, style: context.titleSmall),
      onTap: () => _openBottomSheet(),
    );
  }

  Future<void> _openBottomSheet() async {
    return await utils_bs.showCustomBottomSheet(context, _buildContent());
  }

  Widget _buildContent() {
    return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (context, controller) {
          return SafeArea(
            top: false,
            child: ListView.builder(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
              itemBuilder: (context, index) {
                return _buildHelpItems()[index];
              },
              itemCount: _buildHelpItems().length,
            ),
          );
        });
  }

  List<Widget> _buildHelpItems() => <Widget>[
        const SizedBox(height: 8),
        // create monthly report
        _buildHelpItemTitle(context.loc.reportCloseReportBtn),
        _buildHelpItemBody(context.loc.helpClosingReport),
        // bible studies number
        _buildHelpItemTitle(context.loc.generalBibleStudies),
        _buildHelpItemBody(context.loc.helpBibleStudies),
        // transferred minutes
        _buildHelpItemTitle(context.loc.generalTransferredMinutes),
        _buildHelpItemBody(context.loc.helpTransferMinutes),
        // LDC time
        _buildHelpItemTitle(context.loc.generalLDCHours),
        _buildHelpItemBody(context.loc.helpLdcHours),
      ];

  Widget _buildHelpItemTitle(String title) => Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 6.0),
        child: Text(title, style: context.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
      );

  Widget _buildHelpItemBody(String body) => Text(body, style: context.bodySmall);
}
