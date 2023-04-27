import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/change_locale_code_to_language.dart' as utils_cl;
import 'package:provider/provider.dart';

import '../settings_tab_state.dart';

class LanguageChanger extends StatelessWidget {
  const LanguageChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsTabState, Locale?>(
        selector: (_, state) => state.currentLocale,
        shouldRebuild: (Locale? pre, Locale? next) {
          return pre != next;
        },
        builder: (BuildContext context, locale, title) {
          final localeCode = locale?.languageCode ?? '';
          final lang = utils_cl.changeLocaleCodeToLanguage(localeCode);
          return ListTile(
            key: const Key('settingsLanguageChanger'),
            title: title,
            subtitle: Text(lang, style: context.bodySmall),
            onTap: () => _onTapHandling(context),
          );
        },
      child: Text(context.loc.settingsLanguage, style: context.titleSmall),
    );
  }

  Future<void> _onTapHandling(BuildContext context) async {
    await _showChangeLanguageDialog(context).then((locale) {
      if (locale == null) return;
      context.read<SettingsTabState>().updateLanguage(locale);
    });
  }

  Future<String?> _showChangeLanguageDialog(BuildContext context) {
    const barrierLabel = 'Do you want to cancel this action?';
    final title = Text(context.loc.settingsLanguage);
    final defaultStyle = context.labelMedium;
    final selectedStyle = defaultStyle?.copyWith(fontWeight: FontWeight.bold);
    var supported = context.read<SettingsTabState>().supportedLocales;

    final String currentLocaleCode =
        context.read<SettingsTabState>().currentLocale?.languageCode ?? '';

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return showCupertinoDialog<String?>(
          barrierDismissible: true,
          barrierLabel: barrierLabel,
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: title,
              actions: supported
                  .map((e) => CupertinoDialogAction(
                        onPressed: () => Navigator.pop<String>(context, e.languageCode),
                        child: Text(
                          utils_cl.changeLocaleCodeToLanguage(e.languageCode),
                          style: currentLocaleCode == e.languageCode ? selectedStyle : defaultStyle,
                        ),
                      ))
                  .toList(),
            );
          });
    } else {
      return showDialog<String?>(
          barrierLabel: barrierLabel,
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: title,
              children: supported
                  .map((e) => SimpleDialogOption(
                      onPressed: () => Navigator.pop<String>(context, e.languageCode),
                      child: Text(
                        utils_cl.changeLocaleCodeToLanguage(e.languageCode),
                        style: currentLocaleCode == e.languageCode ? selectedStyle : defaultStyle,
                      )))
                  .toList(),
            );
          });
    }
  }
}
