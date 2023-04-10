import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';
import '../../../rate_request/rate_request.dart';
import 'add_activity_with_notifications.dart';
import 'home_screen_state_provider.dart';
import 'last_activities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  var _lastActivity = 'Your last activity:', _today = 'Today is';
  bool _isAppStillNotRated = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lastActivity = AppLocalizations.of(context).homeYorLastActivities;
    _today = AppLocalizations.of(context).homeTodayIs ;
    _isAppStillNotRated = !context.read<SettingsController>().user.haveRatedTheApp;
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return ChangeNotifierProvider<HomeScreenStateProvider>(
      create: (_) => HomeScreenStateProvider(),
      child: LayoutBuilder(builder: (context, constraints) {
        final bool showHeader = isPortrait || constraints.maxHeight > 400;

        return Container(
          color: context.colors.primaryContainer,
          constraints:
              const BoxConstraints(maxHeight: double.maxFinite, minWidth: double.maxFinite),
          child: Column(children: [
            _buildImageHeader(showHeader, constraints),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(minWidth: double.maxFinite),
                decoration: BoxDecoration(
                    color: context.colors.background,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                child: Column(children: [
                  _buildUserGreeting(context),
                  SizedBox(height: showHeader ? 8.0 : 1.0),
                  _buildDate(context),
                  SizedBox(height: showHeader ? 16.0 : 4),
                  _buildLastActivitiesListTitle(context),
                  // last activities list
                  const Expanded(child: LastActivities()),
                  // button, big title text and notifications after save or cancel action
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: showHeader ? 20.0 : 8),
                      child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: AddActivityWithNotifications())),
                  if (_isAppStillNotRated) const RateRequest(),
                ]),
              ),
            ),
          ]),
        );
      }),
    );
  }

  SingleChildRenderObjectWidget _buildImageHeader(bool showHeader, BoxConstraints constraints) {
    return showHeader
        ? Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36),
              child: Image.asset(AssetPath.imgPreacher, fit: BoxFit.fitHeight),
              // child: Image.asset(AssetPath.imgWomenPreacher, fit: BoxFit.fitHeight),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildUserGreeting(BuildContext context) {
    return FittedBox(
      child: Selector<HomeScreenStateProvider, String>(
          selector: (_, state) => state.username,
          shouldRebuild: (String pre, String next) {
            return pre != next;
          },
          builder: (BuildContext context, name, __) {
            var hello = AppLocalizations.of(context).homeHello(name);
            if (name.isEmpty) {
              // locale is 'Hello {name}! Fix: Hello !, to Hello!
              hello = hello.replaceAll(' ', '');
            }
            return Text(hello, style: context.headlineSmall);
          }),
    );
  }

  FittedBox _buildDate(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).toString();
    final date = context.read<HomeScreenStateProvider>().formatCurrentDate(currentLocale);
    return FittedBox(child: Text('$_today $date', style: context.bodyMedium));
  }

  FittedBox _buildLastActivitiesListTitle(BuildContext context) {
    return FittedBox(
        child: Text(_lastActivity, style: context.titleMedium, textAlign: TextAlign.start));
  }
}
