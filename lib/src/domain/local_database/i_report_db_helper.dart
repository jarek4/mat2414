import '../../data/models/models.dart';

abstract class IReportDbHelper {
  Future<int> add(Report item);

  Future<List<Report>> getAll();

  Future<Report?> getClosedForAMonth(int year, int month);

  /// only closed reports! Sorted by year and by month descendant (2023.08, 2023.09, 2024.01)
  Future<List<Report>> getForServiceYear(String serviceYear);

  Future<Report?> getSingle(int id);

  Future<int> update(Report item);

  /// when success returns id > 0, -1 on error or if Report does not exist.
  /// May return 0 if associated Activity was not deleted.
  /// Checks does report with given id exist. If does, checks associated Activity (transferred minutes).
  /// If there is transferred activity id it will be deleted!
  Future<int> delete(int id);
}
