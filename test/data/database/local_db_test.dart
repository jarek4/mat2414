import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/src/data/database/db_constants.dart';
import 'package:mat2414/src/data/database/local_db.dart';

// locator.registerSingletonAsync<Isar>
// call getIt.allReady() in setUpAll async body
void main() {
  /*group('LocalDb', () {
    group('getIsarDb static method should', () {
      setUp(() async {
        await Isar.initializeIsarCore(download: true);
      });
      test('return type Future<Isar>', () {
        expect(LocalDb.getIsarDb(), isA<Future<Isar>>());
      });
      test('return opened Isar instance', () async {
        Isar isar = await LocalDb.getIsarDb();
        expect(isar.isOpen, true);
      });
      test('return Isar database named: DbConst.dbName', () async {
        Isar isar = await LocalDb.getIsarDb();
        expect(isar.name, DbConst.dbName);
      });
    });
    group('should', () {
      // setUp(() async {
      //   await Isar.initializeIsarCore(download: true);
      // });
      // test('return type Future<Isar>', () { });
    });
  });*/
}
