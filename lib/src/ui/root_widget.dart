import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/navigation/navigation.dart';
import 'package:mat2414/src/ui/screens/screens.dart';
import 'package:provider/provider.dart';



class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    // final ThemeProvider? result = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    // final themeProvider = ThemeProvider.of(context);
    final int selectedTabIndex = Provider.of<BottomNavigationController>(context).selectedIndex;
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: [
        const HomeScreen(),
        const DetailScreen(),
        const MoreScreen(),
        //const CustomDatePicker(),
        // build3screen(context),
      ].elementAt(selectedTabIndex),
      bottomNavigationBar: NavigationBarTheme(
        data: Theme.of(context).navigationBarTheme,
        // data: NavigationBarThemeData(),
        child: NavigationBar(
          selectedIndex: selectedTabIndex,
          onDestinationSelected: (index) =>
              context.read<BottomNavigationController>().onSelect(index),
          animationDuration: const Duration(seconds: 1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Detail'),
            NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More'),
          ],
        ),
      ),
    );

  }

/*  Center build3screen(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('headlineLarge C', style: context.headlineLarge),
        Text('headlineMedium T', style: Theme.of(context).textTheme.headlineMedium),
        Text('headlineMedium C', style: context.headlineMedium),
        TextButton(onPressed: () => print('TextButton'), child:Text('TextButton')),
        OutlinedButton(onPressed: () => print('OutlinedButton'), child:Text('OutlinedButton')),

        ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Terms of service', style: context.titleSmall),
            Icon(Icons.arrow_forward_ios_rounded),
          ]),
          onTap: () => showAboutDialog(
              context: context, applicationVersion: '1.0.0', applicationLegalese: 'BSD 2 License'),
        ),
      ],
    ));
  }*/
}
