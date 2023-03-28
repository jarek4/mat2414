import '../../data/models/models.dart';

abstract class IReportDbHelper {
  Future<int> add(Report item);

  Future<List<Report>> getAll();

  Future<Report?> getClosedForAMonth(int year, int month);

  Future<List<Report>> getForServiceYear(String serviceYear);

  // Future<List<Report>> getLast(int limit);
  Future<Report?> getSingle(int id);

  Future<int> update(Report item);

  Future<int> delete(int id);
}
