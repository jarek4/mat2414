import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'home_screen_state_provider.dart';
import 'last_activities.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
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
          child: Column(
            children: [
              showHeader
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.36),
                        child: Image.asset(
                          'assets/images/preacher_transp.png',
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
                        topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedBox(child: Text('Hello!', style: context.headlineSmall)),
                      FittedBox(
                          child: Text(
                              'Today is ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                              style: context.titleLarge)),
                      const SizedBox(height: 16.0),
                      FittedBox(
                          child: Text('Your last activities:',
                              style: context.titleMedium, textAlign: TextAlign.start)),
                      // Expanded(child: _buildLastActivitiesList(isPortrait)),
                      const Expanded(child: LastActivities()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              IconButton(
                                  // onPressed: () {
                                  //   Provider.of<HomeScreenStateProvider>(context, listen: false)
                                  //       .add();
                                  // },
                                onPressed: () => _add(
                                    context: context,
                                    handle: () =>Provider.of<HomeScreenStateProvider>(context, listen: false).add()),
                                  icon: const Icon(
                                    Icons.add_circle,
                                    size: 38,
                                  )),
                              Text('Add new activity', style: context.headlineSmall)
                            ],
                          ),
                        ),
                      )
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

  Consumer<HomeScreenStateProvider> _buildLastActivitiesList(bool isPortrait) {
    return Consumer<HomeScreenStateProvider>(
        builder: (BuildContext context, HomeScreenStateProvider state, _) {
      return FutureBuilder<UnmodifiableListView<Activity>>(
          initialData: UnmodifiableListView<Activity>([]),
          // future: state.getLast3(),
          builder: (context, snapshot) {
            print('FutureBuilder: ${snapshot.data?.length}');
            ConnectionState connection = snapshot.connectionState;
            if (snapshot.hasError) return const Center(child: CircularProgressIndicator.adaptive());
              UnmodifiableListView<Activity>? a = snapshot.data;
              return Shimmer(
                // isLoading: true,
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return ShimmerLoading(
                      isLoading: connection == ConnectionState.waiting,
                      child: ActivitySimpleView(
                        data: [
                          a == null || a.isEmpty ? 0 : a[i].placements,
                          a == null || a.isEmpty ? 0 : a[i].videos,
                          a == null || a.isEmpty ? 0 : a[i].returnVisits],
                        duration:
                        Duration(
                            hours: a == null || a.isEmpty ? 0 : a[i].hours,
                            minutes: a == null || a.isEmpty ? 0 : a[i].minutes),
                      ),
                    );
                  },
                  itemCount: a  == null ? 1 : a.length,
                  // itemCount: 1,
                ),
              );

          });
    });
  }

  void _add(
      {required BuildContext context,
        required VoidCallback handle}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          // AnimatedPadding, padding MediaQuery.of(context).viewInsets.bottom and
          // isScrollControlled: true - are important to lift up when keyboard is shown!
          return AnimatedPadding(
              duration: const Duration(milliseconds: 50),
              curve: Curves.bounceIn,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('add activity'),
                IconButton(
                    onPressed: handle,
                    icon: const Icon(
                      Icons.add_circle,
                      size: 38,
                    )),
              ],));
        });
  }
}
