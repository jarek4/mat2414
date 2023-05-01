import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class RateTheApp extends StatefulWidget {
  const RateTheApp({Key? key}) : super(key: key);

  @override
  State<RateTheApp> createState() => _RateTheAppState();
}

class _RateTheAppState extends State<RateTheApp> {
  late String _rateAppLocale;

  @override
  void didChangeDependencies() {
    _rateAppLocale = context.loc.settingsRateApp;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('settingsRateTheApp'),
      title: Text(_rateAppLocale, style: context.titleSmall),
      onTap: () => _onTapHandling(),
    );
  }

  Future<void>_onTapHandling() async{
    await context.read<SettingsController>().openStoreUrlToRateTheApp();
  }
}
