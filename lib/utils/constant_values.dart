import 'package:mat2414/src/data/models/models.dart';

class ConstantValues {
  ConstantValues._();

  static final DateTime _date = DateTime(1900, 1, 1, 1, 1);

  static const String appName = 'mat2414';

  /// id=-100, uid=''
  static final User emptyUser =
      User(createdAt: _date, lastModified: _date, id: -100, uid: '');

  /// id=-100, day=1, month=1, year=1900, remarks=empty activity
  static final Activity emptyActivity = Activity(
    createdAt: _date,
    lastModified: _date,
    day: 1,
    month: 1,
    serviceYear: '1900/01',
    year: 1900,
    remarks: 'empty activity',
    id: -100,
  );

  /// id=-100, month=1, year=1900, remarks=emptyReport
  static final Report emptyReport = Report(
    createdAt: _date,
    lastModified: _date,
    month: 1,
    serviceYear: '1900/01',
    year: 1900,
    remarks: 'emptyReport',
    id: -100,
  );
}
