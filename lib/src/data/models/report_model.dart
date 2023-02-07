

/*
@Entity()
class ReportModel1 extends Report1 {
  ReportModel1({
    this.dbId = 0,
    this.bibleStudies = 0,
    required this.created,
    this.day = 0,
    this.hours = 0,
    this.isClosed = false,
    this.isMonthly = false,
    required this.modified,
    this.minutes = 0,
    this.month = 0,
    this.placements = 0,
    this.remarks = '',
    this.returnVisits = 0,
    this.serviceYear = '',
    this.specialHours = 0,
    this.specialHoursDescription = '',
    this.uid,
    this.videos = 0,
    this.year = 0,
  }) : super(
            bibleStudies: bibleStudies,
            id: dbId,
            createdAt: created,
            day: day,
            hours: hours,
            isClosed: isClosed,
            isMonthly: isMonthly,
            lastModified: modified,
            minutes: minutes,
            month: month,
            placements: placements,
            remarks: remarks,
            returnVisits: returnVisits,
            serviceYear: serviceYear,
            specialHours: specialHours,
            specialHoursDescription: specialHoursDescription,
            uid: uid,
            videos: videos,
            year: year);

  @Id()
  int dbId;
  final int bibleStudies;
  @Property(type: PropertyType.date)
  final DateTime created;
  @Property(type: PropertyType.date)
  final DateTime modified;
  @Property(type: PropertyType.short)
  final int day;
  @Property(type: PropertyType.short)
  final int hours;
  final bool isClosed;
  final bool isMonthly;
  @Property(type: PropertyType.short)
  final int minutes;
  @Property(type: PropertyType.short)
  final int month;
  @Property(type: PropertyType.short)
  final int placements;
  final String remarks;
  @Property(type: PropertyType.short)
  final int returnVisits;
  final String serviceYear;
  @Property(type: PropertyType.short)
  final int specialHours;
  final String specialHoursDescription;
  final String? uid;
  @Property(type: PropertyType.short)
  final int videos;
  @Property(type: PropertyType.short)
  final int year;

  */
/*final int bibleStudies;
  final DateTime createdAt;
  final int day;
  final int hours;
  final bool isClosed;
  final bool isMonthly;
  final DateTime lastModified;
  final int minutes;
  final int month;
  final int placements;
  final String remarks;
  final int returnVisits;
  final String serviceYear;
  final int specialHours;
  final String specialHoursDescription;
  final String? uid;
  final int videos;
  final int year;*//*


  */
/*
  required super.createdAt,
    required super.day,
    required super.lastModified,
    required super.month,
    required super.year,
    super.bibleStudies,
    super.hours,
    super.id,
    super.isClosed,
    super.isMonthly,
    super.minutes,
    super.placements,
    super.remarks,
    super.returnVisits,
    super.serviceYear,
    super.specialHours,
    super.specialHoursDescription,
    super.uid,
    super.videos,
   *//*


  factory ReportModel1.fromJson(Map<String, dynamic> json) => ReportModel1(
        bibleStudies: json['bibleStudies'] as int? ?? 0,
        created: _dynamicToDateTime(json['created']),
        day: json['day'] as int,
        modified: _dynamicToDateTime(json['modified']),
        month: json['month'] as int,
        year: json['year'] as int,
        hours: json['hours'] as int? ?? 0,
        //id: json['id'] as int? ?? 0,
        isClosed: json['isClosed'] as bool? ?? false,
        isMonthly: json['isMonthly'] as bool? ?? false,
        minutes: json['minutes'] as int? ?? 0,
        placements: json['placements'] as int? ?? 0,
        remarks: json['remarks'] as String? ?? '',
        returnVisits: json['returnVisits'] as int? ?? 0,
        serviceYear: json['serviceYear'] as String? ?? '2023/2024',
        specialHours: json['specialHours'] as int? ?? 0,
        specialHoursDescription: json['specialHoursDescription'] as String? ?? '',
        uid: json['uid'] as String?,
        videos: json['videos'] as int? ?? 0,
        dbId: json['id'] as int? ?? 0,
      );

  static DateTime _dynamicToDateTime(dynamic value) {
    if (value == null || value! is String) return DateTime(0000);
    try {
      return DateTime.parse(value);
    } catch (e) {
      return DateTime(0000);
    }
  }

  Map<String, dynamic> toJson(ReportModel1 instance) => <String, dynamic>{
        'bibleStudies': instance.bibleStudies,
        'created': instance.createdAt.toIso8601String(),
        'day': instance.day,
        'modified': instance.lastModified.toIso8601String(),
        'month': instance.month,
        'year': instance.year,
        'hours': instance.hours,
        'id': instance.id,
        'isClosed': instance.isClosed,
        'isMonthly': instance.isMonthly,
        'minutes': instance.minutes,
        'placements': instance.placements,
        'remarks': instance.remarks,
        'returnVisits': instance.returnVisits,
        'serviceYear': instance.serviceYear,
        'specialHours': instance.specialHours,
        'specialHoursDescription': instance.specialHoursDescription,
        'uid': instance.uid,
        'videos': instance.videos,
      };
*/

