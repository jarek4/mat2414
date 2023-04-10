import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/ui/screens/home/home_screen_state_provider.dart';
import 'package:mockito/mockito.dart';

import '../detail/detail_state_test.mocks.dart';


void main() {
  late IActivitiesRepository activitiesRepository;
  late HomeScreenStateProvider sut;

  group('HomeScreenStateProvider', () {
    setUpAll(() async {
      await setupLocator();
      locator.allowReassignment = true;
      activitiesRepository = MockIActivitiesRepository();
      // without await locator.allReady() tests don't compile!
      // 'instanceFactory.isReady': You tried to access an instance of IActivitiesRepository that is not ready yet
      await locator.allReady();
      sut = HomeScreenStateProvider();
    });
    tearDownAll(() async {
      await locator.reset();
      resetMockitoState();
      sut.dispose();
    });

    group('Stream<UnmodifiableListView<Activity>> last3() should', () {
      test(
        'emmit UnmodifiableListView<Activity>([]) when _newestActivities == []',
        () async {
          when(activitiesRepository.watch3recent())
              .thenAnswer((realInvocation) => Stream.fromIterable([[]]));

          expectLater(
            sut.last3(),
            emitsInOrder([[]]),
          );
          // sut.last3();
        },
        //  timeout: const Timeout(Duration(milliseconds: 1000)),
      );
    });
  });
}
