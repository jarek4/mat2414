import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mat2414/src/activity_add_update/activity_add_update_view.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
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

  @override
  void dispose() {
    /*   if (timer != null && timer!.isActive) {
      timer!.cancel();
    }*/
    timer?.cancel();
    super.dispose();
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
                  FittedBox(child: Text('Hello!', style: context.headlineSmall)),
                  FittedBox(
                      child: Text(
                          'Today is ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: context.titleLarge)),
                  const SizedBox(height: 16.0),
                  FittedBox(
                      child: Text('Your last activities:',
                          style: context.titleMedium, textAlign: TextAlign.start)),
                  const Expanded(child: LastActivities()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                        return Column(children: [
                          if (tempNotification != null)
                            AnimatedUserNotification(height: 28, msg: tempNotification ?? ''),
                          AddActivityWidget(
                              isSmall: false,
                              handle: () async {
                                final Activity? a = await _openAddBottomSheet(context);
                                if (a == null) {
                                  if (timer != null && timer!.isActive) timer?.cancel();
                                  setState(() => tempNotification = 'Not saved.');
                                  timer = Timer(const Duration(milliseconds: 3000), () {
                                    if (mounted) setState(() => tempNotification = null);
                                  });
                                } else {
                                  if (timer != null && timer!.isActive) timer?.cancel();
                                  setState(() => tempNotification = 'Activity was saved.');
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
              child: Image.asset(AssetPath.imgPreacher, fit: BoxFit.fitHeight),
            ),
          )
        : const SizedBox.shrink();
  }

  Future<Activity?> _openAddBottomSheet(BuildContext context) async {
    return await utils_bottom_sheet.showCustomBottomSheet<Activity>(
        context, const ActivityAddUpdateView());
  }
}

/* IconButton(
                            onPressed: () async {
                              final Activity? a = await _add(context);
                              if (a == null) {
                                if (timer != null && timer!.isActive) timer?.cancel();
                                setState(() => a2 = 'Not saved.');
                                // print('a2:$a2');
                                timer = Timer(const Duration(milliseconds: 3000), () {
                                  if (mounted) setState(() => a2 = null);
                                });
                              } else {
                                if (timer != null && timer!.isActive) timer?.cancel();
                                setState(() => a2 = 'Activity was saved.');
                                //print('a2:$a2');
                                timer = Timer(const Duration(milliseconds: 3000), () {
                                  if (mounted) setState(() => a2 = null);
                                });
                              }
                            },
                            icon: const Icon(Icons.add_circle, size: 38),
                          ),
                          Text('Add new activity', style: context.headlineSmall)*/
