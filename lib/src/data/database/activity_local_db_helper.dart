/*
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/i_local_db_helper.dart';

import 'db_constants.dart';
import 'local_db.dart';

class ActivityLocalDbHelper implements ILocalDbHelper<Activity> {
  // final LocalDb _db = locator<LocalDb>();


  @override
  Future<int> create(Activity item) async {
    // LazyBox<Activity> box = await _getBox();
    // try {
    //   if (box.containsKey(item.id)) return 0;
    //   await box.put(item.id, item);
    //   if (kDebugMode) print('ActivityLocalDbHelper create ${item.id}');
    //   return 1;
    // } catch (e) {
    //   if (kDebugMode) print('ActivityLocalDbHelper create item id: ${item.id}. E: $e');
    //   return -1;
    // }
    return -1;
  }

  @override
  Future<int> delete(String id) async {
    // LazyBox<Activity> box = await _getBox();
    // try {
    //   await box.delete(id);
    //   if (kDebugMode) print('ActivityLocalDbHelper deleted $id');
    //   return 1;
    // } catch (e) {
    //   if (kDebugMode) print('ActivityLocalDbHelper delete id: $id. E: $e');
    //   return -1;
    // }
    return -1;
  }

  @override
  Future<List<Activity>> getByIds(List<String> ids) async {
    // LazyBox<Activity> box = await _getBox();
    // List<Activity> items = [];
    // try {
    //   for (int i = 0; i < ids.length; i++) {
    //     final Activity? item = await box.get(ids[i]);
    //     if (item != null) items.add(item);
    //   }
    //
    //   if (kDebugMode) print('ActivityLocalDbHelper getByIds: $ids');
    // } catch (e) {
    //   if (kDebugMode) print('ActivityLocalDbHelper getByIds: $ids. E: $e');
    // }
    // return items;
    return [];
  }

  @override
  Future<List<Activity>> readAll([String? ownerId]) async {
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
  Future<Activity?> readSingle(String id) async {
    // LazyBox<Activity> box = await _getBox();
    // try {
    //   if (kDebugMode) print('ActivityLocalDbHelper readSingle $id');
    //   return await box.get(id);
    // } catch (e) {
    //   if (kDebugMode) print('ActivityLocalDbHelper readSingle id: $id. E: $e');
    //   return null;
    // }
    return null;
  }

  @override
  Future<int> update(Activity item) async {
    // LazyBox<Activity> box = await _getBox();
    // try {
    //   await box.put(item.id, item);
    //   if (kDebugMode) print('ActivityLocalDbHelper update ${item.id}');
    //   return 1;
    // } catch (e) {
    //   if (kDebugMode) print('ActivityLocalDbHelper update item id: ${item.id}. E: $e');
    //   return -1;
    // }
    return -1;
  }
}
*/
