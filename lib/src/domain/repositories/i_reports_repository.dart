import 'package:mat2414/src/data/models/models.dart';

abstract class IReportsRepository {

  /// Returns created item id. -1 if error,  0 if conflict
  Future<int> create(Report item);

  Future<List<Report>> readAll();

  Future<Report?> readSingle(int id);

  /// returns the number of changes made.  -1 on error

  Future<int> update(Report item);

  /// Returns the number of rows affected. -1 on error
  Future<int> delete(int itemId);
}
