import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
@collection
class Activity {
  const Activity({
    required this.createdAt,
    required this.day,
    required this.lastModified,
    required this.month,
    required this.serviceYear,
    required this.year,
    this.bibleStudies = 0,
    this.hours = 0,
    this.id = Isar.autoIncrement,
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
    this.isLCDHours = false,
    this.uid,
    this.videos = 0,
  });

  final byte bibleStudies;
  final DateTime createdAt;
  final byte day; // byte 0 to 255
  final byte hours;
  final Id id;
  final bool isBusinessTerritoryWitnessing;
  final bool isEveningWitnessing;
  final bool isInformalWitnessing;
  final bool isPublicWitnessing;
  final bool isSundayWitnessing;
  final bool isWithFieldServiceGroupWitnessing;
  final DateTime lastModified;
  final byte minutes;
  final byte month;
  final byte placements;
  final String remarks; // max. 150 characters!
  final byte returnVisits;
  final String serviceYear;
  final bool isLCDHours;
  final String? uid;

  final byte videos;

  @Index(composite: [
    CompositeIndex('month', type: IndexType.value),
    CompositeIndex('day', type: IndexType.value)
  ], type: IndexType.value)
  final short year;

  Activity copyWith({
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
    bool? isLCDHours,
    String? uid,
    int? videos,
    int? year,
  }) {
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
      isLCDHours: isLCDHours ?? this.isLCDHours,
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
            other.isLCDHours == isLCDHours &&
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
        isLCDHours,
        videos
      ]);

  @override
  String toString() {
    return 'Activity(createdAt: $createdAt, day: $day, lastModified: $lastModified, month: $month, year: $year, bibleStudies: $bibleStudies, hours: $hours, id: $id, isBusinessTerritoryWitnessing: $isBusinessTerritoryWitnessing, isEveningWitnessing: $isEveningWitnessing, isInformalWitnessing: $isInformalWitnessing, isPublicWitnessing: $isPublicWitnessing, isSundayWitnessing: $isSundayWitnessing, isWithFieldServiceGroupWitnessing: $isWithFieldServiceGroupWitnessing, minutes: $minutes, uid: $uid, placements: $placements, remarks: $remarks, returnVisits: $returnVisits, serviceYear: $serviceYear, specialHours: $isLCDHours, videos: $videos)';
  }
}
