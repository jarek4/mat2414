import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
@collection
class User {
  User({this.createdAt, this.lastModified, this.id = 0, this.name = '', this.uid = ''});

  Id id = Isar.autoIncrement;
  final DateTime? createdAt; // 2023-01-28 18:29:43.775
  final DateTime? lastModified;
  final String name;
  final String uid;

  User copyWith(
    DateTime? createdAt,
    DateTime? lastModified,
    String? name,
    int? id,
    String? uid,
  ) {
    return User(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      id: id ?? this.id,
      lastModified: lastModified ?? this.lastModified,
      uid: uid ?? this.uid,
    );
  }

  /// Connect the generated [_$ReportFromJson] function to the `fromJson` factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User(createdAt: $createdAt, lastModified: $lastModified, name: $name,id: $id, uid: $uid';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.lastModified, lastModified) || other.lastModified == lastModified) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, lastModified, id, uid, name);
}