/* ReportModel1 copyWith(
      int? bibleStudies,
      DateTime? createdAt,
      int? day,
      DateTime? lastModified,
      int? hours,
      int? id,
      bool? isClosed,
      bool? isMonthly,
      int? minutes,
      int? month,
      String? ownerId,
      int? placements,
      String? remarks,
      int? returnVisits,
      String? serviceYear,
      int? specialHours,
      String? specialHoursDescription,
      int? videos,
      int? year,
      ) {
    return ReportModel1(
      bibleStudies: bibleStudies ?? this.bibleStudies,
      createdAt: createdAt ?? this.createdAt,
      day: day ?? this.day,
      hours: hours ?? this.hours,
      id: id ?? this.id,
      isClosed: isClosed ?? this.isClosed,
      isMonthly: isMonthly ?? this.isMonthly,
      lastModified: lastModified ?? this.lastModified,
      minutes: minutes ?? this.minutes,
      month: month ?? this.month,
      placements: placements ?? this.placements,
      remarks: remarks ?? this.remarks,
      returnVisits: returnVisits ?? this.returnVisits,
      serviceYear: serviceYear ?? this.serviceYear,
      specialHours: specialHours ?? this.specialHours,
      specialHoursDescription: specialHoursDescription ?? this.specialHoursDescription,
      uid: uid ?? this.uid,
      videos: videos ?? this.videos,
      year: year ?? this.year,
    );
  }*/


