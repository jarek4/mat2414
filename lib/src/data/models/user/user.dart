import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@collection
class User {
  const User({required this.createdAt, this.id = Isar.autoIncrement, required this.lastModified, this.name = 'default User', this.uid = ''});

  final Id id;
  final DateTime createdAt; // {"createdAt":1672531200000000,} User(createdAt: 2023-01-01 00:00:00.000,)
  final DateTime lastModified;
  @Index(unique: true, replace: true)
  final String name;
  final String uid;

  User copyWith(
    DateTime? createdAt,
    int? id,
    DateTime? lastModified,
    String? name,
    String? uid,
  ) {
    return User(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      name: name ?? this.name,
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
