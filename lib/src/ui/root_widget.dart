import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/src/ui/navigation/navigation.dart';
import 'package:mat2414/src/ui/screens/screens.dart';
import 'package:provider/provider.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final home = AppLocalizations.of(context).screenHome;
    final detail = AppLocalizations.of(context).screenDetail;
    final more = AppLocalizations.of(context).screenMore;

    final int selectedTabIndex = Provider.of<BottomNavigationController>(context).selectedIndex;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: [
        const HomeScreen(),
        const DetailScreen(),
        const MoreScreen(),
      ].elementAt(selectedTabIndex),
      bottomNavigationBar: NavigationBarTheme(
        data: Theme.of(context).navigationBarTheme,
        child: NavigationBar(
            selectedIndex: selectedTabIndex,
            onDestinationSelected: (index) =>
                context.read<BottomNavigationController>().onSelect(index),
            animationDuration: const Duration(seconds: 1),
            destinations: [
              NavigationDestination(icon: const Icon(Icons.home), label: home),
              NavigationDestination(icon: const Icon(Icons.calendar_month), label: detail),
              NavigationDestination(icon: const Icon(Icons.more_horiz), label: more),
            ]),
      ),
    );
  }
}
