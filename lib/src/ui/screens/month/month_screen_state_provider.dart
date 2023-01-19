import 'package:flutter/foundation.dart';
import 'package:mat2414/src/calendar/calendar.dart';

class MonthScreenStateProvider with ChangeNotifier {
  MonthScreenStateProvider(this._selectedDate);

  /// ChangeNotifierProxyProvider update
  void update(CalendarDay selected) {
    _selectedDate = selected;
    notifyListeners();
  }

  CalendarDay _selectedDate;

  CalendarDay get selectedDate => _selectedDate;
  static final DateTime _currentDate = DateTime.now();

  DateTime get currentDate => _currentDate;
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
