import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/src/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return LayoutBuilder(builder: (context, constraints) {
      // maxHeight - portrait: 679.27; horizontal: 312.72
      // ..maxHeight portrait:  BoxConstraints(0.0<=w<=392.7, 0.0<=h<=679.3)
      // ..maxHeight horizontal: BoxConstraints(0.0<=w<=759.3, 0.0<=h<=312.7)
      // portrait:  constraints.isMobile=true; constraints.isTablet=false
      // horizontal: constraints.isMobile=false; constraints.isTablet=true
      final bool showHeader = isPortrait || constraints.maxHeight > 400;

      return Container(
        color: context.colors.primaryContainer,
        constraints: const BoxConstraints(maxHeight: double.maxFinite, minWidth: double.maxFinite),
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
                        child: Text('Your last activities:', style: context.titleMedium, textAlign: TextAlign.start)),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: isPortrait ? 18 : 60),
                        shrinkWrap: true,
                        children: const [
                          ActivitySimpleView(data: [0, 1, 0], duration: Duration(hours: 1)),
                          ActivitySimpleView(data: [1, 2, 4], duration: Duration(hours: 2, minutes: 15)),
                          ActivitySimpleView(data: [0, 4, 3], duration: Duration(hours: 1, minutes: 0)),
                          /*ListTile(
                            title: Text('ListTile title'),
                            subtitle: Row(
                              children: const [
                                Text('Hours: 2'),
                                Text('Magazines: 1'),
                                Text('returns: 3')
                              ],
                            ),
                          ),*/
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () => print('ADD btn'),
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
    });
  }
}
