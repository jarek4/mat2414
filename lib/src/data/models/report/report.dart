import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
@collection
class Report {
  const Report({
    required this.createdAt,
    required this.lastModified,
    required this.month,
    required this.serviceYear,
    required this.year,
    this.bibleStudies = 0,
    this.businessTerritoryWitnessingHours = 0,
    this.businessTerritoryWitnessingQuantity = 0,
    this.eveningWitnessingHours = 0,
    this.eveningWitnessingQuantity = 0,
    this.id = Isar.autoIncrement,
    this.informalWitnessingHours = 0,
    this.informalWitnessingQuantity = 0,
    this.durationInMinutes = 0,
    this.isClosed = false,
    this.placements = 0,
    this.publicWitnessingHours = 0,
    this.publicWitnessingQuantity = 0,
    this.remarks = '',
    this.returnVisits = 0,
    this.minutesLDC = 0,
    this.sundayWitnessingHours = 0,
    this.sundayWitnessingQuantity = 0,
    this.transferredMinutes = 0,
    this.transferredMinutesActivityId = -1,
    this.uid = '',
    this.withFieldServiceGroupWitnessingHours = 0,
    this.withFieldServiceGroupWitnessingQuantity = 0,
    this.videos = 0,
  });

  final Id id;

  final short bibleStudies;

  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime createdAt;

  final short businessTerritoryWitnessingHours;

  final short businessTerritoryWitnessingQuantity;

  final short eveningWitnessingHours;

  final short eveningWitnessingQuantity;

  final short durationInMinutes;

  final short informalWitnessingHours;

  final short informalWitnessingQuantity;
  final bool isClosed;

  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime lastModified;

  final byte month;

  final short placements;

  final short publicWitnessingHours;

  final short publicWitnessingQuantity;

  /// max length 650
  final String remarks;

  final short returnVisits;
  final String serviceYear;
  final short minutesLDC;

  final short sundayWitnessingHours;

  final short sundayWitnessingQuantity;

  final byte transferredMinutes;

  /// -1 is like a null
  final int transferredMinutesActivityId;

  final String uid;

  final short withFieldServiceGroupWitnessingHours;

  final short withFieldServiceGroupWitnessingQuantity;

  final short videos;

  @Index(composite: [
    CompositeIndex('month', type: IndexType.value),
    CompositeIndex('serviceYear', type: IndexType.value)
  ], type: IndexType.value)
  final short year;

  Report copyWith({
    int? bibleStudies,
    DateTime? createdAt,
    int? businessTerritoryWitnessingHours,
    int? businessTerritoryWitnessingQuantity,
    int? eveningWitnessingHours,
    int? eveningWitnessingQuantity,
    int? id,
    int? informalWitnessingHours,
    int? informalWitnessingQuantity,
    bool? isClosed,
    DateTime? lastModified,
    int? durationInMinutes,
    int? month,
    int? placements,
    int? publicWitnessingHours,
    int? publicWitnessingQuantity,
    String? remarks,
    int? returnVisits,
    String? serviceYear,
    int? minutesLDC,
    int? sundayWitnessingHours,
    int? sundayWitnessingQuantity,
    int? transferredMinutes,
    int? transferredMinutesActivityId,
    String? uid,
    int? withFieldServiceGroupWitnessingHours,
    int? withFieldServiceGroupWitnessingQuantity,
    int? videos,
    int? year,
  }) {
    return Report(
      bibleStudies: bibleStudies ?? this.bibleStudies,
      createdAt: createdAt ?? this.createdAt,
      businessTerritoryWitnessingHours:
          businessTerritoryWitnessingHours ?? this.businessTerritoryWitnessingHours,
      businessTerritoryWitnessingQuantity:
          businessTerritoryWitnessingQuantity ?? this.businessTerritoryWitnessingQuantity,
      eveningWitnessingHours: eveningWitnessingHours ?? this.eveningWitnessingHours,
      eveningWitnessingQuantity: eveningWitnessingQuantity ?? this.eveningWitnessingQuantity,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      id: id ?? this.id,
      informalWitnessingHours: informalWitnessingHours ?? this.informalWitnessingHours,
      informalWitnessingQuantity: informalWitnessingQuantity ?? this.informalWitnessingQuantity,
      isClosed: isClosed ?? this.isClosed,
      lastModified: lastModified ?? this.lastModified,
      month: month ?? this.month,
      placements: placements ?? this.placements,
      publicWitnessingHours: publicWitnessingHours ?? this.publicWitnessingHours,
      publicWitnessingQuantity: publicWitnessingQuantity ?? this.publicWitnessingQuantity,
      remarks: remarks ?? this.remarks,
      returnVisits: returnVisits ?? this.returnVisits,
      serviceYear: serviceYear ?? this.serviceYear,
      minutesLDC: minutesLDC ?? this.minutesLDC,
      sundayWitnessingHours: sundayWitnessingHours ?? this.sundayWitnessingHours,
      sundayWitnessingQuantity: sundayWitnessingQuantity ?? this.sundayWitnessingQuantity,
      transferredMinutes: transferredMinutes ?? this.transferredMinutes,
      transferredMinutesActivityId:
          transferredMinutesActivityId ?? this.transferredMinutesActivityId,
      uid: uid ?? this.uid,
      withFieldServiceGroupWitnessingHours:
          withFieldServiceGroupWitnessingHours ?? this.withFieldServiceGroupWitnessingHours,
      withFieldServiceGroupWitnessingQuantity:
          withFieldServiceGroupWitnessingQuantity ?? this.withFieldServiceGroupWitnessingQuantity,
      videos: videos ?? this.videos,
      year: year ?? this.year,
    );
  }

