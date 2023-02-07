import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
@collection
class Activity {
  Activity({
    this.id = 0,
    required this.createdAt,
    required this.day,
    required this.lastModified,
    required this.month,
    required this.serviceYear,
    required this.year,
    this.bibleStudies = 0,
    this.hours = 0,
    this.isBusinessTerritoryWitnessing = false,
    this.isEveningWitnessing = false,
    this.isInformalWitnessing = false,
    this.isPublicWitnessing = false,
    this.isSundayWitnessing = false,
    this.isWithFieldServiceGroupWitnessing = false,
    this.minutes = 0,
    this.placements = 0,
    this.remarks = '',
    this.returnVisits = 0,
    this.specialHours = 0,
    this.specialHoursDescription = '',
    this.uid,
    this.videos = 0,
  });


  final int bibleStudies;
  final DateTime createdAt;
  final int day;
  final int hours;
  Id id = Isar.autoIncrement;
  final bool isBusinessTerritoryWitnessing;
  final bool isEveningWitnessing;
  final bool isInformalWitnessing;
  final bool isPublicWitnessing;
  final bool isSundayWitnessing;
  final bool isWithFieldServiceGroupWitnessing;

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

  final int year;

  Activity copyWith(
    int? bibleStudies,
    DateTime? createdAt,
    int? day,
    int? hours,
    int? id,
    bool? isBusinessTerritoryWitnessing,
    bool? isEveningWitnessing,
    bool? isInformalWitnessing,
    bool? isPublicWitnessing,
    bool? isSundayWitnessing,
    bool? isWithFieldServiceGroupWitnessing,
    DateTime? lastModified,
    int? minutes,
    int? month,
    int? placements,
    String? remarks,
    int? returnVisits,
    String? serviceYear,
    int? specialHours,
    String? specialHoursDescription,
    String? uid,
    int? videos,
    int? year,
  ) {
    return Activity(
      bibleStudies: bibleStudies ?? this.bibleStudies,
      createdAt: createdAt ?? this.createdAt,
      day: day ?? this.day,
      hours: hours ?? this.hours,
      id: id ?? this.id,
      isBusinessTerritoryWitnessing:
          isBusinessTerritoryWitnessing ?? this.isBusinessTerritoryWitnessing,
      isEveningWitnessing: isEveningWitnessing ?? this.isEveningWitnessing,
      isInformalWitnessing: isInformalWitnessing ?? this.isInformalWitnessing,
      isPublicWitnessing: isPublicWitnessing ?? this.isPublicWitnessing,
      isSundayWitnessing: isSundayWitnessing ?? this.isSundayWitnessing,
      isWithFieldServiceGroupWitnessing:
          isWithFieldServiceGroupWitnessing ?? this.isWithFieldServiceGroupWitnessing,
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

  /// Connect the generated [_$ActivityFromJson] function to the `fromJson` factory.
  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  /// Connect the generated function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Activity &&
            other.bibleStudies == bibleStudies &&
            other.createdAt == createdAt &&
            other.day == day &&
            other.hours == hours &&
            other.id == id &&
            other.isBusinessTerritoryWitnessing == isBusinessTerritoryWitnessing &&
            other.isEveningWitnessing == isEveningWitnessing &&
            other.isInformalWitnessing == isInformalWitnessing &&
            other.isPublicWitnessing == isPublicWitnessing &&
            other.isSundayWitnessing == isSundayWitnessing &&
            other.isWithFieldServiceGroupWitnessing == isWithFieldServiceGroupWitnessing &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        day,
        lastModified,
        month,
        year,
        bibleStudies,
        hours,
        id,
        isBusinessTerritoryWitnessing,
        isEveningWitnessing,
        isInformalWitnessing,
        isPublicWitnessing,
        isSundayWitnessing,
        isWithFieldServiceGroupWitnessing,
        minutes,
        uid,
        placements,
        remarks,
        returnVisits,
        serviceYear,
        specialHours,
        specialHoursDescription,
        videos
      ]);

  @override
  String toString() {
    return 'Activity(createdAt: $createdAt, day: $day, lastModified: $lastModified, month: $month, year: $year, bibleStudies: $bibleStudies, hours: $hours, id: $id, isBusinessTerritoryWitnessing: $isBusinessTerritoryWitnessing, isEveningWitnessing: $isEveningWitnessing, isInformalWitnessing: $isInformalWitnessing, isPublicWitnessing: $isPublicWitnessing, isSundayWitnessing: $isSundayWitnessing, isWithFieldServiceGroupWitnessing: $isWithFieldServiceGroupWitnessing, minutes: $minutes, uid: $uid, placements: $placements, remarks: $remarks, returnVisits: $returnVisits, serviceYear: $serviceYear, specialHours: $specialHours, specialHoursDescription: $specialHoursDescription, videos: $videos)';
  }
}

