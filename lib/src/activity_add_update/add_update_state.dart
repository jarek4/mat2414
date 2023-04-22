import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/localization/locale_notifier.dart';
import 'package:mat2414/utils/convert_duration.dart' as utils_cd;
import 'package:mat2414/utils/get_service_year.dart' as utils_sy;

import '../domain/repositories/i_activity_repository.dart';

enum AddUpdateStateStatus { error, loading, success }

enum AddUpdateErrorCode { isEmpty, notCreated, noChangesMade, noErrors, notSaved, notUpdated }

class AddUpdateState with ChangeNotifier {
  /// placements, return visits, videos max value 254!
  /// if _activity is null looks for selectedDate
  AddUpdateState({Activity? activity, DateTime? selectedDate})
      : _activity = activity,
        _selectedDate = selectedDate {
    _setup(activity, selectedDate);
  }

  final Activity? _activity;

  // ignore: unused_field
  final DateTime? _selectedDate;

  final IActivitiesRepository _repository = locator<IActivitiesRepository>();

  final IUserRepository _userRepository = locator<IUserRepository>();

  // localization
  final ILocaleNotifier _s = locator<ILocaleNotifier>();

  // prevents: PlatformDispatcher ERROR: A AddUpdateState was used after being disposed error!
  bool _isMounted = true;

  static const _maxHourNumber = 24;
  static const _maxMinuteNumber = 60;
  static final DateTime _currentDate = DateTime.now();

  AddUpdateStateStatus _status = AddUpdateStateStatus.loading;

  AddUpdateStateStatus get status => _status;

  AddUpdateErrorCode _errorCode = AddUpdateErrorCode.noErrors;

  AddUpdateErrorCode get errorCode => _errorCode;

  int _userMinutesMultiplayer = 1;

  int get userMinutesMultiplayer => _userMinutesMultiplayer;

  bool _areLDCHours = false;

  bool get areLDCHours => _areLDCHours;

  // String _ldcLocaleTranslation = '';
  int _h = 0;

  int get h => _h;
  DateTime _date = _currentDate;

  DateTime get date => _date;
  int _min = 0;

  int get min => _min;
  int _placements = 0;

  int get placements => _placements;
  String _remarks = '';

  String get remarks => _remarks;
  int _returns = 0;

  int get returns => _returns;

  bool _userWantsLDCButton = true;

  bool get userWantLDCButton {
    return _userWantsLDCButton;
  }

  bool _showRemarksInput = false;

  bool get showRemarksInput => _showRemarksInput;

  bool get isUpdateMode => _activity != null;

  int _video = 0;

  int get video => _video;

  void onLDCHoursChange() {
    _areLDCHours = !_areLDCHours;
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
    final String trimmedValue = value.trim();
    if (trimmedValue.isEmpty) {
      _remarks = '';
    } else {
      _remarks = trimmedValue;
    }
  }

  /// if new item is added or is updated returns the item, else returns null
  /// when returns null don't close the bottom sheet form.
  Future<Activity?> onSaveRequest() async {
    final bool isFormEmpty = (_h + _min + _placements + _returns + _video) == 0 && _remarks.isEmpty;
    // No activity item was passed into the form. Not update mode.
    // The user has not entered data into the form (all fields are 0 or empty).
    if (_activity == null && isFormEmpty) {
      // Empty activity will not be saved!
      // Show info to the user inside the form. Don't close the bottom sheet form.
      await _setTemporaryMessage(msg: AddUpdateErrorCode.isEmpty);
      return null;
    }
    // The user has entered a data into the form:
    _status = AddUpdateStateStatus.loading;
    _errorCode = AddUpdateErrorCode.noErrors;
    _notify();
    Activity fromForm = _createActivityFromFormInputs();
    // Creating new activity (no activity item was passed into the form).
    if (_activity == null) {
      final int id = await _repository.create(fromForm);
      if (id > 0) {
        // The new activity was saved into DB. Close the bottom sheet form and return created item.
        _status = AddUpdateStateStatus.success;
        _notify();
        return fromForm.copyWith(id: id);
      } else {
        // The new activity NOT saved into DB. Don't close the bottom sheet form.
        // Show info to the user inside the form.
        await _setTemporaryMessage(msg: AddUpdateErrorCode.notCreated);
        return null;
      }
      // Activity item was passed to the form. Update mode.
    } else {
      // The user has entered a data into the form:
      // Activity fromForm has lastModified field equal to DateTime.now(),
      // so it never is equal to _activity
      if (_activity != fromForm.copyWith(lastModified: _activity!.lastModified)) {
        _status = AddUpdateStateStatus.loading;
        _errorCode = AddUpdateErrorCode.noErrors;
        _notify();
        final int id = await _repository.update(fromForm);
        if (id > 0) {
          // The updated activity was saved into DB. Close the bottom sheet form and return the item.
          _status = AddUpdateStateStatus.success;
          _notify();
          return fromForm;
        } else {
          // The updated activity was NOT saved. Don't close the bottom sheet form.
          await _setTemporaryMessage(msg: AddUpdateErrorCode.notUpdated);
          return null;
        }
      }
      // The passed activity was not changed. There is no need to save into DB.
      // Don't close the bottom sheet form.
      await _setTemporaryMessage(msg: AddUpdateErrorCode.noChangesMade);
      return null;
    }
  }

