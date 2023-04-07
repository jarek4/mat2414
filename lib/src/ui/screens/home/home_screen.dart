import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/activity_add_update/activity_add_update_view.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'home_screen_state_provider.dart';
import 'last_activities.dart';
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bottom_sheet;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  String _hello = 'Hello!', _lastActivity = 'Your last activity:', _today = 'Today is';

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _hello = AppLocalizations.of(context)?.homeHello('Default user') ?? _hello;
    _lastActivity = AppLocalizations.of(context)?.homeYorLastActivities ?? _lastActivity;
    _today = AppLocalizations.of(context)?.homeTodayIs ?? _today;
  }

  @override
  void initState() {
    super.initState();
    // if user have not rated the app display a notification at the appropriate time
    if (!_checkDoNeedToRateTheAppNow()) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 1000), () async {
          _launchRateAppDialog().then((wasRated) async {
            await Provider.of<SettingsController>(context, listen: false)
                .updateUserRateTheApp(wasRated ?? false);
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    String? tempNotification;
    return ChangeNotifierProvider<HomeScreenStateProvider>(
      create: (_) => HomeScreenStateProvider(),
      child: LayoutBuilder(builder: (context, constraints) {
        // maxHeight - portrait: 679.27; horizontal: 312.72
        // ..maxHeight portrait:  BoxConstraints(0.0<=w<=392.7, 0.0<=h<=679.3)
        // ..maxHeight horizontal: BoxConstraints(0.0<=w<=759.3, 0.0<=h<=312.7)
        // portrait:  constraints.isMobile=true; constraints.isTablet=false
        // horizontal: constraints.isMobile=false; constraints.isTablet=true
        final bool showHeader = isPortrait || constraints.maxHeight > 400;

        return Container(
          color: context.colors.primaryContainer,
          constraints:
              const BoxConstraints(maxHeight: double.maxFinite, minWidth: double.maxFinite),
          child: Column(children: [
            _buildHeader(showHeader, constraints),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(minWidth: double.maxFinite),
                decoration: BoxDecoration(
                  color: context.colors.background,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                ),
                child: Column(children: [
                  FittedBox(child: Text(_hello, style: context.headlineSmall)),
                  FittedBox(
                      child: Text(
                          '$_today ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: context.titleLarge)),
                  const SizedBox(height: 16.0),
                  FittedBox(
                      child: Text(_lastActivity,
                          style: context.titleMedium, textAlign: TextAlign.start)),
                  const Expanded(child: LastActivities()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                        final String activitySaved =
                            AppLocalizations.of(context)?.addActivityBtnSavedNotification ??
                                'Activity was saved.';
                        final String activityNotSaved =
                            AppLocalizations.of(context)?.addActivityBtnNotSavedNotification ??
                                'Not saved.';
                        return Column(children: [
                          if (tempNotification != null)
                            AnimatedUserNotification(height: 28, msg: tempNotification ?? ''),
                          AddActivityWidget(
                              isSmall: false,
                              handle: () async {
                                final Activity? a = await _openAddBottomSheet(context);
                                if (a == null) {
                                  if (timer != null && timer!.isActive) timer?.cancel();
                                  setState(() => tempNotification = activityNotSaved);
                                  timer = Timer(const Duration(milliseconds: 3000), () {
                                    if (mounted) setState(() => tempNotification = null);
                                  });
                                } else {
                                  if (timer != null && timer!.isActive) timer?.cancel();
                                  setState(() => tempNotification = activitySaved);
                                  timer = Timer(const Duration(milliseconds: 3000), () {
                                    if (mounted) setState(() => tempNotification = null);
                                  });
                                }
                              })
                        ]);
                      }),
                    ),
                  )
                ]),
              ),
            ),
          ]),
        );
      }),
    );
  }

  SingleChildRenderObjectWidget _buildHeader(bool showHeader, BoxConstraints constraints) {
    return showHeader
        ? Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36),
              // child: Image.asset(AssetPath.imgPreacher, fit: BoxFit.fitHeight),
              child: Image.asset(AssetPath.imgWomenPreacher, fit: BoxFit.fitHeight),
            ),
          )
        : const SizedBox.shrink();
  }

  Future<Activity?> _openAddBottomSheet(BuildContext context) async {
    return await utils_bottom_sheet.showCustomBottomSheet<Activity>(
        context, const ActivityAddUpdateView());
  }

  bool _checkDoNeedToRateTheAppNow() {
    var isRated = !Provider.of<SettingsController>(context, listen: false).user.haveRatedTheApp;
    if (!isRated) return false;
    var nextNotification =
        Provider.of<SettingsController>(context, listen: false).user.nextRateRequestDate;
    if (nextNotification != null && nextNotification.compareTo(DateTime.now()) > -1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> _launchRateAppDialog() async {
    return showGeneralDialog<bool>(
      barrierLabel: 'Please rate the app. Remind me later',
      barrierDismissible: true,
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, _) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
              title: Text('How are we doing?'),
              content: Text(
                  'If you enjoy using mat2414, would you mind taking a moment to rate it? Thanks for your support!'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop<bool>(context, false),
                    child: Text('Remind me later')),
                TextButton(
                    onPressed: () {
                      Provider.of<SettingsController>(context, listen: false).openStoreUrl();
                      Navigator.pop<bool>(context, true);
                    },
                    child: Text('Rate it now'))
              ]),
        );
      },
      transitionDuration: const Duration(milliseconds: 380),
    );
  }
}
