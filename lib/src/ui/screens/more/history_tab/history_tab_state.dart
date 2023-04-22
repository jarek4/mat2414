import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';

enum HistoryTabStatus { error, loading, success }

class HistoryTabState with ChangeNotifier {
  HistoryTabState();

  final IReportsRepository _reportsRepository = locator<IReportsRepository>();

  final _reportCtrl = StreamController<UnmodifiableListView<Report>>.broadcast();
  final _syCtrl = StreamController<ServiceYear>.broadcast();

  String? _selectedServiceYear;

  String? get selectedServiceYear => _selectedServiceYear;

  UnmodifiableListView<Report> _reports = UnmodifiableListView<Report>([]);

  HistoryTabStatus _status = HistoryTabStatus.success;

  HistoryTabStatus get status => _status;

  ServiceYear _sy = const ServiceYear();

  void onServiceYearChange(String? sy) async {
    if (_selectedServiceYear != sy) {
      _selectedServiceYear = sy;
      notifyListeners();
    }
  }

  var _availableServiceYears = <String>[];

  Future<UnmodifiableListView<String>> readStoredServiceYears() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (_availableServiceYears.isNotEmpty) {
      return UnmodifiableListView<String>(_availableServiceYears);
    }
    _availableServiceYears = await _reportsRepository.getStoredServiceYearProperties();
    return UnmodifiableListView<String>(_availableServiceYears);
  }

  Stream<UnmodifiableListView<Report>> reports() async* {
    await Future.delayed(const Duration(milliseconds: 1000));
    // if (_reports.isEmpty) await _getReportsForServiceYear();
    yield _reports;
    yield* _reportCtrl.stream;
  }

  Future<void> _getReportsForServiceYear() async {
    if (_selectedServiceYear == null || _selectedServiceYear!.isEmpty) return;
    final reports = await _reportsRepository.readForAServiceYear(_selectedServiceYear!);
    _reports = UnmodifiableListView<Report>(reports);
    notifyListeners();
  }

  Stream<ServiceYear> serviceYear() async* {
    _status = HistoryTabStatus.loading;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 400));
    await _makeServiceYearReport();
    yield _sy;
    yield* _syCtrl.stream;
  }

  Future<void> _makeServiceYearReport() async {
    await _getReportsForServiceYear();
    var temp = const ServiceYear();
    if (_reports.isNotEmpty) {
      for (Report r in _reports) {
        temp = temp.copyWith(
          bibleStudies: temp.bibleStudies + r.bibleStudies,
          durationInMinutes: temp.durationInMinutes + r.durationInMinutes,
          minutesLDC: temp.minutesLDC + r.minutesLDC,
          placements: temp.placements + r.placements,
          returnVisits: temp.returnVisits + r.returnVisits,
          videos: temp.videos + r.videos,
          reportsIds: [...temp.reportsIds, r.id],
        );
      }
      // average bibleStudies per month, arithmetic mean
      final bs = (temp.bibleStudies / _reports.length * 10).round() / 10.0;
      _sy = temp.copyWith(bibleStudies: bs);
    }
    _status = HistoryTabStatus.success;
    notifyListeners();
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
    if (!_reportCtrl.isClosed) _reportCtrl.close();
    if (!_syCtrl.isClosed) _syCtrl.close();
  }
}
