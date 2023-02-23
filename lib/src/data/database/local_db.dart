import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:path_provider/path_provider.dart';

import 'db_constants.dart';

class LocalDb {
  static final List<CollectionSchema<dynamic>> _schemas = [
    UserSchema,
    ActivitySchema,
    ReportSchema
  ];

  static Future<Isar> _openIsarDb() async {
    try {
      // /data/user/0/com.gmail.forin.mat2414/app_flutter
      // path: /data/user/0/com.gmail.forin.mat2414/app_flutter/mat2414_database.isar
      final Directory dir = await getApplicationDocumentsDirectory();
      // getApplicationSupportDirectory
      final Isar isar = await Isar.open(_schemas, directory: dir.path, name: DbConst.dbName);
      // prepopulate default user
      if (await isar.collection<User>().count() < 1) _prepopulateUser(isar);
      return isar;
    } catch (e) {
      if (kDebugMode) print('LocalDb _openIsarDb. $e');
      throw Exception('No permission to access local storage. Database is not opened. $e');
    }
  }

  /// returns database instance. Throws exceptions!
  static Future<Isar> getIsarDb() async {
    try {
      // instanceNames-> {mat2414_database}
      if (Isar.instanceNames.isNotEmpty) {
        final Isar? isar = Isar.getInstance(DbConst.dbName);
        if (isar != null && isar.isOpen) return isar;
        return await _openIsarDb();
      } else {
       return await _openIsarDb();
      }
    } catch (e) {
      if (kDebugMode) print('LocalDb getIsarDb. $e');
      rethrow;
    }
  }

  static Future<void> _prepopulateUser(Isar isar) async {
    try {
      final int timeStamp = DateTime.now().microsecondsSinceEpoch;
      final Map<String, dynamic> jsonDefaultUser = {
        'id': 1,
        'createdAt': timeStamp,
        'lastModified': timeStamp,
        'name': 'default user',
        'uid': ''
      };
      await isar.writeTxn(() async => await isar.collection<User>().importJson([jsonDefaultUser]));
    } catch (e) {
      if (kDebugMode) print('LocalDb _prepopulateUser. $e');
      throw Exception('No permission to write local storage. Default user not populated. $e');
    }
  }

}

// flutter pub run build_runner build --delete-conflicting-outputs
