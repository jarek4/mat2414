import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';
import '../settings_tab_state.dart';


class ThemeChanger extends StatefulWidget {
  const ThemeChanger({Key? key}) : super(key: key);

// ListTile`s title and subtitle do not change on language change
// if this is StatelessWidget!
  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  late String _title, _auto, _light, _dark;
  late Widget _titleWidget;

  @override
  void didChangeDependencies() {
    _title = context.loc.settingsThemeMode;
    _titleWidget = Text(context.loc.settingsThemeMode);
    _auto = context.loc.settingsThemeSystemTheme; // 0
    _light = context.loc.settingsThemeLightTheme; // 1
    _dark = context.loc.settingsThemeDarkTheme; // 2
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsTabState, int>(
        selector: (_, state) => state.themeModeIndex,
        shouldRebuild: (int pre, int next) {
          return pre != next;
        },
        builder: (BuildContext context, theme, title) {
          final subTitle = _convertThemeModeIndex(context, theme);
          return ListTile(
            key: const Key('settingsThemeChanger'),
            title: Text(_title, style: context.titleSmall),
            subtitle: Text(subTitle, style: context.bodySmall),
            onTap: () => _onTapHandling(context),
          );
        });
  }

  String _convertThemeModeIndex(BuildContext context, int index) {
    switch (index) {
      case 1:
        return context.loc.settingsThemeSystemTheme;
      case 2:
        return context.loc.settingsThemeDarkTheme;
      default:
        return context.loc.settingsThemeSystemTheme;
    }
  }

  Future<void> _onTapHandling(BuildContext context) async {
    await _showChangeThemeDialog(context).then((themeIndex) {
      if (themeIndex == null) return;
      if (themeIndex < 0 || themeIndex > 2) themeIndex = 0;
      context.read<SettingsTabState>().updateTheme(themeIndex);
    });
  }

  Future<int?> _showChangeThemeDialog(BuildContext context) {
    const barrierLabel = 'Do you want to cancel this action?';
    final inactiveColor =
        Theme.of(context).iconTheme.color?.withOpacity(0.5) ?? Colors.black.withOpacity(0.3);
    final activeColor = Theme.of(context).colorScheme.primary.withOpacity(0.8);

    final int currentTheme = context.read<SettingsTabState>().themeModeIndex;

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return showCupertinoDialog<int>(
          barrierDismissible: true,
          barrierLabel: barrierLabel,
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(title: _titleWidget, actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop<int>(context, 0),
                child: Row(children: [
                  Icon(CupertinoIcons.device_phone_portrait,
                      color: currentTheme == 0 ? activeColor : inactiveColor),
                  const SizedBox(width: 12),
                  Text(_auto, style: context.bodySmall),
                ]),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.pop<int>(context, 1),
                child: Row(children: [
                  Icon(CupertinoIcons.brightness,
                      color: currentTheme == 1 ? activeColor : inactiveColor),
                  const SizedBox(width: 12),
                  Text(_light, style: context.bodySmall),
                ]),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.pop<int>(context, 2),
                child: Row(children: [
                  Icon(CupertinoIcons.moon_stars,
                      color: currentTheme == 2 ? activeColor : inactiveColor),
                  const SizedBox(width: 12),
                  Text(_dark, style: context.bodySmall),
                ]),
              ),
            ]);
          });
    } else {
      return showDialog<int>(
          barrierLabel: barrierLabel,
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return SimpleDialog(title: _titleWidget, children: [
              SimpleDialogOption(
                onPressed: () => Navigator.pop<int>(context, 0),
                child: Row(children: [
                  Icon(Icons.device_unknown_outlined,
                      color: currentTheme == 0 ? activeColor : inactiveColor),
                  const SizedBox(width: 12),
                  Text(_auto, style: context.bodySmall),
                ]),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop<int>(context, 1),
                child: Row(children: [
                  Icon(Icons.light_mode_outlined,
                      color: currentTheme == 1 ? activeColor : inactiveColor),
                  const SizedBox(width: 12),
                  Text(_light, style: context.bodySmall),
                ]),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop<int>(context, 2),
                child: Row(children: [
                  Icon(Icons.dark_mode_outlined,
                      color: currentTheme == 2 ? activeColor : inactiveColor),
                  const SizedBox(width: 12),
                  Text(_dark, style: context.bodySmall),
                ]),
              ),
            ]);
          });
    }
  }
}
