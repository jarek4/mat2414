/*import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/database/db_constants.dart';
import 'package:mat2414/src/data/database/local_db.dart';
import 'package:mat2414/src/data/database/user_local_db_helper.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// locator.registerSingletonAsync<Isar>
// call getIt.allReady() in setUpAll async body

// flutter pub run build_runner build --delete-conflicting-outputs
@GenerateNiceMocks([MockSpec<LocalDbClassForTesting>(as: #MockLocalDb)])
import 'user_local_db_helper_test.mocks.dart';

void main() {
  late Isar db;
  late UserLocalDbHelper sut;
  group('getCurrentUser method should', () {
    setUpAll(() async {
      await Isar.initializeIsarCore(download: true);
      setupLocator();
      locator.allowReassignment = true;
      await locator.allReady();
      sut = UserLocalDbHelper();
    });
    tearDownAll(() async {
      await locator.reset();
    });
    test('return type User?', () async {
      var dbWrapper = MockLocalDb();
      // var dbWrapper = LocalDbClassForTesting();
      // db = await dbWrapper.callStaticMethodGetIsarDb();
      locator.registerSingletonAsync<Isar>(() async => dbWrapper.callStaticMethodGetIsarDb());
      // await locator.allReady();
      db = await locator.getAsync<Isar>();
      final User eu = ConstantValues.emptyUser;
      // when(db.writeTxn<User?>(() async { return eu; })).thenAnswer((_) async => eu);
      // when(db.users.get(1)).thenAnswer((_) async => eu);
      // when(sut.getCurrentUser()).thenAnswer((_) async => eu);
      // expect(LocalDb.getIsarDb(), isA<Future<Isar>>());
    });
  });
   group('update method should', () {
    test('return type User?', () {
      expect(LocalDb.getIsarDb(), isA<Future<Isar>>());
    });
  });
}*/
