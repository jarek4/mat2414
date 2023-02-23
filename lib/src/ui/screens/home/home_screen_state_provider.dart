import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';

class HomeScreenStateProvider with ChangeNotifier {
  HomeScreenStateProvider() : super() {
    _lastAddedSubscription = _activities.last3Added().listen((event) async {
      _onChange(event);
    });
  }

  void _onChange(List<Activity> event) {
    // print('HomeScreenStateProvider _onChange event.isEmpty:${event.isEmpty}');
    _newestActivities = UnmodifiableListView<Activity>(event);
    _controller.add(UnmodifiableListView<Activity>(_newestActivities));
  }

  final IActivitiesRepository _activities = locator<IActivitiesRepository>();

  late StreamSubscription<void> _lastAddedSubscription;

  final _controller = StreamController<UnmodifiableListView<Activity>>.broadcast();

  @override
  void dispose() {
    super.dispose();
    _lastAddedSubscription.cancel();
    _controller.close();
  }

  List<Activity> _newestActivities = [];

  void add() async {
    final DateTime d = DateTime.now();
    final a = Activity(
        createdAt: d,
        day: 20,
        lastModified: d,
        month: 2,
        serviceYear: '2023/24',
        year: 2023,
        hours: 0,
        minutes: 5,
        returnVisits: 1,
        placements: 1,
        videos: 1);
    await _activities.create(a);
  }

  Stream<UnmodifiableListView<Activity>> last3() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield UnmodifiableListView<Activity>(_newestActivities);
    yield* _controller.stream;
  }
}
