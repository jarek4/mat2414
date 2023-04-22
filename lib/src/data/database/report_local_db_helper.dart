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
      return await _db.writeTxn<int>(
          () async => await _db.reports.put(_updateLastModified(item))); // insert & update);
    } catch (e) {
      if (kDebugMode) print('ReportLocalDbHelper add item id: ${item.id}. E: $e');
      return -1;
    }
  }

  @override
  Future<int> delete(int id) async {
    try {
      return await _db.writeTxn<int>(() async {
        // check if report exists
        final res = await _db.reports.where().idEqualTo(id).findFirst();
        if (res == null) return -1;
        final hasTransferredActivity = res.transferredMinutesActivityId != -1;
        final isDeleted = await _db.reports.delete(id);
        if (isDeleted && hasTransferredActivity) {
          final response = await _db.activitys.delete(res.transferredMinutesActivityId);
          return response ? id : 0;
        }
        return isDeleted ? id : -1;
      });
    } catch (e) {
      try {
        final isDeleted = await _db.reports.delete(id); // delete only report
        if (kDebugMode) {
          print('ReportLocalDbHelper delete id: $id. Report deleted:$isDeleted E: $e');
        }
        return isDeleted ? 0 : -1;
      } catch (e) {
        if (kDebugMode) print('ReportLocalDbHelper delete id: $id. Second catch: $e');
        return -1;
      }
    }
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
    return await add(item);
  }

  @override
  Future<List<String>> readAvailableServiceYears() async {
    try {
      // return await _db.reports.where().serviceYearProperty().findAll();
      return await _db.reports
          .where()
          .serviceYearProperty()
          .findAll()
          .then((value) => value.toSet().toList())
          .then((resp) => resp
            ..sort()
            ..reversed);
    } catch (e) {
      throw Exception('ReportLocalDbHelper readAvailableServiceYears().\n $e');
    }
  }

  @override
  Future<Report?> getClosedForAMonth(int year, int month) async {
    try {
      // if (kDebugMode) print('ActivityLocalDbHelper getForMonth($year, $month)');
      //return await _db.reports.where().yearMonthIsClosedEqualTo(year, month, true).findFirst();
      return await _db.reports.where().yearMonthEqualToAnyServiceYear(year, month).findFirst();
    } catch (e) {
      throw Exception('ReportLocalDbHelper getClosedForMonth($year, $month).\n $e');
    }
  }

  @override
  Future<List<Report>> getForServiceYear(String serviceYear) async {
    try {
      return await _db.reports
          .filter()
          .serviceYearEqualTo(serviceYear)
          .isClosedEqualTo(true)
          .sortByYearDesc()
          .thenByMonthDesc()
          .findAll();
    } catch (e) {
      throw Exception('ReportLocalDbHelper getForServiceYear($serviceYear).\n $e');
    }
  }

  Report _updateLastModified(Report i) {
    return i.copyWith(lastModified: DateTime.now());
  }
}
