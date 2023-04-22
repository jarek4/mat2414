import 'package:mat2414/src/data/models/models.dart';

abstract class IReportsRepository {

  /// Returns created item id. -1 if error,  0 if conflict
  Future<int> create(Report item);

  Future<Report?> readClosedForAMonth(int year, int month);

  Future<List<Report>> readForAServiceYear(String serviceYear);

  Future<List<Report>> readForAYear(int year);

  Future<Report?> readSingle(int id);

  /// returns the number of changes made.  -1 on error

  Future<int> update(Report item);

  /// when success returns itemId > 0, -1 on error or if Report does not exist.
  /// May return 0 if associated Activity was not deleted.
  Future<int> delete(int itemId);

  /// returns property serviceYear from all stored Reports
  Future<List<String>> getStoredServiceYearProperties();
}
