import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/activity_add_update/add_update_state.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/data/repositories/activities_repository.dart';
import 'package:mat2414/src/data/repositories/user_repository.dart';
import 'package:mat2414/src/localization/locale_notifier.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';

// locator.registerSingletonAsync<Isar>
// call getIt.allReady() in setUpAll async body

// flutter pub run build_runner build --delete-conflicting-outputs
@GenerateNiceMocks([
  MockSpec<ActivitiesRepository>(as: #MockActivitiesRepo),
  MockSpec<UserRepository>(as: #MockUserRepo),
  MockSpec<AddUpdateState>(as: #MockAddUpdateState),
  MockSpec<ILocaleNotifier>(as: #MockILocaleNotifier)
])
import 'activity_add_update_test.mocks.dart';

void main() {
  late AddUpdateState sut;
  late ActivitiesRepository activitiesRep;
  late UserRepository userRepo;
  // final User user = User(createdAt: DateTime.now(), lastModified: DateTime.now());
  late User currentUser;
  late Activity? activityToUpdate;
  final User emptyUser = ConstantValues.emptyUser;
  final Activity mockActivity = ConstantValues.emptyActivity
      .copyWith(month: 2, year: 2023, durationInMinutes: 2, placements: 5, returnVisits: 3);

  setUpAll(() async {
    // await Isar.initializeIsarCore(download: true);
    setupLocator();
    locator.allowReassignment = true;
  });

  group('class fields has proper initial values', () {
    group('when AddUpdateState(activity: null)', () {
      setUp(() {
        userRepo = MockUserRepo();
        activitiesRep = MockActivitiesRepo();
        currentUser = emptyUser;
        //await Isar.initializeIsarCore(download: true);
        locator.registerSingleton<IActivitiesRepository>(activitiesRep);
        locator.registerSingleton<IUserRepository>(userRepo);
        // locator.registerSingletonWithDependencies<IActivitiesRepository>();
        // locator.registerSingletonAsync<IUserRepository>(() async {
        //   UserRepository repo = UserRepository();
        //   await repo.init();
        //   return repo;
        // });
        when(userRepo.user).thenReturn(currentUser);
        sut = AddUpdateState();
      });
      test('isUpdateMode is false', () {
        expect(sut.isUpdateMode, false);
      });
      test('userWantsLDCButton = currentUser.preferences.showButtonLDCHours', () {
        final bool isLdcBtn = currentUser.preferences.showButtonLDCHours;
        expect(sut.userWantLDCButton, isLdcBtn);
      });
      test('showRemarksInput = false', () {
        expect(sut.showRemarksInput, false);
      });
      test('status != AddUpdateStateStatus.error', () {
        expect(sut.status, isNot(AddUpdateStateStatus.error));
      });
    });
    group('when AddUpdateState(activity: Activity)', () {
      setUp(() {
        userRepo = MockUserRepo();
        activitiesRep = MockActivitiesRepo();
        currentUser = emptyUser;
        locator.registerSingleton<IActivitiesRepository>(activitiesRep);
        locator.registerSingleton<IUserRepository>(userRepo);
        when(userRepo.user).thenReturn(currentUser);
        activityToUpdate = mockActivity;
        sut = AddUpdateState(activity: activityToUpdate);
      });
      test('isUpdateMode is true', () {
        expect(sut.isUpdateMode, true);
      });
      test('placements == activityToUpdate.placements', () {
        expect(sut.placements, activityToUpdate!.placements);
      });
    });
  });
  group('onSaveRequest method', () {
    setUp(() {
      userRepo = MockUserRepo();
      activitiesRep = MockActivitiesRepo();
      currentUser = emptyUser;
      locator.registerSingleton<IActivitiesRepository>(activitiesRep);
      locator.registerSingleton<IUserRepository>(userRepo);
      when(userRepo.user).thenReturn(currentUser);
      activityToUpdate = mockActivity;
      sut = AddUpdateState(activity: activityToUpdate);
    });
    test('returns type Future<Activity?>', () {
      expect(sut.onSaveRequest(), isA<Future<Activity?>>());
    });
    // don't work!
    test('when no activity was passed and form was not filled returns null', () async {
      //sut = AddUpdateState();
      sut.remarksOnChange('value');

      when(activitiesRep.update(mockActivity)).thenAnswer((realInvocation) async => 22);
      Activity? res = await sut.onSaveRequest(); // it always returns null!
      expect(res, null);
    });
    test('when no activity was passed and form was not filled return type isNot Activity',
        () async {
      //sut = AddUpdateState();
      Activity? res = await sut.onSaveRequest(); // it always returns null!
      expect(res, isNot(Activity));
    });
  });
  group('?', () {});
}
