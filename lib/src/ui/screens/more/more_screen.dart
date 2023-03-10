import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_screen_tab.dart';
import 'more_screen_state_provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

 /* static final List<Widget> w = [
    _historyWidget(),
    const Text('SETTINGS'),];*/

  Column _historyWidget(BuildContext context) {
    return Column(
    children: [
      const Text('HISTORY'),
      TextButton(
        onPressed: () => context.read<MoreScreenStateProvider>().testIsarAdd(),
        child: const Text('testIsarAdd activity'),),
      TextButton(
          onPressed: () => context.read<MoreScreenStateProvider>().testIsarDbManual(),
          child: const Text('testIsarDbManual'),),
    ],
  );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return ChangeNotifierProvider<MoreScreenStateProvider>(
      create: (_) => MoreScreenStateProvider(),
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
              showHeader
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36),
                        child: Image.asset(
                          'assets/images/schedule_transp.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
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
                      Align(
                        alignment: Alignment.topCenter,
                        // child: _tapBar(constraints, context),
                        child: Selector<MoreScreenStateProvider, int>(
                            selector: (_, state) => state.narrowedLayoutTabIndex,
                            shouldRebuild: (int pre, int next) {
                              return pre != next;
                            },
                            builder: (BuildContext context, index, __) {
                              return CustomTabBar(
                                key: Key('MonthNarrowed'),
                                activeIndex: index,
                                pageNames: ['History', 'Settings'],
                                onTap: context
                                    .read<MoreScreenStateProvider>()
                                    .onNarrowedTabIndexChange,
                              );
                            }),
                      ),
                      Selector<MoreScreenStateProvider, int>(
                          selector: (_, state) => state.narrowedLayoutTabIndex,
                          shouldRebuild: (int pre, int next) {
                            return pre != next;
                          },
                          builder: (BuildContext context, index, __) {
                            return [
                              _historyWidget(context),
                              const Text('SETTINGS'),
                            ][index];
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
