import 'package:flutter/foundation.dart';

class MoreScreenStateProvider with ChangeNotifier {
  MoreScreenStateProvider();

  int _narrowedLayoutTabIndex = 0;

  int get narrowedLayoutTabIndex => _narrowedLayoutTabIndex;

  int _wideLayoutTabIndex = 0;

  int get wideLayoutTabIndex => _wideLayoutTabIndex;

  void onNarrowedTabIndexChange(int index) {
    _narrowedLayoutTabIndex = index;
    notifyListeners();
  }

  void onWideTabIndexChange(int index) {
    _wideLayoutTabIndex = index;

    notifyListeners();
  }
}