/*import 'package:objectbox/objectbox.dart';

@Entity()
class ReportModel {
  ReportModel({
    this.id = 0,
    required this.createdAt,
    required this.day,
    required this.lastModified,
    required this.month,
    required this.year,
    this.bibleStudies = 0,
    this.hours = 0,
    this.isClosed = false,
    this.isMonthly = false,
    this.minutes = 0,
    this.placements = 0,
    this.remarks = '',
    this.returnVisits = 0,
    this.serviceYear = '2023/24',
    this.specialHours = 0,
    this.specialHoursDescription = '',
    this.uid,
    this.videos = 0,
  });

  @Id()
  int id;
  int bibleStudies;
  DateTime createdAt;
  int day;
  int hours;
  bool isClosed;
  bool isMonthly;
  DateTime lastModified;
  int minutes;
  int month;
  int placements;
  String remarks;
  int returnVisits;
  String serviceYear;
  int specialHours;
  String specialHoursDescription;
  String? uid;
  int videos;
  int year;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        bibleStudies: json['bibleStudies'] as int? ?? 0,
        createdAt: _dynamicToDateTime(json['createdAt']),
        day: json['day'] as int,
        lastModified: _dynamicToDateTime(json['lastModified']),
        month: json['month'] as int,
        year: json['year'] as int,
        hours: json['hours'] as int? ?? 0,
        id: json['id'] as int? ?? 0,
        isClosed: json['isClosed'] as bool? ?? false,
        isMonthly: json['isMonthly'] as bool? ?? false,
        minutes: json['minutes'] as int? ?? 0,
        placements: json['placements'] as int? ?? 0,
        remarks: json['remarks'] as String? ?? '',
        returnVisits: json['returnVisits'] as int? ?? 0,
        serviceYear: json['serviceYear'] as String? ?? '2023/2024',
        specialHours: json['specialHours'] as int? ?? 0,
        specialHoursDescription: json['specialHoursDescription'] as String? ?? '',
        uid: json['uid'] as String?,
        videos: json['videos'] as int? ?? 0,
      );

  static DateTime _dynamicToDateTime(dynamic value) {
    if (value == null || value! is String) return DateTime(0000);
    try {
      return DateTime.parse(value);
    } catch (e) {
      return DateTime(0000);
    }
  }

  Map<String, dynamic> toJson(ReportModel instance) => <String, dynamic>{
        'bibleStudies': instance.bibleStudies,
        'createdAt': instance.createdAt.toIso8601String(),
        'day': instance.day,
        'lastModified': instance.lastModified.toIso8601String(),
        'month': instance.month,
        'year': instance.year,
        'hours': instance.hours,
        'id': instance.id,
        'isClosed': instance.isClosed,
        'isMonthly': instance.isMonthly,
        'minutes': instance.minutes,
        'placements': instance.placements,
        'remarks': instance.remarks,
        'returnVisits': instance.returnVisits,
        'serviceYear': instance.serviceYear,
        'specialHours': instance.specialHours,
        'specialHoursDescription': instance.specialHoursDescription,
        'uid': instance.uid,
        'videos': instance.videos,
      };

  ReportModel copyWith(
    int? bibleStudies,
    DateTime? createdAt,
    int? day,
    DateTime? lastModified,
    int? hours,
    int? id,
    bool? isClosed,
    bool? isMonthly,
    int? minutes,
    int? month,
    String? ownerId,
    int? placements,
    String? remarks,
    int? returnVisits,
    String? serviceYear,
    int? specialHours,
    String? specialHoursDescription,
    int? videos,
    int? year,
  ) {
    return ReportModel(
      bibleStudies: bibleStudies ?? this.bibleStudies,
      createdAt: createdAt ?? this.createdAt,
      day: day ?? this.day,
      hours: hours ?? this.hours,
      id: id ?? this.id,
      isClosed: isClosed ?? this.isClosed,
      isMonthly: isMonthly ?? this.isMonthly,
      lastModified: lastModified ?? this.lastModified,
      minutes: minutes ?? this.minutes,
      month: month ?? this.month,
      placements: placements ?? this.placements,
      remarks: remarks ?? this.remarks,
      returnVisits: returnVisits ?? this.returnVisits,
      serviceYear: serviceYear ?? this.serviceYear,
      specialHours: specialHours ?? this.specialHours,
      specialHoursDescription: specialHoursDescription ?? this.specialHoursDescription,
      uid: uid ?? this.uid,
      videos: videos ?? this.videos,
      year: year ?? this.year,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportModel &&
            other.bibleStudies == bibleStudies &&
            other.createdAt == createdAt &&
            other.day == day &&
            other.hours == hours &&
            other.id == id &&
            other.isClosed == isClosed &&
            other.isMonthly == isMonthly &&
            other.lastModified == lastModified &&
            other.minutes == minutes &&
            other.month == month &&
            other.placements == placements &&
            other.remarks == remarks &&
            other.returnVisits == returnVisits &&
            other.serviceYear == serviceYear &&
            other.specialHours == specialHours &&
            other.specialHoursDescription == specialHoursDescription &&
            other.uid == uid &&
            other.videos == videos &&
            other.year == year);
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bibleStudies,
      createdAt,
      day,
      hours,
      id,
      isClosed,
      isMonthly,
      lastModified,
      minutes,
      month,
      placements,
      remarks,
      returnVisits,
      serviceYear,
      specialHours,
      specialHoursDescription,
      uid,
      videos,
      year);

  @override
  String toString() {
    return '''
    MonthReport(bibleStudies: $bibleStudies, createdAt: $createdAt, day: $day, lastModified: $lastModified, 
    month: $month, year: $year, hours: $hours, id: $id, isClosed: $isClosed, isMonthly: $isMonthly, 
    minutes: $minutes, placements: $placements, remarks: $remarks, returnVisits: $returnVisits, 
    serviceYear: $serviceYear, specialHours: $specialHours, specialHoursDescription: $specialHoursDescription, 
    uid: $uid, videos: $videos)''';
  }
}*/
