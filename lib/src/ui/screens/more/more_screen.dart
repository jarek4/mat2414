import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_screen_tab.dart';
import 'history_tab/history_tab.dart';
import 'history_tab/history_tab_state.dart';
import 'more_screen_state_provider.dart';
import 'settings_tab/settings_tab.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoreScreenStateProvider>(create: (_) => MoreScreenStateProvider()),
        ChangeNotifierProvider<HistoryTabState>(create: (_) => HistoryTabState()),
      ],
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
          child: Column(
            children: [
              if (showHeader)
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36, minHeight: (constraints.maxHeight * 0.36) - 2),
                      child: Image.asset(AssetPath.imgCalendar, fit: BoxFit.fitHeight)),
                ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minWidth: double.maxFinite),
                  decoration: BoxDecoration(
                    color: context.colors.background,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  ),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 12.0),
                        _buildScreenTabBar(),
                        _buildTabContent(),
                      ]),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Align _buildScreenTabBar() {
    return Align(
      alignment: Alignment.topCenter,
      // child: _tapBar(constraints, context),
      child: Selector<MoreScreenStateProvider, int>(
          selector: (_, state) => state.tabIndex,
          shouldRebuild: (int pre, int next) {
            return pre != next;
          },
          builder: (BuildContext context, index, __) {
            return CustomTabBar(
              key: const Key('MonthNarrowed'),
              activeIndex: index,
              pageNames: context.read<MoreScreenStateProvider>().tabs,
              onTap: context.read<MoreScreenStateProvider>().onTabIndexChange,
            );
          }),
    );
  }

  Flexible _buildTabContent() {
    return Flexible(
      child: Selector<MoreScreenStateProvider, int>(
          selector: (_, state) => state.tabIndex,
          shouldRebuild: (int pre, int next) {
            return pre != next;
          },
          builder: (BuildContext context, index, __) {
            return [
              // const Text('HistoryTab'),
              const HistoryTab(),
              const SettingsTab(),
            ][index];
          }),
    );
  }
}
