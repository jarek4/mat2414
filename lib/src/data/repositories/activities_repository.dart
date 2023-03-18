import 'dart:async';

import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/local_database/i_activity_db_helper.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';

class ActivitiesRepository implements IActivitiesRepository {
  ActivitiesRepository() : super() {
    _dbSubscription = _db.onCollectionChangedNotification.listen((event) async {
      await _onChange();
    });
  }

  final IActivityDbHelper _db = locator<IActivityDbHelper>();
  late StreamSubscription<void> _dbSubscription;
  final _lastActivitiesController = StreamController<List<Activity>>.broadcast();

  @override
  Future<int> create(Activity item) async {
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
  Future<List<Activity>> getForADay(int year, int month, int day) async {
    if (day == 0 || month == 0 || year == 0) return <Activity>[];
    return _db
        .getForADay(year, month, day)
        .catchError((e) => <Activity>[])
        .timeout(const Duration(seconds: 3), onTimeout: () => <Activity>[]);
  }

  @override
  Future<List<Activity>> getForAMonth(int year, int month) async {
    if (month == 0 || year == 0) return <Activity>[];
    return await _db
        .getForAMonth(year, month)
        .catchError((e) => <Activity>[])
        .timeout(const Duration(seconds: 3), onTimeout: () => <Activity>[]);
  }

  @override
  Future<List<Activity>> getForAServiceYear(String serviceYear) async {
    return await _db
        .getForAServiceYear(serviceYear)
        .catchError((e) => <Activity>[])
        .timeout(const Duration(seconds: 3), onTimeout: () => <Activity>[]);
  }

  @override
  Future<List<Activity>> readAll() async {
    return await _db
        .getAll()
        .catchError((e) => <Activity>[])
        .timeout(const Duration(seconds: 3), onTimeout: () => <Activity>[]);
  }

  @override
  Future<Activity?> readSingle(int id) async {
    return await _db
        .getSingle(id)
        .catchError((e) => null)
        .timeout(const Duration(seconds: 2), onTimeout: () => null);
  }

  @override
  Future<int> update(Activity item) async {
    final int id = await _db
        .update(item)
        .catchError((e) => -1)
        .timeout(const Duration(seconds: 3), onTimeout: () => -1);
    return id;
  }

  @override
  Stream<List<Activity>> watch3recent() async* {
    // print('ActivitiesRepository Stream last3Added');
    // yield _newestActivities;
    // List<Activity> a = await _lastAdded();
    // a.sort((a, b) => b.placements.compareTo(a.placements));
    yield await _readRecent();
    yield* _lastActivitiesController.stream;
  }

  Future<void> _onChange() async {
    _lastActivitiesController.add(await _readRecent());
    // _controller.sink.add(_newestActivities);
  }

  Future<List<Activity>> _readRecent({int limit = 3}) async {
    return _db
        .getLast(limit)
        .catchError((e) => <Activity>[])
        .timeout(const Duration(seconds: 3), onTimeout: () => <Activity>[]);
  }

  @override
  void dispose() {
    _dbSubscription.cancel();
    _lastActivitiesController.close();
  }
}
