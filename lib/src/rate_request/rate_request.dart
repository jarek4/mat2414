import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/scheduler.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import '../settings/settings_controller.dart';

class RateRequest extends StatefulWidget {
  const RateRequest({Key? key}) : super(key: key);

  @override
  State<RateRequest> createState() => _RateRequestState();
}

class _RateRequestState extends State<RateRequest> {
  bool? _isTimeToShowRateAppNotification;

  // duplication protection
  bool _wasNotificationShowNow = false;

  var _alertTitle = 'How are we doing?';
  var _btnRateNow = 'Rate it now';
  var _btnRateLater = 'Remind me later';
  var _alertContent =
      'If you enjoy using mat2414, would you mind taking a moment to rate it? Thanks for your support!';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _alertTitle = AppLocalizations.of(context).rateAppTitle;
    _btnRateNow = AppLocalizations.of(context).rateAppBtnNow;
    _btnRateLater = AppLocalizations.of(context).rateAppBtnLater;
    _alertContent = AppLocalizations.of(context).rateAppContent;
    // if user have not rated the app, display a notification at the appropriate time
    _isTimeToShowRateAppNotification = _checkDoNeedToRateNow();
    if (!_wasNotificationShowNow &&
        _isTimeToShowRateAppNotification != null &&
        _isTimeToShowRateAppNotification!) {
      _launchNotification();
    }
  }

  void _launchNotification() {
    // protection against duplication
    _wasNotificationShowNow = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () async {
        // if (mounted) prevent errors when user quickly switches bottom tabs
        if (mounted) {
          _launchRateAppDialog().then((wasRated) async {
            await context
                .read<SettingsController>()
                .updateUserAfterRateAppNotification(wasRated ?? false);
          });
        }
      });
    });
  }

  bool _checkDoNeedToRateNow() {
    var nextNotification = context.read<SettingsController>().user.nextRateRequestDate;
    // january.compareTo(may) -> -1; may.compareTo(january) -> 1
    var isNeedNow = nextNotification != null && nextNotification.compareTo(DateTime.now()) < 1;
    return isNeedNow;
  }

  Future<bool?> _launchRateAppDialog() async {
    return showGeneralDialog<bool>(
      barrierLabel: 'Please rate the app. $_btnRateLater',
      barrierDismissible: true,
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, _) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _rateAppDialog(),
        );
      },
      transitionDuration: const Duration(milliseconds: 380),
    );
  }

  Widget _rateAppDialog() {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      elevation: 8.0,
      titleTextStyle: context.titleMedium?.copyWith(color: context.colors.onErrorContainer),
      title: Text(_alertTitle, textAlign: TextAlign.center),
      content: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 0, 8.0, 14.0),
              child: Text(_alertContent),
            ),
            _divider(),
            TextButton(
                onPressed: () {
                  context.read<SettingsController>().openStoreUrlToRateTheApp();
                  Navigator.pop<bool>(context, true);
                },
                child: Text(_btnRateNow)),
            _divider(),
            TextButton(
                onPressed: () => Navigator.pop<bool>(context, false), child: Text(_btnRateLater)),
          ],
        ),
      ),
    );
  }

  Divider _divider() => const Divider(height: 1.6, thickness: 1.2);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
