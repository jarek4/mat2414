import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/locator.dart';

class MoreScreenStateProvider with ChangeNotifier {
  MoreScreenStateProvider();

  // final LocalDb db = locator<LocalDb>();
  final Isar db = locator<Isar>();

  static const List<String> _tabs = ['History', 'Settings'];

  List<String> get tabs => _tabs;

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

  void testIsarDb(){
   // db.closeObjectBoxAdmin();
    // db.isOpen;
    print('testIsarDb');
    // print('testIsarDb isOpen: ${db.isOpen}');
    // print('testIsarDb directory: ${db.directory}');
    // print('testIsarDb name: ${db.name}');
  }
  void testIsar2(){
    print('testIsar2');
  }
}