  /// sets status.error for 3600 milliseconds - appropriate message is displayed in bottom sheet form
  Future<bool> _setTemporaryMessage({AddUpdateErrorCode msg = AddUpdateErrorCode.noErrors}) async {
    bool wasStatusChanged = false;
    _status = AddUpdateStateStatus.error;
    _errorCode = msg;
    _notify();
    wasStatusChanged = await Future<bool>.delayed(const Duration(milliseconds: 3600), () {
      _status = AddUpdateStateStatus.success;
      _errorCode = AddUpdateErrorCode.noErrors;
      _notify();
      return true;
    });
    return wasStatusChanged;
  }

  // DB manage lastModified property!
  Activity _createActivityFromFormInputs() => Activity(
      createdAt: _activity?.createdAt ?? DateTime.now(),
      day: _date.day,
      lastModified: _currentDate,
      month: _date.month,
      serviceYear: utils_sy.getServiceYear(DateTime(_date.year, _date.month)),
      year: _date.year,
      durationInMinutes: utils_cd.minAndHoursToDurationInMinutes(_h, _min),
      id: _activity?.id ?? Isar.autoIncrement,
      type: _areLDCHours ? ActivityType.ldc : ActivityType.normal,
      placements: _placements,
      remarks: _areLDCHours
          ? '[${_s.loc.generalLDCHours}: ${_makeTimeString(h, min)}${_remarks.isEmpty ? '' : '; $_remarks.'}]'
          : _remarks,
      returnVisits: _returns,
      uid: _userRepository.user.uid,
      videos: _video);

  String _makeTimeString(int h, int min) {
    var hAndM = utils_cd.minutesDurationToFormattedString(h * 60 + min);
    if (hAndM.startsWith('0')) return hAndM.substring(1);
    return hAndM;
  }

  int _validateTimeNumber(int? value, int max) {
    if (value == null || value < 1) return 0;
    if (value > max - 1) {
      return max;
    }else {
      return value;
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

  void _setup(Activity? activity, DateTime? selectedDate) {
    _status = AddUpdateStateStatus.loading;
    notifyListeners();
    if (activity != null) {
      final hAndMin = utils_cd.minutesToHoursAndMin(activity.durationInMinutes);
      _areLDCHours = activity.type == ActivityType.ldc;
      _date = DateTime(activity.year, activity.month, activity.day);
      _h = hAndMin[0];
      _min = hAndMin[1];
      _placements = activity.placements;
      _remarks = activity.remarks;
      _returns = activity.returnVisits;
      _video = activity.videos;
    }
    if (activity == null && selectedDate != null) {
      _date = selectedDate;
    }
    _status = AddUpdateStateStatus.success;
    _errorCode = AddUpdateErrorCode.noErrors;
    _isMounted = true;
    _userMinutesMultiplayer = _getUserMinutesMultiplier(_userRepository.user.preferences);
    _userWantsLDCButton = _userRepository.user.preferences.showButtonLDCHours;
    notifyListeners();
  }

  int _getUserMinutesMultiplier(Preferences p) {
    switch (p.minutesPrecision) {
      case MinutesPrecision.five:
        return 5;
      case MinutesPrecision.ten:
        return 10;
      case MinutesPrecision.fifteen:
        return 15;
      case MinutesPrecision.thirty:
        return 30;
      default:
        return 1;
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
