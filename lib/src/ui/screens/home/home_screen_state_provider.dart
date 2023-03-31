import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';

class HomeScreenStateProvider with ChangeNotifier {
  HomeScreenStateProvider() : super() {
    _lastAddedSubscription = _activities.watch3recent().listen((event) {
      _onChange(event);
    });
  }

  void _onChange(List<Activity> event) {
    _newestActivities = UnmodifiableListView<Activity>(event);
    _controller.add(UnmodifiableListView<Activity>(_newestActivities));
  }

  final IActivitiesRepository _activities = locator<IActivitiesRepository>();

  late StreamSubscription<void> _lastAddedSubscription;

  final _controller = StreamController<UnmodifiableListView<Activity>>.broadcast();

  // prevents: PlatformDispatcher ERROR: A AddUpdateState was used after being disposed error!
  bool _isMounted = true;

  @override
  void notifyListeners() {
    if (_isMounted) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false;
    _lastAddedSubscription.cancel();
    _controller.close();
  }

  // @visibleForTesting
  var _newestActivities = <Activity>[];

  Stream<UnmodifiableListView<Activity>> last3() async* {
    // await Future.delayed(const Duration(seconds: 2));
    yield UnmodifiableListView<Activity>(_newestActivities);
    yield* _controller.stream;
  }
}
