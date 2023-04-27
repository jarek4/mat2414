import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';

import 'package:mat2414/src/ui/theme/theme.dart';

import 'package:provider/provider.dart';

import '../settings_tab_state.dart';

class AvatarChanger extends StatefulWidget {
  const AvatarChanger({Key? key}) : super(key: key);

// ListTile`s title and subtitle do not change on language change
// if this is StatelessWidget!
  @override
  State<AvatarChanger> createState() => _AvatarChangerState();
}

class _AvatarChangerState extends State<AvatarChanger> {
  late String _avatarLocale;

  @override
  void didChangeDependencies() {
    _avatarLocale = context.loc.settingsSetAvatar;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SettingsTabState, int>(
        selector: (_, state) => state.selectedAvatarIndex,
        shouldRebuild: (int pre, int next) {
          return pre != next;
        },
        builder: (BuildContext context, avatar, title) {
          return ListTile(
            key: const Key('settingsAvatarChanger'),
            title: Text(_avatarLocale, style: context.titleSmall),
            // subtitle: Text(_avatarLocale, style: context.bodySmall),
            onTap: () => _onTapHandling(context),
          );
        });
  }

  Future<void> _onTapHandling(BuildContext context) async {
    await _showChangeAvatarDialog(context).then((index) {
      if (index == null) return;
      context.read<SettingsTabState>().updateAvatar(index);
    });
  }

  Future<int?> _showChangeAvatarDialog(BuildContext context) {
    final avatars = context.read<SettingsTabState>().avatars;
    final selected = context.read<SettingsTabState>().selectedAvatarIndex;
    const barrierLabel = 'Do you want to cancel this action?';
    final title = Text(context.loc.settingsSetAvatar);
    final selectedBackground = context.colors.secondaryContainer;
    const background = Colors.white24;
    final selectedBorder = context.colors.tertiary;
    final border = Colors.black.withOpacity(0.2);
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return showCupertinoDialog<int?>(
          barrierDismissible: true,
          barrierLabel: barrierLabel,
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: title,
              actions: avatars.entries
                  .map((entry) => CupertinoDialogAction(
                        onPressed: () => Navigator.pop<int>(context, 0),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundColor: entry.key == selected ? selectedBorder : border,
                            radius: 75,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundColor:
                                    entry.key == selected ? selectedBackground : background,
                                backgroundImage: AssetImage(entry.value)),
                          ),
                        ),
                      ))
                  .toList(),
            );
          });
    } else {
      return showDialog<int?>(
          barrierLabel: barrierLabel,
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: title,
              children: avatars.entries
                  .map((entry) => SimpleDialogOption(
                        onPressed: () => Navigator.pop<int>(context, entry.key),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundColor: entry.key == selected ? selectedBorder : border,
                            radius: 75,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundColor:
                                    entry.key == selected ? selectedBackground : background,
                                backgroundImage: AssetImage(entry.value)),
                          ),
                        ),
                      ))
                  .toList(),
            );
          });
    }
  }
}
