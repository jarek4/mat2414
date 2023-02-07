/*
import 'package:flutter/foundation.dart';

import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/month_report/report_model.dart';
import 'package:mat2414/src/domain/i_local_db_helper.dart';

import 'db_constants.dart';
import 'local_db.dart';

class MonthReportLocalDbHelper implements ILocalDbHelper<MonthReport> {
  // final LocalDb _db = locator<LocalDb>();


  @override
  Future<int> create(MonthReport item) async {
    return -1;
  }

  @override
  Future<int> delete(String id) async {
    return -1;
  }

  @override
  Future<List<MonthReport>> getByIds(List<String> ids) async {
    // LazyBox<MonthReport> box = await _getBox();
    // List<MonthReport> items = [];
    // try {
    //   for (int i = 0; i < ids.length; i++) {
    //     final MonthReport? item = await box.get(ids[i]);
    //     if (item != null) items.add(item);
    //   }
    //
    //   if (kDebugMode) print('MonthReportLocalDbHelper getByIds: $ids');
    // } catch (e) {
    //   if (kDebugMode) print('MonthReportLocalDbHelper getByIds: $ids. E: $e');
    // }
    // return items;
    return [];
  }

  @override
  Future<List<MonthReport>> readAll([String? ownerId]) async {
    // LazyBox<MonthReport> box = await _getBox();
    // List<MonthReport> items = [];
    // try {
    //   List<String> keys = box.keys.toList() as List<String>;
    //   for (int i = 0; i < keys.length; i++) {
    //     final MonthReport? item = await box.get(keys[i]);
    //     if (item != null) items.add(item);
    //   }
    //
    //   if (kDebugMode) print('MonthReportLocalDbHelper readAll');
    // } catch (e) {
    //   if (kDebugMode) print('MonthReportLocalDbHelper readAll. E: $e');
    // }
    // return items;
    return [];
  }

  @override
  Future<MonthReport?> readSingle(String id) async {
    // LazyBox<MonthReport> box = await _getBox();
    // try {
    //   if (kDebugMode) print('MonthReportLocalDbHelper readSingle $id');
    //   return await box.get(id);
    // } catch (e) {
    //   if (kDebugMode) print('MonthReportLocalDbHelper readSingle id: $id. E: $e');
    //   return null;
    // }
    return null;
  }

  @override
  Future<int> update(MonthReport item) async {
    //   LazyBox<MonthReport> box = await _getBox();
    //   try {
    //     await box.put(item.id, item);
    //     if (kDebugMode) print('MonthReportLocalDbHelper update ${item.id}');
    //     return 1;
    //   } catch (e) {
    //     if (kDebugMode) print('MonthReportLocalDbHelper update item id: ${item.id}. E: $e');
    //     return -1;
    //   }
    // }
    return -1;
  }
}
*/
