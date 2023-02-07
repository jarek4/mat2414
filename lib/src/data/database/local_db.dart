import 'dart:io';

import 'package:isar/isar.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:path_provider/path_provider.dart';



class LocalDb {

  // Future<Directory> getDir() async => await getApplicationDocumentsDirectory();


  static Future<Isar>  getDb() async {
    print('LocalDb getDb');
    Directory dir = await getApplicationDocumentsDirectory();
    return await Isar.open([UserSchema], directory: dir.path);
  }

  // final ReportModel1 rm1 = ReportModel1(
  //     day: 1,
  //     month: 4,
  //     year: 2022,
  //     created: DateTime(2001),
  //     modified: DateTime(2000),
  //     hours: 2,
  //     placements: 7,
  //     serviceYear: '2022/23',
  //     specialHoursDescription: 'rm1');
  // final ReportModel1 rm2 = ReportModel1(
  //     day: 6,
  //     month: 2,
  //     year: 2022,
  //     created: DateTime(2001),
  //     modified: DateTime(2000),
  //     hours: 1,
  //     placements: 1,
  //     serviceYear: '2022/23',
  //     specialHoursDescription: 'rm2');
  //
  // final ReportModel1 rm3 = ReportModel1(
  //     day: 6,
  //     month: 2,
  //     year: 2022,
  //     created: DateTime(2001),
  //     modified: DateTime(2000),
  //     hours: 6,
  //     placements: 7,
  //     serviceYear: '2022/23',
  //     specialHoursDescription: 'rm3');


    //mrb.removeAll();
    // mrb.removeAll();
    // final int idAb3 = mrb.put(rm1);
    //  print('LocalDb _create idAb3: $idAb3');
    // final int idAb4 = ab.put(Activity(
    //     createdAt: DateTime(2000), day: 2, lastModified: DateTime(2000), month: 2, year: 2022));
    // print('LocalDb _create idAb3: $idAb3; idAb4: $idAb4');
    // final int idMrb = mrb.put(Report1(
    //     createdAt: DateTime.now(), day: 8, lastModified: DateTime(2023), month: 7, year: 2023));
    // print('LocalDb _create idMrb: $idMrb');
    // print('LocalDb _create idAb: $idAb; idMrb: $idMrb');
    // print('-- - LocalDb _create ab.isEmpty():${ab.isEmpty()}, mrb.isEmpty():${mrb.isEmpty()}');
    // print('LocalDb _create idAb3: ${mrb.getAll().last}');
  }

// flutter pub run build_runner build --delete-conflicting-outputs
