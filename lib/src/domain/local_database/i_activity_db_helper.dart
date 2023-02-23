import 'package:mat2414/src/data/models/models.dart';

abstract class IActivityDbHelper {
  Future<int> add(Activity item);

  Future<List<Activity>> getAll();

  Future<List<Activity>> getForADay(int year, int month, int day);

  Future<List<Activity>> getForAMonth(int year, int month);

  /// all activities for a service year i.e 2022/23
  Future<List<Activity>> getForAServiceYear(String serviceYear);

  /// last added activities
  Future<List<Activity>> getLast(int limit);

  Future<Activity?> getSingle(int id);

  Future<int> update(Activity item);

  Future<int> delete(int id);

  /// watch an entire collection and get notified when any object is added, updated, or deleted
  late Stream<void> onCollectionChangedNotification;
}