/*

  Activity fromJson(Map<String, dynamic> json) => Activity(
        bibleStudies: json['bibleStudies'] as int? ?? 0,
        createdAt: DateTime.parse(json['createdAt'] as String),
        day: json['day'] as int,
        hours: json['hours'] as int? ?? 0,
        id: json['id'] as int? ?? 0,
        isBusinessTerritoryWitnessing: json['isBusinessTerritoryWitnessing'] as bool? ?? false,
        isEveningWitnessing: json['isEveningWitnessing'] as bool? ?? false,
        isInformalWitnessing: json['isInformalWitnessing'] as bool? ?? false,
        isPublicWitnessing: json['isPublicWitnessing'] as bool? ?? false,
        isSundayWitnessing: json['isSundayWitnessing'] as bool? ?? false,
        isWithFieldServiceGroupWitnessing:
            json['isWithFieldServiceGroupWitnessing'] as bool? ?? false,
        lastModified: DateTime.parse(json['lastModified'] as String),
        minutes: json['minutes'] as int? ?? 0,
        month: json['month'] as int,
        placements: json['placements'] as int? ?? 0,
        remarks: json['remarks'] as String? ?? '',
        returnVisits: json['returnVisits'] as int? ?? 0,
        serviceYear: json['serviceYear'] as String? ?? '2023/2024',
        specialHours: json['specialHours'] as int? ?? 0,
        specialHoursDescription: json['specialHoursDescription'] as String? ?? '',
        uid: json['uid'] as String?,
        videos: json['videos'] as int? ?? 0,
        year: json['year'] as int,
      );

  Map<String, dynamic> toJson(Activity instance) => <String, dynamic>{
        'bibleStudies': instance.bibleStudies,
        'createdAt': instance.createdAt.toIso8601String(),
        'day': instance.day,
        'hours': instance.hours,
        'id': instance.id,
        'isBusinessTerritoryWitnessing': instance.isBusinessTerritoryWitnessing,
        'isEveningWitnessing': instance.isEveningWitnessing,
        'isInformalWitnessing': instance.isInformalWitnessing,
        'isPublicWitnessing': instance.isPublicWitnessing,
        'isSundayWitnessing': instance.isSundayWitnessing,
        'isWithFieldServiceGroupWitnessing': instance.isWithFieldServiceGroupWitnessing,
        'lastModified': instance.lastModified.toIso8601String(),
        'minutes': instance.minutes,
        'month': instance.month,
        'placements': instance.placements,
        'remarks': instance.remarks,
        'returnVisits': instance.returnVisits,
        'serviceYear': instance.serviceYear,
        'specialHours': instance.specialHours,
        'specialHoursDescription': instance.specialHoursDescription,
        'uid': instance.uid,
        'videos': instance.videos,
        'year': instance.year,
      };


@override
  bool operator ==(Object other) {
    if (other is Activity) {
      if (other.createdAt != createdAt ||
          other.day != day ||
          other.lastModified != lastModified ||
          other.hours != hours ||
          other.id != id ||
          other.minutes != minutes ||
          other.month != month ||
          other.placements != placements ||
          other.remarks != remarks ||
          other.returnVisits != returnVisits ||
          other.serviceYear != serviceYear ||
          other.specialHours != specialHours ||
          other.specialHoursDescription != specialHoursDescription ||
          other.uid != uid ||
          other.videos != videos ||
          other.year != year) {
        return false;
      }

      return true;
    }
    return false;
  }*/

/*@Entity()
class Activity {
  Activity({
    this.id = 0,
    required this.createdAt,
    required this.day,
    required this.lastModified,
    required this.month,
    required this.year,
    this.hours = 0,
    this.minutes = 0,
    this.placements = 0,
    this.remarks = '',
    this.returnVisits = 0,
    this.serviceYear = '2023/24',
    this.specialHours = 0,
    this.specialHoursDescription = '',
    this.videos = 0,
  });

  @Id()
  int id;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.short)
  int day;

  @Property(type: PropertyType.date)
  DateTime lastModified;

  @Property(type: PropertyType.short)
  int month;

  @Property(type: PropertyType.short)
  int year;

  @Property(type: PropertyType.short)
  int hours;

  @Property(type: PropertyType.short)
  int minutes;

  @Property(type: PropertyType.short)
  int placements;

  String remarks;

  @Property(type: PropertyType.short)
  int returnVisits;

  String serviceYear;

  @Property(type: PropertyType.short)
  int specialHours;

  String specialHoursDescription;

  @Property(type: PropertyType.short)
  int videos;
}*/
/*const factory ActivityModel({
   required DateTime createdAt,
    required int day,
    required DateTime lastModified,
    required int month,
    required int year,
    @Default(0) int hours,
    @Default(0) int id,
    @Default(0) int minutes,
    @Default('') String ownerId,
    @Default(0) int placements,
    @Default('') String remarks,
    @Default(0) int returnVisits,
    @Default('2000/2001') String serviceYear,
    @Default(0) int specialHours,
    @Default('') String specialHoursDescription,
    @Default(0) int videos,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json)
  => _$ActivityFromJson(json);*/

/*
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {

  const factory Activity({
   required DateTime createdAt,
    required int day,
    required DateTime lastModified,
    required int month,
    required int year,
    @Default(0) int hours,
    @Default(0) int id,
    @Default(0) int minutes,
    @Default('') String ownerId,
    @Default(0) int placements,
    @Default('') String remarks,
    @Default(0) int returnVisits,
    @Default('2000/2001') String serviceYear,
    @Default(0) int specialHours,
    @Default('') String specialHoursDescription,
    @Default(0) int videos,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json)
  => _$ActivityFromJson(json);
}

 @Entity(realClass: Activity)
  factory Activity({
    @Property(type: PropertyType.date) required final DateTime createdAt,
    @Property(type: PropertyType.short) required final int day,
    @Property(type: PropertyType.date) required final DateTime lastModified,
    required final int month,
    required final int year,
    @Property(type: PropertyType.short) @Default(0) final int hours,
    @Id() @Default(0) int id,
    @Property(type: PropertyType.short) @Default(0) final int minutes,
    @Property(type: PropertyType.short) @Default(0) final int placements,
    @Default('') final String remarks,
    @Property(type: PropertyType.short) @Default(0) final int returnVisits,
    @Default('2023/2024') final String serviceYear,
    @Property(type: PropertyType.short) @Default(0) final int specialHours,
    @Default('') final String specialHoursDescription,
    @Unique(onConflict: ConflictStrategy.replace) @Default(null) String? uid,
    @Property(type: PropertyType.short) @Default(0) final int videos,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) => _$ActivityFromJson(json);
 */
