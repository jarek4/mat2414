import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/ui/theme/asset_path.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;


class HomeScreenStateProvider with ChangeNotifier {
  HomeScreenStateProvider() : super() {
    _lastAddedSubscription = _activities.watch3recent().listen((event) {
      _onChange(event);
    });
  }

  final IActivitiesRepository _activities = locator<IActivitiesRepository>();
  static final SettingsController _settings = locator<SettingsController>();

  void _onChange(List<Activity> event) {
    _newestActivities = UnmodifiableListView<Activity>(event);
    _controller.add(UnmodifiableListView<Activity>(_newestActivities));
  }

  // final _now = DateTime.now();

  late StreamSubscription<void> _lastAddedSubscription;

  final _controller = StreamController<UnmodifiableListView<Activity>>.broadcast();

  String get username {
    final name = _settings.user.name.trim();
    return name != 'default user' ? name : '';
  }

  String formatCurrentDate(String? locale) {
    final now = DateTime.now();
    return utils.dateFormatter(now, 'EEEE, d MMMM', locale);
  }

  final String _avatarPath = AssetPath.availableAvatars[_settings.user.avatarIndex] ?? '';

  String get avatarPath => _avatarPath;

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
