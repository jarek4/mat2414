import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';

import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/data/repositories/activities_repository.dart';
import 'package:mat2414/src/domain/local_database/i_activity_db_helper.dart';

import 'package:mat2414/utils/constant_values.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// call getIt.allReady() in setUpAll async body

// flutter pub run build_runner build --delete-conflicting-outputs
@GenerateNiceMocks([
  MockSpec<IActivityDbHelper>(
    as: #MockIActivityDbHelper,
    onMissingStub: OnMissingStub.returnDefault,
  )
])
import 'activities_repository_test.mocks.dart';

void main() {
  late IActivityDbHelper db;
  late ActivitiesRepository sut;
  final Activity emptyActivity = ConstantValues.emptyActivity;
  setUpAll(() async {
    setupLocator();
    locator.allowReassignment = true;
    // await locator.allReady();
  });
  tearDownAll(() async {
    await locator.reset();
    resetMockitoState();
    sut.dispose();
  });
  group('lastActivities stream controller', () {
    setUp(() async {
      db = MockIActivityDbHelper();
      locator.registerSingleton<IActivityDbHelper>(db);
      sut = ActivitiesRepository();
    });
    tearDown(() {});

    test('emits values', () async {
      Stream<List<Activity>> stream = sut.watch3recent().asBroadcastStream();
      when(db.getLast(3))
          .thenAnswer((realInvocation) async => [emptyActivity.copyWith(placements: 88)]);
      stream.listen((event) {
        // print('event');
      });
      expectLater(stream, emits([emptyActivity.copyWith(placements: 88)]));
    });
    test('emits values 2', () async {
      Stream<List<Activity>> stream = sut.watch3recent().asBroadcastStream();
      final List<Activity> activities2 = [
        emptyActivity.copyWith(videos: 3),
        emptyActivity.copyWith(hours: 4),
        emptyActivity.copyWith(minutes: 25)
      ];
      when(db.getLast(3)).thenAnswer((realInvocation) async => activities2);
      stream.listen(
        expectAsync1(
          (event) {
            expect(event, activities2);
          },
        ),
      );
    });
  });
  group('create method should', () {
    setUp(() async {
      db = MockIActivityDbHelper();
      locator.registerSingleton<IActivityDbHelper>(db);
      sut = ActivitiesRepository();
    });
    test('return int', () async {
      when(db.add(emptyActivity.copyWith(id: 34))).thenAnswer((_) async => 5);
      expect(await sut.create(emptyActivity.copyWith(id: 34)), isA<int>());
      // db changes lastModified when saving new object!
      verify(db.add(emptyActivity.copyWith(id: 34))).called(1);
    });
    test('call database add method', () async {
      when(db.add(emptyActivity)).thenAnswer((_) async => 5);
      await sut.create(emptyActivity);
      verify(db.add(emptyActivity)).called(1);
    });
  });
  group('getForADay method should', () {
    setUp(() async {
      db = MockIActivityDbHelper();
      locator.registerSingleton<IActivityDbHelper>(db);
      sut = ActivitiesRepository();
    });
    test('return Future<List<Activity>>', () async {
      when(db.getForADay(2023, 2, 20)).thenAnswer((_) async => [emptyActivity]);
      expect(sut.getForADay(2023, 2, 20), isA<Future<List<Activity>>>());
    });
    test('call database getForADay method', () async {
      when(db.getForADay(2023, 2, 20)).thenAnswer((_) async => [emptyActivity]);
      await sut.getForADay(2023, 2, 20);
      verify(db.getForADay(2023, 2, 20)).called(1);
    });
    test('do not call database getForADay method if day==0 || month= 0 || year==0', () async {
      when(db.getForADay(2023, 0, 20)).thenAnswer((_) async => [emptyActivity]);
      await sut.getForADay(2023, 0, 20);
      verifyNever(db.getForADay(2023, 0, 20));
    });
  });
}
