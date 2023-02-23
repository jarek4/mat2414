import 'package:mat2414/src/data/models/activity/activity.dart';

abstract class IActivitiesRepository {
  /// Returns item id. -1 if error
  Future<int> create(Activity item);

  Future<List<Activity>> getForADay(int year, int month, int day);

  Future<List<Activity>> getForAMonth(int year, int month);

  Future<List<Activity>> getForAServiceYear(String serviceYear);

  // Future<List<Activity>> lastAdded({int limit = 3});

  Stream<List<Activity>> last3Added({int limit = 3});

  Future<List<Activity>> readAll();

  Future<Activity?> readSingle(int id);

  /// Returns id.

  Future<int> update(Activity item);

  /// Returns the number of rows affected. -1 on error
  Future<int> delete(int itemId);

  void dispose();
}
