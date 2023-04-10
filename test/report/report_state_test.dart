/*
import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar.dart';

import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/report/report.dart';

import 'package:mat2414/utils/constant_values.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@GenerateNiceMocks([
  MockSpec<IActivitiesRepository>(
    as: #MockIActivitiesRepository,
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<IReportsRepository>(
    as: #MockIReportsRepository,
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<IUserRepository>(
    as: #MockIUserRepository,
    onMissingStub: OnMissingStub.returnDefault,
  )
])
import 'report_state_test.mocks.dart';

void main() {
  late IActivitiesRepository activitiesRepository;
  late IReportsRepository reportsRepository;
  late IUserRepository userRepository;
  late ReportState sut;
  late Report emptyReport;
  late Preferences pref;
  late User userToTest;
  late CalendarDay selectedDay;

  group('ReportState', () {
    setUpAll(() async {
      await setupLocator();
      locator.allowReassignment = true;
      emptyReport = ConstantValues.emptyReport;
      pref = const Preferences(bibleStudies: 9);
      userToTest = ConstantValues.emptyUser.copyWith(preferences: pref);
      selectedDay = CalendarDay(date: DateTime(2023, 3, 20));
      userRepository = MockIUserRepository();
      when(userRepository.user).thenReturn(userToTest);
      // when(userRepository.user.preferences).thenReturn(emptyUser.preferences);
      activitiesRepository = MockIActivitiesRepository();
      reportsRepository = MockIReportsRepository();
      locator.registerSingleton<IUserRepository>(userRepository);
      locator.registerSingleton<IActivitiesRepository>(activitiesRepository);
      locator.registerSingleton<IReportsRepository>(reportsRepository);
      sut = ReportState(selectedDay);
      // await locator.allReady();
    });
    tearDownAll(() async {
      await locator.reset();
      resetMockitoState();
      sut.dispose();
    });
    group('Sets initial values', () {
      test('bibleStudies is equal to user.preferences.bibleStudies', () {
        expect(sut.bibleStudies, pref.bibleStudies);
      });
      test('calls userRepository.user to get bibleStudies number', () {
        verify(userRepository.user).called(1);
      });
    });

    group('buildSelectedMonthReport method should', () {
      test('call reportsRepository.readClosedForAMonth()', () async {
        when(reportsRepository.readClosedForAMonth(2023, 3))
            .thenAnswer((realInvocation) async => emptyReport);
        await sut.buildSelectedMonthReport();
        verify(reportsRepository.readClosedForAMonth(2023, 3)).called(1);
      });

      test('calls activitiesRepository.getForAMonth() if readClosedForAMonth() returns null',
          () async {
        when(reportsRepository.readClosedForAMonth(2023, 3))
            .thenAnswer((realInvocation) async => null);
        when(activitiesRepository.getForAMonth(2023, 3))
            .thenAnswer((realInvocation) async => <Activity>[]);
        await sut.buildSelectedMonthReport();
        verify(reportsRepository.readClosedForAMonth(2023, 3)).called(1);
        verify(activitiesRepository.getForAMonth(2023, 3)).called(1);
      });

      test('do not activitiesRepository.getForAMonth() if readClosedForAMonth() returns report',
          () async {
        when(reportsRepository.readClosedForAMonth(2023, 3))
            .thenAnswer((realInvocation) async => emptyReport);
        when(activitiesRepository.getForAMonth(2023, 3))
            .thenAnswer((realInvocation) async => <Activity>[]);
        await sut.buildSelectedMonthReport();
        verify(reportsRepository.readClosedForAMonth(2023, 3)).called(1);
        verifyNever(activitiesRepository.getForAMonth(2023, 3));
      });
    });

    group('Report stream controller', () {
      late StreamController<Report> reportCtr;
      late Stream<Report> reportStream;
      setUp(() async {
        reportCtr = sut.report;
        reportStream = reportCtr.stream;
      });
      tearDown(() {
        if (!reportCtr.isClosed) reportCtr.close();
      });
      test('emits Report when readClosedForAMonth returns closed report', () async {
        when(reportsRepository.readClosedForAMonth(2023, 3))
            .thenAnswer((realInvocation) async => emptyReport);
        // await sut.buildSelectedMonthReport(); must be called in the end!
        reportStream.listen(
          expectAsync1(
            (event) {
              expect(event, emptyReport);
            },
          ),
        );
        // or: expectLater(reportStream, emits(emptyReport));
        await sut.buildSelectedMonthReport();
      });
    });
  });
}
*/
