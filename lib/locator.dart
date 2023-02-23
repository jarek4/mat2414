import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/src/data/database/activity_local_db_helper.dart';
import 'package:mat2414/src/data/database/local_db.dart';
import 'package:mat2414/src/data/database/report_local_db_helper.dart';
import 'package:mat2414/src/data/repositories/activities_repository.dart';
import 'package:mat2414/src/domain/local_database/i_activity_db_helper.dart';
import 'package:mat2414/src/domain/local_database/i_report_db_helper.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerSingleton<LocalDb>(LocalDb());
  locator.registerSingletonAsync<Isar>(() => LocalDb.getIsarDb());
  locator.registerLazySingleton<IActivityDbHelper>(() => ActivityLocalDbHelper());
  locator.registerLazySingleton<IReportDbHelper>(() => ReportLocalDbHelper());
  locator.registerLazySingleton<IActivitiesRepository>(() => ActivitiesRepository());
}
