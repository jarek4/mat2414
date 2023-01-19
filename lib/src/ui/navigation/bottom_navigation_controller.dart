import 'package:flutter/foundation.dart';

class BottomNavigationController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onSelect(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
