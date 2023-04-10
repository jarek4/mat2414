import 'dart:collection';
import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/calendar/calendar.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/ui/screens/detail/detail_state.dart';
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
import 'detail_state_test.mocks.dart';

void main() {
  final defaultCalendarDay = CalendarDay(date: DateTime(2023, 3, 20));
  late CalendarDay selectedDay;
  late IUserRepository userRepo;
  late IActivitiesRepository activitiesRepository;
  late IReportsRepository reportsRepository;
  late DetailState sut;
  // late Stream<UnmodifiableListView<Activity>> watchDayActivitiesStream;
  // late StreamController<Report> reportController;

  group('DetailState', () {
    setUpAll(() async {
      selectedDay = defaultCalendarDay;
      await setupLocator();
      locator.allowReassignment = true;
      userRepo = MockIUserRepository();
      activitiesRepository = MockIActivitiesRepository();
      reportsRepository = MockIReportsRepository();
      locator.registerSingleton<IUserRepository>(userRepo);
      locator.registerSingleton<IActivitiesRepository>(activitiesRepository);
      locator.registerSingleton<IReportsRepository>(reportsRepository);
      // without await locator.allReady() tests don't compile!
      // 'instanceFactory.isReady': You tried to access an instance of IActivitiesRepository that is not ready yet
      // await locator.allReady();
      sut = DetailState(selectedDay);
    });
    tearDownAll(() async {
      await locator.reset();
      resetMockitoState();
      sut.dispose();
    });

    group('CalendarDay selectedDate field should be equal to ', () {
      late CalendarDay updatedSelectedDay;
      setUp(() {
        updatedSelectedDay = CalendarDay(date: DateTime(2023, 9, 9));
      });
      tearDown(() {
        resetMockitoState();
      });
      test('value passed through the constructor if update method was not called', () {
        expect(sut.selectedDate, selectedDay);
      });

      test('value passed through update method, when update method was called', () {
        sut.update(updatedSelectedDay);
        expect(sut.selectedDate, updatedSelectedDay);
      });
    });

    group('Stream watchDayActivities should', () {
      setUp(() {
        sut.update(defaultCalendarDay);
      });
      tearDown(() {
        resetMockitoState();
      });
      test(
        'emmit value returned from activitiesRepository.getForADay() as UnmodifiableListView',
        () async {
          final int y = selectedDay.year, m = selectedDay.month, d = selectedDay.day;
          var activities = <Activity>[ConstantValues.emptyActivity.copyWith(id: 22)];

          when(activitiesRepository.getForADay(y, m, d))
              .thenAnswer((realInvocation) async => activities);

          expectLater(
            sut.watchDayActivities(),
            emitsInOrder([UnmodifiableListView<Activity>(activities)]),
          );

          sut.refreshForADayActivities();
          verify(activitiesRepository.getForADay(y, m, d)).called(1);
        },
      );
    });
  });
}
