import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/settings/settings_controller.dart';

enum OnboardingStatus { loading, error, success }

class OnboardingState with ChangeNotifier {
  final SettingsController _settings = locator<SettingsController>();

  OnboardingStatus _status = OnboardingStatus.success;

  OnboardingStatus get status => _status;

  Future<void> setUsername(String? name) async {
    if (name == null) return;
    _status = OnboardingStatus.loading;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 700), () {
      _settings
          .updateUser(_settings.user.copyWith(
        name: name,
        isOnboardingPassed: true,
        nextRateRequestDate: DateTime.now().add(const Duration(days: 16)),
      )).then((_) {
        _status = OnboardingStatus.success;
        notifyListeners();
      });
    });
  }

  Future<void> skipUsername() async {
    _status = OnboardingStatus.loading;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 700), () {
      _settings
          .updateUser(_settings.user.copyWith(
        isOnboardingPassed: true,
        nextRateRequestDate: DateTime.now().add(const Duration(days: 16)),
      )).then((_) {
        _status = OnboardingStatus.success;
        notifyListeners();
      });
    });
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
  }
}
