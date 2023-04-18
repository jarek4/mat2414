import 'package:mat2414/locator.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import '../../domain/local_database/i_report_db_helper.dart';
import '../models/models.dart';

class ReportsRepository implements IReportsRepository {
  final IReportDbHelper _db = locator<IReportDbHelper>();

  @override
  Future<int> create(Report item) async {
    return await _db
        .add(item)
        .catchError((e) => -1)
        .timeout(const Duration(seconds: 2), onTimeout: () => -1);
  }

  @override
  Future<int> delete(int itemId) async {
    return await _db
        .delete(itemId)
        .catchError((e) => -1)
        .timeout(const Duration(seconds: 2), onTimeout: () => -1);
  }

  @override
  Future<List<Report>> readForAServiceYear(String serviceYear) async {
    return await _db
        .getForServiceYear(serviceYear)
        .catchError((e) => <Report>[])
        .timeout(const Duration(seconds: 2), onTimeout: () => <Report>[]);
  }

  @override
  Future<List<Report>> readForAYear(int year) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<Report?> readSingle(int id) {
    // TODO: implement readSingle
    throw UnimplementedError();
  }

  @override
  Future<int> update(Report item) async {
    return await _db
        .update(item)
        .catchError((e) => -1)
        .timeout(const Duration(seconds: 2), onTimeout: () => -1);
  }

  @override
  Future<Report?> readClosedForAMonth(int year, int month) async {
    if (month == 0 || year == 0) return null;
    return _db
        .getClosedForAMonth(year, month)
        .catchError((e) => null)
        .timeout(const Duration(seconds: 3), onTimeout: () => null);
  }
}
