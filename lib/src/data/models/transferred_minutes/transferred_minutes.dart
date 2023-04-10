/*
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mat2414/src/data/models/report/report.dart';

part 'transferred_minutes.g.dart';

@JsonSerializable()
@collection
class TransferredMinutes {

  final bool areLDCMinutes;
  final String comment;

  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime createdAt;
  final Id id;
  final byte minutesValue;
  final byte reportId;
  final byte reportTransferredFromMonth;
  final byte reportTransferredFromYear;
  final byte transferredToMonth;
  final byte transferredToYear;
  final String? uid;
  final transferredFromReport = IsarLink<Report>();


  /// Connect the generated [_$TransferredMinutesFromJson] function to the `fromJson` factory.
  factory TransferredMinutes.fromJson(Map<String, dynamic> json) => _$TransferredMinutesFromJson(json);

  /// Connect the generated function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TransferredMinutesToJson(this);

  // DateTime custom conversions
  // Isar db needs DateTime as DateTime.now().microsecondsSinceEpoch!
  static int _toJson(DateTime value) => value.microsecondsSinceEpoch;

  static DateTime _fromJson(int value) => DateTime.fromMicrosecondsSinceEpoch(value);
}*/
