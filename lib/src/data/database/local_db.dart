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
        DateTime dateT = DateTime.now();
        Preferences p = const Preferences();
        User u = User(createdAt: dateT, lastModified: dateT, id: 1, preferences: p);
        await isar.writeTxn(() async => await isar.collection<User>().importJson([
          {
            "avatarIndex": 0,
            "createdAt": u.createdAt.microsecondsSinceEpoch,
            "displayedRatingRequestsNo": 0,
            "hashCode": u.hashCode,
            "haveRatedTheApp": false,
            "id": 1,
            "isOnboardingPassed": false,
            "languageCode": "",
            "lastModified": u.lastModified.microsecondsSinceEpoch,
            "name": "default user",
            "nextRateRequestDate": null,
            "preferences": {
              "annualHourGoal": 0,
              "bibleStudies": 0,
              "firstWeekDay": 0,
              "descriptionLDC": "",
              "hashCode": p.hashCode,
              "minutesPrecision": 1,
              "monthlyHourGoal": 0,
              "selectedStatistics": [],
              "showButtonLDCHours": false,
              "showTips": true,
              "themeMode": 0
            },
            "uid": "defaultUserUid",
            "token": ""
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
        await isar
            .writeTxn(() async => await isar.collection<User>().importJson([_defaultUserAsMap]));
      } catch (e) {
        if (kDebugMode) print('LocalDb _prepopulateUser 2. $e');
        throw Exception('No permission to write local storage. Default user not populated. $e');
      }
    }
  }

  static final Map<String, dynamic> _defaultUserAsMap = {
    'avatarIndex': 0,
    'createdAt':1680767755777587,
    'displayedRatingRequestsNo': 0,
    'hashCode':846855,
    'haveRatedTheApp': false,
    'id': 1,
    'isOnboardingPassed': false,
    'languageCode': '',
    'lastModified': 1680767755777587,
    'name': 'default user',
    'nextRateRequestDate': null,
    'preferences': {
      'annualHourGoal': 0,
      'bibleStudies': 0,
      'descriptionLDC': '',
      'firstWeekDay': 0,
      'hashCode': 524385371,
      'minutesPrecision': 1,
      'monthlyHourGoal': 0,
      'selectedStatistics': [],
      'showButtonLDCHours': false,
      'showTips': true,
      'themeMode': 0
    },
    'token': '',
    'uid': 'defaultUserUid'
  };
}

class LocalDbClassForTesting {
  Future<Isar> callStaticMethodGetIsarDb() {
    return LocalDb.getIsarDb();
  }
/*  Future<Isar> callStaticMethodGetIsarDb({@visibleForTesting dynamic localDbClassForTesting}) {
  if (localDbClassForTesting != null && localDbClassForTesting is LocalDb) {
    localDbClassForTesting
    return localDbClassForTesting.getIsarDb();
  } else {
    return LocalDb.getIsarDb();
  }
}*/
}

// flutter pub run build_runner build --delete-conflicting-outputs
