import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
      if (await isar.collection<User>().count() < 1) await _prepopulateUser(isar);
      /*if (await isar.collection<User>().count() < 1) {
        User u = User(createdAt: DateTime.now(), lastModified: DateTime.now(), id: 1);
        Preferences p = Preferences();
        await isar.writeTxn(() async => await isar.collection<User>().importJson([
          {
            "createdAt": u.createdAt.microsecondsSinceEpoch,
            "hashCode": u.hashCode,
            "id": 1,
            "lastModified": u.lastModified.microsecondsSinceEpoch,
            "name": "default user",
            "preferences": {
              "bibleStudies": 0,
              "hashCode": p.hashCode,
              "minutesPrecision": 1,
              "selectedStatistics": [],
              "showButtonLCDHours": false
            },
            "uid": ""
          }
        ]));
      }*/
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
      }
      Isar instance = await _openIsarDb();
      return instance;
    } catch (e) {
      if (kDebugMode) print('LocalDb getIsarDb. $e');
      rethrow;
    }
  }

  static Future<void> _prepopulateUser(Isar isar) async {
    try {
      final String response = await rootBundle.loadString('assets/isar_default_user.json');
      final Map<String, dynamic> data = await json.decode(response);
      await isar.writeTxn(() async => await isar.collection<User>().importJson([data]));
    } catch (e) {
      if (kDebugMode) print('LocalDb _prepopulateUser 1. $e');
      try {
        await isar.writeTxn(() async => await isar.collection<User>().importJson([
              {
                'createdAt': 1677772111063496,
                'hashCode': 348831336,
                'id': 1,
                'lastModified': 1677772111063507,
                'name': 'default user',
                'preferences': {
                  'bibleStudies': 0,
                  'hashCode': 288953517,
                  'minutesPrecision': 1,
                  'selectedStatistics':[],
                  'showButtonLCDHours': false
                },
                'uid': ''
              }
            ]));
      } catch (e) {
        if (kDebugMode) print('LocalDb _prepopulateUser 2. $e');
        throw Exception('No permission to write local storage. Default user not populated. $e');
      }
    }
  }
}

// flutter pub run build_runner build --delete-conflicting-outputs
