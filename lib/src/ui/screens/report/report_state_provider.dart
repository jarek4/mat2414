import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';

class ReportStateProvider with ChangeNotifier {
  ReportStateProvider(this._selectedDate);

  final IActivitiesRepository _activitiesRepository = locator<IActivitiesRepository>();

  /// ChangeNotifierProxyProvider update
  // there's no need to call here notifyListeners() only for Overview Tab!
  // for Summary tab have to call notifyListeners()!
  void update(CalendarDay selected) {
    // when user select next or previews month - day will be set to 1.
    if (_selectedDate != selected) {
      _selectedDate = selected;
      notifyListeners();
      // getActivities();
    }
  }

  final _watchForADayController = StreamController<UnmodifiableListView<Activity>>.broadcast();

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
    if (!_watchForADayController.isClosed) _watchForADayController.close();
  }

  CalendarDay _selectedDate;

  CalendarDay get selectedDate => _selectedDate;
  static final DateTime _currentDate = DateTime.now();

  DateTime get currentDate => _currentDate;

  static const List<String> _tabs = ['Overview', 'Summary'];

  List<String> get tabs => _tabs;

  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void onTabIndexChange(int index) {
    if(_tabIndex != index) {
      _tabIndex = index;
      notifyListeners();
    }

  }

  Stream<UnmodifiableListView<Activity>> watchForADay() async* {
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
}
