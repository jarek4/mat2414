import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/data/repositories/reports_repository.dart';
import 'package:mat2414/src/domain/local_database/i_report_db_helper.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// call getIt.allReady() in setUpAll async body

// flutter pub run build_runner build --delete-conflicting-outputs
@GenerateNiceMocks([
  MockSpec<IReportDbHelper>(
    as: #MockIReportDbHelper,
    onMissingStub: OnMissingStub.returnDefault,
  )
])
import 'reports_repository_test.mocks.dart';

void main() {
  late IReportDbHelper db;
  late ReportsRepository sut;
  final Report emptyReport = ConstantValues.emptyReport;
  setUpAll(() async {
    setupLocator();
    locator.allowReassignment = true;
    // await locator.allReady();
  });
  tearDownAll(() async {
    await locator.reset();
    resetMockitoState();
  });
  group('lastActivities stream controller', () {
    setUp(() async {
      db = MockIReportDbHelper();
      locator.registerSingleton<IReportDbHelper>(db);
      sut = ReportsRepository();
    });
    tearDown(() {});

    test('emits values', () async {});
    test('emits values 2', () async {});
  });
  group('create method should', () {
    setUp(() async {
      db = MockIReportDbHelper();
      locator.registerSingleton<IReportDbHelper>(db);
      sut = ReportsRepository();
    });
    test('return int', () async {
      when(db.add(emptyReport.copyWith(id: 34))).thenAnswer((_) async => 5);
      expect(await sut.create(emptyReport.copyWith(id: 34)), isA<int>());
      // db changes lastModified when saving new object!
      verify(db.add(emptyReport.copyWith(id: 34))).called(1);
    });
    test('call database add method', () async {
      when(db.add(emptyReport)).thenAnswer((_) async => 5);
      await sut.create(emptyReport);
      verify(db.add(emptyReport)).called(1);
    });
  });
  group('readClosedForAMonth method should', () {
    setUp(() async {
      db = MockIReportDbHelper();
      locator.registerSingleton<IReportDbHelper>(db);
      sut = ReportsRepository();
    });

    // If onTimeout: () => null
    // inside ReportsRepository _db..getClosedForAMonth(year, month) .timeout(const Duration(seconds: 3), onTimeout: () => null);
    // test throws error:
    // type '() => Null' is not a subtype of type '(() => FutureOr<Report>)?' of 'onTimeout'
    // If onTimeout: () => ConstantValues.emptyReport
    // It is OK

    // test('return Future<Report?>', () async {
    //   when(db.getClosedForAMonth(2023, 2)).thenAnswer((_) async => emptyReport);
    //   expect(sut.readClosedForAMonth(2023, 2), isA<Future<Report?>>());
    // });
    /* test('call database getClosedForAMonth method', () async {
      when(db.getClosedForAMonth(2023, 2)).thenAnswer((_) async => emptyReport);
      await sut.readClosedForAMonth(2023, 2);
      verify(db.getClosedForAMonth(2023, 2)).called(1);
    });*/
    test('do not call database getClosedForAMonth method if month= 0 || year==0', () async {
      when(db.getClosedForAMonth(2023, 0)).thenAnswer((_) async => emptyReport);
      await sut.readClosedForAMonth(2023, 0);
      verifyNever(db.getClosedForAMonth(2023, 0));
    });
  });
}
