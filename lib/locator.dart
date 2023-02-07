import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/src/data/database/local_db.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerSingleton<LocalDb>(LocalDb());
  locator.registerSingletonAsync<Isar>(() => LocalDb.getDb());
}
