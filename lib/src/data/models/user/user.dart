import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@collection
class User {
  const User(
      {required this.createdAt,
      this.id = Isar.autoIncrement,
      required this.lastModified,
      this.name = 'default user',
      this.preferences = const Preferences(),
      this.uid = ''});

  final Id id;
  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime createdAt; // {"createdAt":1672531200000000,} User(createdAt: 2023-01-01 00:00:00.000,)
  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime lastModified;
  @Index(unique: true, replace: true)
  final String name;
  final Preferences preferences;
  final String uid;

  User copyWith(
    DateTime? createdAt,
    int? id,
    DateTime? lastModified,
    String? name,
    Preferences? preferences,
    String? uid,
  ) {
    return User(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      name: name ?? this.name,
      lastModified: lastModified ?? this.lastModified,
      preferences: preferences ?? this.preferences,
      uid: uid ?? this.uid,
    );
  }

  /// Connect the generated [_$UserFromJson] function to the `fromJson` factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // DateTime custom conversions
  // Isar db needs DateTime as DateTime.now().microsecondsSinceEpoch!
  static int _toJson(DateTime value) => value.microsecondsSinceEpoch;
  static DateTime _fromJson(int value) =>
      DateTime.fromMicrosecondsSinceEpoch(value);

  @override
  String toString() {
    return 'User(createdAt: $createdAt, id: $id, lastModified: $lastModified, name: $name, preferences: $preferences, uid: $uid';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.lastModified, lastModified) || other.lastModified == lastModified) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.preferences, preferences) || other.preferences == preferences) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, lastModified, preferences, id, uid, name);
}

@JsonSerializable()
@embedded
class Preferences {
  const Preferences({
    this.bibleStudies = 0,
    this.minutesPrecision = MinutesPrecision.five,
    this.selectedStatistics = const<byte>[],
    this.showButtonLCDHours = false,
  });

  /// 0 - 255. saved number of bible studies - inserted by default into the monthly report
  final byte bibleStudies;

  @enumerated
  final MinutesPrecision minutesPrecision;

  final List<byte> selectedStatistics;

  /// if true LCD hours button will appears in add new activity form
  final bool showButtonLCDHours;


  Preferences copyWith(
      int? bibleStudies, MinutesPrecision? minutesPrecision, List<byte>? selectedStatistics, bool? showButtonLCDHours) {
    return Preferences(
      bibleStudies: bibleStudies ?? this.bibleStudies,
      minutesPrecision: minutesPrecision ?? this.minutesPrecision,
      selectedStatistics: selectedStatistics ?? this.selectedStatistics,
      showButtonLCDHours: showButtonLCDHours ?? this.showButtonLCDHours,
    );
  }

  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  String toString() {
    return 'Preferences(bibleStudies: $bibleStudies, minutesPrecision: $minutesPrecision, selectedStatistics: $selectedStatistics, showButtonLCDHours: $showButtonLCDHours';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Preferences &&
            (identical(other.bibleStudies, bibleStudies) || other.bibleStudies == bibleStudies) &&
            (identical(other.minutesPrecision, minutesPrecision) ||
                other.minutesPrecision == minutesPrecision) &&
            (identical(other.selectedStatistics, selectedStatistics) ||
                other.selectedStatistics == selectedStatistics) &&
            (identical(other.showButtonLCDHours, showButtonLCDHours) ||
                other.showButtonLCDHours == showButtonLCDHours));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bibleStudies, minutesPrecision, selectedStatistics, showButtonLCDHours);
}

@JsonEnum(alwaysCreate: true)
enum MinutesPrecision {
  @JsonValue(0)
  one,
  @JsonValue(1)
  five,
  @JsonValue(2)
  ten,
  @JsonValue(3)
  fifteen,
  @JsonValue(4)
  thirty,
}
