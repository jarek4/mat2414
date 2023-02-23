import 'package:mat2414/locator.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';

import '../../domain/local_database/i_report_db_helper.dart';
import '../models/models.dart';



class ReportsRepository implements IReportsRepository {
  final IReportDbHelper _db = locator<IReportDbHelper>();

  @override
  Future<int> create(Report item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<int> delete(int itemId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Report>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<Report?> readSingle(int id) {
    // TODO: implement readSingle
    throw UnimplementedError();
  }

  @override
  Future<int> update(Report item) {
    // TODO: implement update
    throw UnimplementedError();
  }

}