import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/localization/locale_notifier.dart';
import 'package:mat2414/src/ui/navigation/navigation.dart';
import 'package:mat2414/src/ui/screens/screens.dart';
import 'package:provider/provider.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  late Locale _locale;
  late TargetPlatform _platform;
  var home = 'Home';
  var detail = 'Detail';
  var more = 'More';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _platform = Theme.of(context).platform;
    _updateLocale();
    home = context.loc.screenHome;
    detail = context.loc.screenDetail;
    more = context.loc.screenMore;
  }

  // helps to get locale without context
  void _updateLocale() {
    try {
      _locale = Localizations.localeOf(context);
      // AppLocalizations.supportedLocales to verify if current locale is supported!
      List<Locale> supported = AppLocalizations.supportedLocales;
      locator<ILocaleNotifier>().update(supported, _locale);
    } catch (e) {
      _locale = const Locale('en');
      locator<ILocaleNotifier>().update([_locale], _locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final int selectedTabIndex = Provider.of<BottomNavigationController>(context).selectedIndex;
    if (_platform == TargetPlatform.iOS) {
      return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          // backgroundColor: Colors.blueGrey,
          // activeColor: Colors.white,
          // inactiveColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: const Icon(CupertinoIcons.home), label: home),
            BottomNavigationBarItem(icon: const Icon(Icons.calendar_month), label: detail),
            BottomNavigationBarItem(icon: const Icon(Icons.more_horiz), label: more),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              return [
                // safeArea - Add new activity button is under bottom nav bar!
                const Material(child: SafeArea(top: false, child: HomeScreen())),
                const Material(child: DetailScreen()),
                const Material(child: MoreScreen()),
              ][index];
            },
          );
        },
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: [
          const HomeScreen(),
          const DetailScreen(),
          const MoreScreen(),
        ].elementAt(context.watch<BottomNavigationController>().selectedIndex),
        bottomNavigationBar: NavigationBarTheme(
          data: Theme.of(context).navigationBarTheme,
          child: NavigationBar(
              selectedIndex: context.read<BottomNavigationController>().selectedIndex,
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
}

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: [
        const HomeScreen(),
        const DetailScreen(),
        const MoreScreen(),
      ].elementAt(context.watch<BottomNavigationController>().selectedIndex),
      bottomNavigationBar: NavigationBarTheme(
        data: Theme.of(context).navigationBarTheme,
        child: NavigationBar(
            selectedIndex: context.read<BottomNavigationController>().selectedIndex,
            onDestinationSelected: (index) =>
                context.read<BottomNavigationController>().onSelect(index),
            animationDuration: const Duration(seconds: 1),
            destinations: [
              NavigationDestination(icon: const Icon(Icons.home), label: context.loc.screenHome),
              NavigationDestination(
                  icon: const Icon(Icons.calendar_month), label: context.loc.screenDetail),
              NavigationDestination(
                  icon: const Icon(Icons.more_horiz), label: context.loc.screenMore),
            ]),
      ),
    );
  }
 */
