import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/utils/get_service_year.dart' as utils;

import '../domain/repositories/i_activity_repository.dart';

enum AddUpdateStateStatus { error, loading, success }

class AddUpdateState with ChangeNotifier {
  /// placements, return visits, videos max 254!
  AddUpdateState([this._activity]) {
    _setup(_activity);
  }

  final Activity? _activity;

  final IActivitiesRepository _repository = locator<IActivitiesRepository>();

  final IUserRepository _userRepository = locator<IUserRepository>();

  // prevents: PlatformDispatcher ERROR: A AddUpdateState was used after being disposed error!
  bool _isMounted = true;

  static const _maxHourNumber = 24;
  static const _maxMinuteNumber = 60;
  static final DateTime _currentDate = DateTime.now();

  AddUpdateStateStatus _status = AddUpdateStateStatus.loading;

  AddUpdateStateStatus get status => _status;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  int _userMinutesMultiplayer = 5;

  int get userMinutesMultiplayer => _userMinutesMultiplayer;

  bool _areLCDHours = false;

  bool get areLCDHours => _areLCDHours;
  int _h = 0;

  int get h => _h;
  DateTime _date = _currentDate;

  DateTime get dat => _date;
  int _min = 0;

  int get min => _min;
  int _placements = 0;

  int get placements => _placements;
  String _remarks = '';

  String get remarks => _remarks;
  int _returns = 0;

  int get returns => _returns;

  bool _userWantsLCDButton = true;

  bool get userWantLCDButton {
    return _userWantsLCDButton;
  }

  bool _showRemarksInput = false;

  bool get showRemarksInput => _showRemarksInput;

  bool get isUpdateMode => _activity != null;

  int _video = 0;

  int get video => _video;

  void onLCDHoursChange() {
    _areLCDHours = !_areLCDHours;
    _notify();
  }

  void addRemarksRequest() {
    _showRemarksInput = true;
    _notify();
  }

  void onHoursChange(int? value) {
    if (_h == value) return;
    _h = _validateTimeNumber(value, _maxHourNumber);
    _notify();
  }

  void setDate(DateTime? date) {
    if (date == null || date == _date) return;
    _date = date;
    _notify();
  }

  void onMinutesChange(int? value) {
    if (_min == value) return;
    _min = _validateTimeNumber(value, _maxMinuteNumber);
    _notify();
  }

  /// value is positive or negative. state +/-value
  void setPlacements(int value) {
    _placements = _validateInput(value, _placements);
    _notify();
  }

  /// value is positive or negative. state +/-value
  void setReturnVisits(int value) {
    _returns = _validateInput(value, _returns);
    _notify();
  }

  /// value is positive or negative. state +/-value
  void setVideoShowings(int value) {
    _video = _validateInput(value, _video);
    _notify();
  }

  void remarksOnChange(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      _remarks = '';
    } else {
      _remarks = trimmed;
    }
    print(_remarks);
  }

  /// if new item is added or is updated returns true, else returns false
  Future<bool> onSaveRequest() async {
    final bool isFormEmpty = (_h + _min + _placements + _returns + _video) == 0 && _remarks.isEmpty;
    // it is not update and no changes in form, all fields are 0 or empty.
    if (_activity == null && isFormEmpty) {
      await _setTemporaryMessage(msg: 'The activity is empty');
      return false;
    }
    Activity fromForm = _createActivityFromFormInputs();
    // creating new activity
    if (_activity == null) {
      final int id = await _addNew(fromForm);
      if (id > 0) {
        await _setTemporaryMessage(msg: 'Done!');
        return true;
      } else {
        await _setTemporaryMessage(msg: 'Not created. Ups');
        return false;
      }
    } else {
      // activity was changed has to be updated
      if (_activity != fromForm) {
        final int id = await _update(fromForm);
        if (id > 0) {
          await _setTemporaryMessage(msg: 'Done!');
          return true;
        } else {
          await _setTemporaryMessage(msg: 'Not updated. Ups');
          return false;
        }
      }
      // activity was not changed no update
      await _setTemporaryMessage(msg: 'No changes was made.');
      return false;
    }
  }

  /// sets status.error for 1600 milliseconds - appropriate message is displayed in UI
  Future<bool> _setTemporaryMessage({String msg = ''}) async {
    bool wasStatusChanged = false;
    _status = AddUpdateStateStatus.error;
    _errorMessage = msg;
    _notify();
    wasStatusChanged = await Future<bool>.delayed(const Duration(milliseconds: 1600), () {
      return _resetErrorState();
    });
    return wasStatusChanged;
  }

  Future<bool> _resetErrorState() async {
    _status = AddUpdateStateStatus.success;
    _errorMessage = '';
    _notify();
    return await Future<bool>.delayed(const Duration(milliseconds: 400), () {
      return true;
    });
  }

  Future<int> _addNew(Activity a) async {
    return await _repository.create(a);
  }

  Future<int> _update(Activity a) async {
    return _repository.update(a);
  }

  Activity _createActivityFromFormInputs() => Activity(
      createdAt: _activity?.createdAt ?? DateTime.now(),
      day: _date.day,
      lastModified: DateTime.now(),
      month: _date.month,
      serviceYear: utils.getServiceYear(DateTime(_date.year, _date.month)),
      year: _date.year,
      hours: _h,
      isLCDHours: _areLCDHours,
      minutes: _min,
      placements: _placements,
      remarks: _areLCDHours ? 'LCD time: $_h:$_min. $_remarks'.trim() : _remarks,
      returnVisits: _returns,
      videos: _video);

  int _validateTimeNumber(int? v, int max) {
    if (v == null) return 0;
    if (v > max - 1) {
      return max;
    } else if (v < 1) {
      return 0;
    } else {
      return v;
    }
  }

  /// database store bytes - max value is 255.
  int _validateInput(int input, int currentValue) {
    int temp = currentValue;
    if (temp + input < 1) {
      temp = 0;
    } else if (temp + input > 253) {
      temp = 254;
    } else {
      temp += input;
    }
    return temp;
  }

  void _setup(Activity? activity) {
    // print(User(createdAt: DateTime.now(), lastModified: DateTime.now(), id: 1).toJson());
    _status = AddUpdateStateStatus.loading;
    notifyListeners();
    if (activity != null) {
      _areLCDHours = activity.isLCDHours;
      _date = DateTime(activity.year, activity.month, activity.day);
      _h = activity.hours;
      _min = activity.minutes;
      _placements = activity.placements;
      _remarks = activity.remarks;
      _returns = activity.returnVisits;
      _video = activity.videos;
    }
    _status = AddUpdateStateStatus.success;
    _errorMessage = '';
    _isMounted = true;
    _userMinutesMultiplayer = _getUserMinutesMultiplayer(_userRepository.user.preferences);
    _userWantsLCDButton = _userRepository.user.preferences.showButtonLCDHours;
    notifyListeners();
  }

  int _getUserMinutesMultiplayer(Preferences p) {
    switch (p.minutesPrecision) {
      case MinutesPrecision.five:
        return 5;
      case MinutesPrecision.ten:
        return 10;
      case MinutesPrecision.fifteen:
        return 15;
      case MinutesPrecision.one:
        return 30;
      case MinutesPrecision.thirty:
        return 1;
      default:
        return 5;
    }
  }

  /// call notifyListeners() if ChangeNotifier is not disposed
  void _notify() {
    if (_isMounted) notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false;
  }
}
