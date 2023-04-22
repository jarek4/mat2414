import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar_day.dart';
import 'package:mat2414/src/data/models/activity/activity.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';

class ActivityTabState with ChangeNotifier {
  ActivityTabState(this._selectedDate);

  final IActivitiesRepository _activitiesRepository = locator<IActivitiesRepository>();

  // localization
  // final ILocaleNotifier _s = locator<ILocaleNotifier>();

  /// ChangeNotifierProxyProvider update
  Future<void> update(CalendarDay selected) async {
    final bool hasToUpdateMonthReport =
        _selectedDate.month != selected.month || _selectedDate.year != selected.year;
    // when user select next or previews month - day will be set to 1.
    if (_selectedDate != selected) {
      _selectedDate = selected;
      notifyListeners();
    }
  }

  final _watchForADayController = StreamController<UnmodifiableListView<Activity>>.broadcast();

  CalendarDay _selectedDate;

  CalendarDay get selectedDate => _selectedDate;

  Stream<UnmodifiableListView<Activity>> watchDayActivities() async* {
    yield UnmodifiableListView<Activity>(await _getActivitiesForADay());
    yield* _watchForADayController.stream;
  }

  Future<void> refreshForADayActivities() async {
    _watchForADayController.add(UnmodifiableListView<Activity>(await _getActivitiesForADay()));
  }

  Future<List<Activity>> _getActivitiesForADay() async {
    List<Activity> items = await _activitiesRepository.getForADay(
        _selectedDate.year, _selectedDate.month, _selectedDate.day);
    await Future.delayed(const Duration(milliseconds: 400));
    return items;
  }

  Future<int> deleteActivity(int id) async {
    return await _activitiesRepository.delete(id);
  }

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
    if (!_watchForADayController.isClosed) _watchForADayController.close();
  }
}
