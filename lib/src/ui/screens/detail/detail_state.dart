import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import '../../../localization/locale_notifier.dart';

class DetailState with ChangeNotifier {
  DetailState();

  // localization
  final ILocaleNotifier _s = locator<ILocaleNotifier>();

  List<String> get tabs => [_s.loc.tabActivity, _s.loc.tabReport];

  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void onTabIndexChange(int index) {
    if (_tabIndex != index) {
      _tabIndex = index;
      notifyListeners();
    }
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
