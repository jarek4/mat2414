import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@collection
class User {
  const User({
    required this.createdAt,
    required this.lastModified,
    this.avatarIndex = 0,
    this.id = Isar.autoIncrement,
    this.languageCode = '',
    this.name = 'default user',
    this.preferences = const Preferences(),
    this.token = '',
    this.uid = 'defaultUserUid',
  });

  final byte avatarIndex;
  final Id id;
  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime
      createdAt; // {"createdAt":1672531200000000,} User(createdAt: 2023-01-01 00:00:00.000,)
  @JsonKey(
    toJson: _toJson,
    fromJson: _fromJson,
  )
  final DateTime lastModified;
  final String languageCode; // empty String represents null - for system settings
  @Index(unique: true, replace: true)
  final String name;
  final Preferences preferences;
  final String token;
  final String uid;

  User copyWith({
    int? avatarIndex,
    DateTime? createdAt,
    int? id,
    String? languageCode,
    DateTime? lastModified,
    String? name,
    Preferences? preferences,
    String? token,
    String? uid,
  }) {
    return User(
      avatarIndex: avatarIndex ?? this.avatarIndex,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      name: name ?? this.name,
      languageCode: languageCode ?? this.languageCode,
      lastModified: lastModified ?? this.lastModified,
      preferences: preferences ?? this.preferences,
      token: token ?? this.token,
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

  static DateTime _fromJson(int value) => DateTime.fromMicrosecondsSinceEpoch(value);

  @override
  String toString() {
    return 'User(avatarIndex: $avatarIndex, createdAt: $createdAt, id: $id, languageCode: $languageCode, lastModified: $lastModified, name: $name, preferences: $preferences, token: $token, uid: $uid';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.lastModified, lastModified) || other.lastModified == lastModified) &&
            (identical(other.preferences, preferences) || other.preferences == preferences) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.avatarIndex, avatarIndex) || other.avatarIndex == avatarIndex) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.languageCode, languageCode) || other.languageCode == languageCode) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, avatarIndex, createdAt, languageCode, lastModified,
      preferences, id, token, uid, name);
}

@JsonSerializable()
@embedded
class Preferences {
  const Preferences({
    this.annualHourGoal = 0,
    this.bibleStudies = 0,
    this.descriptionLDC = '',
    this.minutesPrecision = MinutesPrecision.five,
    this.monthlyHourGoal = 0,
    this.selectedStatistics = const <byte>[],
    this.showButtonLDCHours = false,
    this.showTips = true,
    this.themeMode = 0,
  });

  final short annualHourGoal;

  /// 0 - 255. saved number of bible studies - monthly report initial value
  final byte bibleStudies;

  final String descriptionLDC;

  @enumerated
  final MinutesPrecision minutesPrecision;

  final short monthlyHourGoal;

  final List<byte> selectedStatistics;

  /// if true LDC hours button will appears in add new activity form
  final bool showButtonLDCHours;

  /// Show the question mark widget with tooltip in UI
  final bool showTips;

  final byte themeMode;

  Preferences copyWith({
    int? annualHourGoal,
    int? bibleStudies,
    String? descriptionLDC,
    MinutesPrecision? minutesPrecision,
    int? monthlyHourGoal,
    List<byte>? selectedStatistics,
    bool? showButtonLDCHours,
  }) {
    return Preferences(
      annualHourGoal: annualHourGoal ?? this.annualHourGoal,
      bibleStudies: bibleStudies ?? this.bibleStudies,
      descriptionLDC: descriptionLDC ?? this.descriptionLDC,
      minutesPrecision: minutesPrecision ?? this.minutesPrecision,
      monthlyHourGoal: monthlyHourGoal ?? this.monthlyHourGoal,
      selectedStatistics: selectedStatistics ?? this.selectedStatistics,
      showButtonLDCHours: showButtonLDCHours ?? this.showButtonLDCHours,
    );
  }

  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  String toString() {
    return 'Preferences(annualHourGoal: $annualHourGoal, bibleStudies: $bibleStudies, descriptionLDC: $descriptionLDC, minutesPrecision: $minutesPrecision, monthlyHourGoal: $monthlyHourGoal, selectedStatistics: $selectedStatistics, showButtonLDCHours: $showButtonLDCHours, showTips: $showTips, themeMode: $themeMode';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Preferences &&
            (identical(other.annualHourGoal, annualHourGoal) ||
                other.annualHourGoal == annualHourGoal) &&
            (identical(other.bibleStudies, bibleStudies) || other.bibleStudies == bibleStudies) &&
            (identical(other.descriptionLDC, descriptionLDC) ||
                other.descriptionLDC == descriptionLDC) &&
            (identical(other.minutesPrecision, minutesPrecision) ||
                other.minutesPrecision == minutesPrecision) &&
            (identical(other.monthlyHourGoal, monthlyHourGoal) ||
                other.monthlyHourGoal == monthlyHourGoal) &&
            (identical(other.selectedStatistics, selectedStatistics) ||
                other.selectedStatistics == selectedStatistics) &&
            (identical(other.showButtonLDCHours, showButtonLDCHours) ||
                other.showButtonLDCHours == showButtonLDCHours) &&
            (identical(other.showTips, showTips) || other.showTips == showTips) &&
            (identical(other.themeMode, themeMode) || other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      annualHourGoal,
      bibleStudies,
      descriptionLDC,
      minutesPrecision,
      monthlyHourGoal,
      selectedStatistics,
      showButtonLDCHours,
      showTips,
      themeMode);
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
