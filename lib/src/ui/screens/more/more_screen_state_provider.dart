import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/models.dart';

import '../../../data/database/activity_local_db_helper.dart';

class MoreScreenStateProvider with ChangeNotifier {
  MoreScreenStateProvider();


  final a1 = Activity(createdAt: DateTime(2023, 2, 10),
      day: 10,
      lastModified: DateTime(2023, 2, 10),
      month: 2,
      serviceYear: '2022/23',
      year: 2023,
      hours: 1,
      isGroupWitnessing: true,
      minutes: 15);
  final a2 = Activity(createdAt: DateTime(2023, 2, 11),
      day: 11,
      lastModified: DateTime(2023, 2, 11),
      month: 2,
      serviceYear: '2022/23',
      year: 2023,
      isInformalWitnessing: true,
      minutes: 15);

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

  Future<void> testIsarDbManual() async {
    if (await db.collection<User>().count() >= 0) {
      DateTime d = DateTime(2023, 2, 10);
      await db.writeTxn(() async {
        // await db.users.put(User(createdAt: d, lastModified: DateTime.now(), name: '23', uid: 'uid23'));
        await db.users.put(User(createdAt: d, lastModified: d, name: '2',));
        await db.activitys.put(Activity(createdAt: d,
            day: 11,
            lastModified: d,
            month: 2,
            serviceYear: '2022/23',
            year: 2023,
            minutes: 15));
        // await db.activitys.put(
        //     Activity(createdAt: d, day: 7, lastModified: d, month: 2, serviceYear: '2022/23', year: 2023, hours: 2, isBusinessTerritoryWitnessing: true));

      });
    }
  }

  Future<void> testIsarAdd() async {
    ActivityLocalDbHelper dbHelper = ActivityLocalDbHelper();
    // ignore: unused_local_variable
    final int id = await dbHelper.add(a2);
    // print('testIsarAdd id: $id');
  }
}
