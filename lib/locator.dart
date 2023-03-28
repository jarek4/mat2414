import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/src/data/database/activity_local_db_helper.dart';
import 'package:mat2414/src/data/database/local_db.dart';
import 'package:mat2414/src/data/database/report_local_db_helper.dart';
import 'package:mat2414/src/data/database/user_local_db_helper.dart';
import 'package:mat2414/src/data/repositories/activities_repository.dart';
import 'package:mat2414/src/data/repositories/reports_repository.dart';
import 'package:mat2414/src/data/repositories/user_repository.dart';
import 'package:mat2414/src/domain/local_database/i_activity_db_helper.dart';
import 'package:mat2414/src/domain/local_database/i_report_db_helper.dart';
import 'package:mat2414/src/domain/local_database/i_user_db_helper.dart';
import 'package:mat2414/src/domain/repositories/i_activity_repository.dart';
import 'package:mat2414/src/domain/repositories/i_reports_repository.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';
import 'package:mat2414/src/settings/settings_controller.dart';
import 'package:mat2414/src/settings/settings_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingletonAsync<Isar>(() async => LocalDb.getIsarDb());
  locator.registerSingletonWithDependencies<IUserDbHelper>(() => UserLocalDbHelper(),
      dependsOn: [Isar]);
  // locator.registerSingletonWithDependencies<IUserRepository>(() => UserRepository()..init(),
  //     dependsOn: [Isar, IUserDbHelper]);
  locator.registerSingletonAsync<IUserRepository>(() async {
    UserRepository repo = UserRepository();
    await repo.init();
    return repo;
  }, dependsOn: [Isar, IUserDbHelper]);
  locator.registerSingletonWithDependencies<SettingsService>(() => SettingsService(),
      dependsOn: [Isar, IUserRepository, IUserDbHelper]);
  locator.registerSingletonWithDependencies<SettingsController>(() => SettingsController(locator<SettingsService>()),
      dependsOn: [Isar, IUserRepository, SettingsService, IUserDbHelper]);
  locator.registerSingletonWithDependencies<IActivityDbHelper>(() => ActivityLocalDbHelper(),
      dependsOn: [Isar]);
  locator.registerSingletonWithDependencies<IActivitiesRepository>(() => ActivitiesRepository(),
      dependsOn: [Isar, IActivityDbHelper]);
  locator.registerSingletonWithDependencies<IReportDbHelper>(() => ReportLocalDbHelper(),
      dependsOn: [Isar]);
  locator.registerSingletonWithDependencies<IReportsRepository>(() => ReportsRepository(),
      dependsOn: [Isar, IReportDbHelper]);
}