  /// Connect the generated [_$ReportFromJson] function to the `fromJson` factory.
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  /// Connect the generated function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReportToJson(this);

  // DateTime custom conversions
  // Isar db needs DateTime as DateTime.now().microsecondsSinceEpoch!
  static int _toJson(DateTime value) => value.microsecondsSinceEpoch;

  static DateTime _fromJson(int value) => DateTime.fromMicrosecondsSinceEpoch(value);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Report &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.lastModified, lastModified) || other.lastModified == lastModified) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.serviceYear, serviceYear) || other.serviceYear == serviceYear) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.bibleStudies, bibleStudies) || other.bibleStudies == bibleStudies) &&
            (identical(other.businessTerritoryWitnessingHours, businessTerritoryWitnessingHours) ||
                other.businessTerritoryWitnessingHours == businessTerritoryWitnessingHours) &&
            (identical(other.businessTerritoryWitnessingQuantity,
                    businessTerritoryWitnessingQuantity) ||
                other.businessTerritoryWitnessingQuantity == businessTerritoryWitnessingQuantity) &&
            (identical(other.eveningWitnessingHours, eveningWitnessingHours) ||
                other.eveningWitnessingHours == eveningWitnessingHours) &&
            (identical(other.eveningWitnessingQuantity, eveningWitnessingQuantity) ||
                other.eveningWitnessingQuantity == eveningWitnessingQuantity) &&
            (identical(other.informalWitnessingHours, informalWitnessingHours) ||
                other.informalWitnessingHours == informalWitnessingHours) &&
            (identical(other.informalWitnessingQuantity, informalWitnessingQuantity) ||
                other.informalWitnessingQuantity == informalWitnessingQuantity) &&
            (identical(other.durationInMinutes, durationInMinutes) || other.durationInMinutes == durationInMinutes) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isClosed, isClosed) || other.isClosed == isClosed) &&
            (identical(other.withFieldServiceGroupWitnessingHours,
                    withFieldServiceGroupWitnessingHours) ||
                other.withFieldServiceGroupWitnessingHours ==
                    withFieldServiceGroupWitnessingHours) &&
            (identical(other.withFieldServiceGroupWitnessingQuantity,
                    withFieldServiceGroupWitnessingQuantity) ||
                other.withFieldServiceGroupWitnessingQuantity ==
                    withFieldServiceGroupWitnessingQuantity) &&
            (identical(other.placements, placements) || other.placements == placements) &&
            (identical(other.publicWitnessingHours, publicWitnessingHours) ||
                other.publicWitnessingHours == publicWitnessingHours) &&
            (identical(other.publicWitnessingQuantity, publicWitnessingQuantity) ||
                other.publicWitnessingQuantity == publicWitnessingQuantity) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.returnVisits, returnVisits) || other.returnVisits == returnVisits) &&
            (identical(other.minutesLDC, minutesLDC) || other.minutesLDC == minutesLDC) &&
            (identical(other.sundayWitnessingHours, sundayWitnessingHours) ||
                other.sundayWitnessingHours == sundayWitnessingHours) &&
            (identical(other.sundayWitnessingQuantity, sundayWitnessingQuantity) ||
                other.sundayWitnessingQuantity == sundayWitnessingQuantity) &&
            (identical(other.videos, videos) || other.videos == videos) &&
            (identical(other.transferredMinutes, transferredMinutes) ||
                other.transferredMinutes == transferredMinutes) &&
            (identical(other.transferredMinutesActivityId, transferredMinutesActivityId) ||
                other.transferredMinutesActivityId == transferredMinutesActivityId) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        lastModified,
        month,
        serviceYear,
        year,
        bibleStudies,
        businessTerritoryWitnessingHours,
        businessTerritoryWitnessingQuantity,
        eveningWitnessingHours,
        eveningWitnessingQuantity,
        informalWitnessingHours,
        informalWitnessingQuantity,
        durationInMinutes,
        id,
        isClosed,
        withFieldServiceGroupWitnessingHours,
        withFieldServiceGroupWitnessingQuantity,
        placements,
        publicWitnessingHours,
        publicWitnessingQuantity,
        remarks,
        returnVisits,
        minutesLDC,
        sundayWitnessingHours,
        sundayWitnessingQuantity,
        videos,
        transferredMinutes,
        transferredMinutesActivityId,
        uid
      ]);

  @override
  String toString() {
    return 'Report(id: $id, createdAt: $createdAt, lastModified: $lastModified, month: $month, serviceYear: $serviceYear, year: $year, bibleStudies: $bibleStudies, businessTerritoryWitnessingHours: $businessTerritoryWitnessingHours, businessTerritoryWitnessingQuantity: $businessTerritoryWitnessingQuantity, eveningWitnessingHours: $eveningWitnessingHours, eveningWitnessingQuantity: $eveningWitnessingQuantity, informalWitnessingHours: $informalWitnessingHours, informalWitnessingQuantity: $informalWitnessingQuantity, durationInMinutes: $durationInMinutes, isClosed: $isClosed, withFieldServiceGroupWitnessingHours: $withFieldServiceGroupWitnessingHours, withFieldServiceGroupWitnessingQuantity: $withFieldServiceGroupWitnessingQuantity, placements: $placements, publicWitnessingHours: $publicWitnessingHours, publicWitnessingQuantity: $publicWitnessingQuantity, remarks: $remarks, returnVisits: $returnVisits, minutesLDC: $minutesLDC, sundayWitnessingHours: $sundayWitnessingHours, sundayWitnessingQuantity: $sundayWitnessingQuantity, videos: $videos, transferredMinutes: $transferredMinutes, transferredMinutesActivityId: $transferredMinutesActivityId,  uid: $uid)';
  }
}
