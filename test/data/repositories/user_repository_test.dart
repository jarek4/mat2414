import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';

import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/data/repositories/user_repository.dart';
import 'package:mat2414/src/domain/local_database/i_user_db_helper.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// call getIt.allReady() in setUpAll async body

// flutter pub run build_runner build --delete-conflicting-outputs
@GenerateNiceMocks([
  MockSpec<IUserDbHelper>(
    as: #MockIUserDbHelper,
    onMissingStub: OnMissingStub.returnDefault,
  )
])
import 'user_repository_test.mocks.dart';

void main() {
  late IUserDbHelper db;
  late UserRepository sut;
  final User emptyUser = ConstantValues.emptyUser;
  setUpAll(() async {
    setupLocator();
    locator.allowReassignment = true;
    // await locator.allReady();
  });
  tearDownAll(() async {
    await locator.reset();
    resetMockitoState();
  });
  group('after init() was called get user should', () {
    setUp(() async {
      db = MockIUserDbHelper();
      locator.registerSingleton<IUserDbHelper>(db);
      sut = UserRepository();
    });

    test('return type User', () async {
      when(db.getCurrentUser()).thenAnswer((_) async => emptyUser);
      await sut.init();
      expect(sut.user, isA<User>());
    });
    test('call db.getCurrentUser()', () async {
      when(db.getCurrentUser()).thenAnswer((_) async => emptyUser);
      await sut.init();
      verify(db.getCurrentUser()).called(1);
      // final int calls = verify(db.getCurrentUser()).callCount;
    });
  });
  group('update method should', () {
    setUp(() async {
      db = MockIUserDbHelper();
      locator.registerSingleton<IUserDbHelper>(db);
      sut = UserRepository();
    });
    test('call db.update', () async {
      when(db.update(emptyUser)).thenAnswer((_) async => emptyUser);
      await sut.update(emptyUser);
      verify(db.update(emptyUser)).called(1);
    });
    test('set new _currentUser', () async {
      final User updated = emptyUser.copyWith(token: 'updated token');
      when(db.update(updated)).thenAnswer((_) async => updated);
      await sut.update(updated);
      expect(sut.user.token, updated.token);
    });
  });
}
