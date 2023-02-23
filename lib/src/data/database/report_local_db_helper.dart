import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/models.dart';

import '../../domain/local_database/i_report_db_helper.dart';

class ReportLocalDbHelper implements IReportDbHelper {
  final Isar _db = locator<Isar>();

  @override
  Future<int> add(Report item) async {
    if (kDebugMode) print('ReportLocalDbHelper add');
    try {
      return await _db.writeTxn<int>(() async => await _db.reports.put(item)); // insert & update);
    } catch (e) {
      if (kDebugMode) print('ReportLocalDbHelper add item id: ${item.id}. E: $e');
      return -1;
    }
  }

  @override
  Future<int> delete(int id) async {
    return -1;
  }

  @override
  Future<List<Report>> getAll() async {
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
  Future<Report?> getSingle(int id) async {
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
  Future<int> update(Report item) async {
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

  @override
  Future<List<Report>> getForMonth(int year, int month) {
    // TODO: implement getForMonth
    throw UnimplementedError();
  }

  @override
  Future<List<Report>> getForServiceYear(String serviceYear) {
    // TODO: implement getForServiceYear
    throw UnimplementedError();
  }
}
