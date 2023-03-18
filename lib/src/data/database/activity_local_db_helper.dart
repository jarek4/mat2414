import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/local_database/i_activity_db_helper.dart';

class ActivityLocalDbHelper implements IActivityDbHelper {
  static final Isar _db = locator<Isar>();

  @override

  /// Returns the id.
  Future<int> add(Activity item) async {
    try {
      return await _db
          .writeTxn<int>(() async => await _db.activitys.put(item)); // insert & update);
    } catch (e) {
      throw Exception('ActivityLocalDbHelper add(Activity $item)\n $e');
    }
  }

  @override
  Future<int> delete(int id) async {
    try {
      final bool isDeleted = await _db.writeTxn<bool>(() async => await _db.activitys.delete(id));
      if (kDebugMode) print('ActivityLocalDbHelper delete $id, isDeleted:$isDeleted');
      return isDeleted ? 1 : 0;
    } catch (e) {
      throw Exception('ActivityLocalDbHelper delete $id\n $e');
    }
  }

  @override
  Future<List<Activity>> getAll() async {
    //_db.activitys.where().limit(limit).findAll();
    // LazyBox<Activity> box = await _getBox();
    // List<Activity> items = [];
    // try {
    //   List<String> keys = box.keys.toList() as List<String>;
    //   for (int i = 0; i < keys.length; i++) {
    //     final Activity? item = await box.get(keys[i]);
    //     if (item != null) items.add(item);
    //   }
    //
    //   if (kDebugMode) print('ActivityLocalDbHelper readAll');
    // } catch (e) {
    //   if (kDebugMode) print('ActivityLocalDbHelper readAll. E: $e');
    // }
    // return items;
    return [];
  }

  @override
  Future<List<Activity>> getForADay(int year, int month, int day) async {
    try {
     // if (kDebugMode) print('ActivityLocalDbHelper getForDay($year, $month, $day)');
      return await _db.activitys.where().yearMonthDayEqualTo(year, month, day).sortByCreatedAtDesc().findAll();
    } catch (e) {
      throw Exception('ActivityLocalDbHelper getForDay($year, $month, $day).\n $e');
    }
  }

  @override
  Future<List<Activity>> getForAMonth(int year, int month) async {
    try {
      // if (kDebugMode) print('ActivityLocalDbHelper getForMonth($year, $month)');
      return await _db.activitys.where().yearMonthEqualToAnyDay(year, month).findAll();
    } catch (e) {
      throw Exception('ActivityLocalDbHelper getForMonth($year, $month).\n $e');
    }
  }

  @override
  Future<List<Activity>> getForAServiceYear(String serviceYear) async {
    try {
      if (kDebugMode) print('ActivityLocalDbHelper getForServiceYear($serviceYear)');
      return await _db.activitys.filter().serviceYearEqualTo(serviceYear).findAll();
    } catch (e) {
      throw Exception('ActivityLocalDbHelper getForServiceYear($serviceYear).\n $e');
    }
  }

  @override
  Future<List<Activity>> getLast(int limit) async {
    try {
      return await _db.activitys
          .where()
          .sortByYearDesc()
          .thenByMonthDesc()
          .thenByDayDesc()
          .thenByCreatedAtDesc()
          .limit(limit)
          .findAll();
    } catch (e) {
      throw Exception('ActivityLocalDbHelper getLast($limit).\n $e');
    }
  }

  @override
  Future<Activity?> getSingle(int id) async {
    try {
      if (kDebugMode) print('ActivityLocalDbHelper getSingle $id');
      return await _db.activitys.where().idEqualTo(id).findFirst();
    } catch (e) {
      throw Exception('ActivityLocalDbHelper getSingle id: $id\n $e');
    }
  }

  @override

  /// Returns the id.
  Future<int> update(Activity item) async {
    try {
      return await add(item);
    } catch (e) {
      throw Exception('ActivityLocalDbHelper update(Activity $item)\n $e');
    }
  }

  @override
  Stream<void> onCollectionChangedNotification = _db.activitys.watchLazy(fireImmediately: true);
}
