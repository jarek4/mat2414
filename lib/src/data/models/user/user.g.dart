// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetUserCollection on Isar {
  IsarCollection<User> get users => this.collection();
}

const UserSchema = CollectionSchema(
  name: r'User',
  id: -7838171048429979076,
  properties: {
    r'avatarIndex': PropertySchema(
      id: 0,
      name: r'avatarIndex',
      type: IsarType.byte,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'displayedRatingRequestsNo': PropertySchema(
      id: 2,
      name: r'displayedRatingRequestsNo',
      type: IsarType.byte,
    ),
    r'hashCode': PropertySchema(
      id: 3,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'haveRatedTheApp': PropertySchema(
      id: 4,
      name: r'haveRatedTheApp',
      type: IsarType.bool,
    ),
    r'isOnboardingPassed': PropertySchema(
      id: 5,
      name: r'isOnboardingPassed',
      type: IsarType.bool,
    ),
    r'languageCode': PropertySchema(
      id: 6,
      name: r'languageCode',
      type: IsarType.string,
    ),
    r'lastModified': PropertySchema(
      id: 7,
      name: r'lastModified',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'nextRateRequestDate': PropertySchema(
      id: 9,
      name: r'nextRateRequestDate',
      type: IsarType.dateTime,
    ),
    r'preferences': PropertySchema(
      id: 10,
      name: r'preferences',
      type: IsarType.object,
      target: r'Preferences',
    ),
    r'token': PropertySchema(
      id: 11,
      name: r'token',
      type: IsarType.string,
    ),
    r'uid': PropertySchema(
      id: 12,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _userEstimateSize,
  serialize: _userSerialize,
  deserialize: _userDeserialize,
  deserializeProp: _userDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'Preferences': PreferencesSchema},
  getId: _userGetId,
  getLinks: _userGetLinks,
  attach: _userAttach,
  version: '3.0.5',
);

int _userEstimateSize(
  User object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.languageCode.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      PreferencesSchema.estimateSize(
          object.preferences, allOffsets[Preferences]!, allOffsets);
  bytesCount += 3 + object.token.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _userSerialize(
  User object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.avatarIndex);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeByte(offsets[2], object.displayedRatingRequestsNo);
  writer.writeLong(offsets[3], object.hashCode);
  writer.writeBool(offsets[4], object.haveRatedTheApp);
  writer.writeBool(offsets[5], object.isOnboardingPassed);
  writer.writeString(offsets[6], object.languageCode);
  writer.writeDateTime(offsets[7], object.lastModified);
  writer.writeString(offsets[8], object.name);
  writer.writeDateTime(offsets[9], object.nextRateRequestDate);
  writer.writeObject<Preferences>(
    offsets[10],
    allOffsets,
    PreferencesSchema.serialize,
    object.preferences,
  );
  writer.writeString(offsets[11], object.token);
  writer.writeString(offsets[12], object.uid);
}

User _userDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = User(
    avatarIndex: reader.readByteOrNull(offsets[0]) ?? 0,
    createdAt: reader.readDateTime(offsets[1]),
    displayedRatingRequestsNo: reader.readByteOrNull(offsets[2]) ?? 0,
    haveRatedTheApp: reader.readBoolOrNull(offsets[4]) ?? false,
    id: id,
    isOnboardingPassed: reader.readBoolOrNull(offsets[5]) ?? false,
    languageCode: reader.readStringOrNull(offsets[6]) ?? '',
    lastModified: reader.readDateTime(offsets[7]),
    name: reader.readStringOrNull(offsets[8]) ?? 'default user',
    nextRateRequestDate: reader.readDateTimeOrNull(offsets[9]),
    preferences: reader.readObjectOrNull<Preferences>(
          offsets[10],
          PreferencesSchema.deserialize,
          allOffsets,
        ) ??
        const Preferences(),
    token: reader.readStringOrNull(offsets[11]) ?? '',
    uid: reader.readStringOrNull(offsets[12]) ?? 'defaultUserUid',
  );
  return object;
}

P _userDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset) ?? 'default user') as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readObjectOrNull<Preferences>(
            offset,
            PreferencesSchema.deserialize,
            allOffsets,
          ) ??
          const Preferences()) as P;
    case 11:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 12:
      return (reader.readStringOrNull(offset) ?? 'defaultUserUid') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userGetId(User object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userGetLinks(User object) {
  return [];
}

void _userAttach(IsarCollection<dynamic> col, Id id, User object) {}

extension UserByIndex on IsarCollection<User> {
  Future<User?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  User? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<User?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<User?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(User object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(User object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<User> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<User> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> avatarIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> avatarIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> avatarIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> avatarIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      displayedRatingRequestsNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayedRatingRequestsNo',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      displayedRatingRequestsNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayedRatingRequestsNo',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      displayedRatingRequestsNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayedRatingRequestsNo',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      displayedRatingRequestsNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayedRatingRequestsNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> haveRatedTheAppEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'haveRatedTheApp',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> isOnboardingPassedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOnboardingPassed',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languageCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastModifiedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastModifiedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastModifiedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastModifiedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastModified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nextRateRequestDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextRateRequestDate',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      nextRateRequestDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextRateRequestDate',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nextRateRequestDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextRateRequestDate',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      nextRateRequestDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextRateRequestDate',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nextRateRequestDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextRateRequestDate',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> nextRateRequestDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextRateRequestDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'token',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'token',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> tokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension UserQueryObject on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> preferences(
      FilterQuery<Preferences> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'preferences');
    });
  }
}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQuerySortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByAvatarIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarIndex', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByAvatarIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarIndex', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByDisplayedRatingRequestsNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayedRatingRequestsNo', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByDisplayedRatingRequestsNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayedRatingRequestsNo', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHaveRatedTheApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haveRatedTheApp', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHaveRatedTheAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haveRatedTheApp', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIsOnboardingPassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnboardingPassed', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIsOnboardingPassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnboardingPassed', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByNextRateRequestDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRateRequestDate', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByNextRateRequestDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRateRequestDate', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension UserQuerySortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByAvatarIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarIndex', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByAvatarIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarIndex', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByDisplayedRatingRequestsNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayedRatingRequestsNo', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByDisplayedRatingRequestsNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayedRatingRequestsNo', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHaveRatedTheApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haveRatedTheApp', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHaveRatedTheAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'haveRatedTheApp', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIsOnboardingPassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnboardingPassed', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIsOnboardingPassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnboardingPassed', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByNextRateRequestDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRateRequestDate', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByNextRateRequestDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRateRequestDate', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByAvatarIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarIndex');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByDisplayedRatingRequestsNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayedRatingRequestsNo');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByHaveRatedTheApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'haveRatedTheApp');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByIsOnboardingPassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOnboardingPassed');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByLanguageCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModified');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByNextRateRequestDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextRateRequestDate');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'token', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<User, int, QQueryOperations> avatarIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarIndex');
    });
  }

  QueryBuilder<User, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<User, int, QQueryOperations>
      displayedRatingRequestsNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayedRatingRequestsNo');
    });
  }

  QueryBuilder<User, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<User, bool, QQueryOperations> haveRatedTheAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'haveRatedTheApp');
    });
  }

  QueryBuilder<User, bool, QQueryOperations> isOnboardingPassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOnboardingPassed');
    });
  }

  QueryBuilder<User, String, QQueryOperations> languageCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageCode');
    });
  }

  QueryBuilder<User, DateTime, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModified');
    });
  }

  QueryBuilder<User, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<User, DateTime?, QQueryOperations>
      nextRateRequestDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextRateRequestDate');
    });
  }

  QueryBuilder<User, Preferences, QQueryOperations> preferencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferences');
    });
  }

  QueryBuilder<User, String, QQueryOperations> tokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'token');
    });
  }

  QueryBuilder<User, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const PreferencesSchema = Schema(
  name: r'Preferences',
  id: 4252616732994050084,
  properties: {
    r'annualHourGoal': PropertySchema(
      id: 0,
      name: r'annualHourGoal',
      type: IsarType.int,
    ),
    r'bibleStudies': PropertySchema(
      id: 1,
      name: r'bibleStudies',
      type: IsarType.byte,
    ),
    r'descriptionLDC': PropertySchema(
      id: 2,
      name: r'descriptionLDC',
      type: IsarType.string,
    ),
    r'firstWeekDay': PropertySchema(
      id: 3,
      name: r'firstWeekDay',
      type: IsarType.byte,
    ),
    r'hashCode': PropertySchema(
      id: 4,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'minutesPrecision': PropertySchema(
      id: 5,
      name: r'minutesPrecision',
      type: IsarType.byte,
      enumMap: _PreferencesminutesPrecisionEnumValueMap,
    ),
    r'monthlyHourGoal': PropertySchema(
      id: 6,
      name: r'monthlyHourGoal',
      type: IsarType.int,
    ),
    r'selectedStatistics': PropertySchema(
      id: 7,
      name: r'selectedStatistics',
      type: IsarType.byteList,
    ),
    r'showButtonLDCHours': PropertySchema(
      id: 8,
      name: r'showButtonLDCHours',
      type: IsarType.bool,
    ),
    r'showTips': PropertySchema(
      id: 9,
      name: r'showTips',
      type: IsarType.bool,
    ),
    r'themeMode': PropertySchema(
      id: 10,
      name: r'themeMode',
      type: IsarType.byte,
    )
  },
  estimateSize: _preferencesEstimateSize,
  serialize: _preferencesSerialize,
  deserialize: _preferencesDeserialize,
  deserializeProp: _preferencesDeserializeProp,
);

int _preferencesEstimateSize(
  Preferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descriptionLDC.length * 3;
  bytesCount += 3 + object.selectedStatistics.length;
  return bytesCount;
}

void _preferencesSerialize(
  Preferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeInt(offsets[0], object.annualHourGoal);
  writer.writeByte(offsets[1], object.bibleStudies);
  writer.writeString(offsets[2], object.descriptionLDC);
  writer.writeByte(offsets[3], object.firstWeekDay);
  writer.writeLong(offsets[4], object.hashCode);
  writer.writeByte(offsets[5], object.minutesPrecision.index);
  writer.writeInt(offsets[6], object.monthlyHourGoal);
  writer.writeByteList(offsets[7], object.selectedStatistics);
  writer.writeBool(offsets[8], object.showButtonLDCHours);
  writer.writeBool(offsets[9], object.showTips);
  writer.writeByte(offsets[10], object.themeMode);
}

Preferences _preferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Preferences(
    annualHourGoal: reader.readIntOrNull(offsets[0]) ?? 0,
    bibleStudies: reader.readByteOrNull(offsets[1]) ?? 0,
    descriptionLDC: reader.readStringOrNull(offsets[2]) ?? '',
    firstWeekDay: reader.readByteOrNull(offsets[3]) ?? 0,
    minutesPrecision: _PreferencesminutesPrecisionValueEnumMap[
            reader.readByteOrNull(offsets[5])] ??
        MinutesPrecision.five,
    monthlyHourGoal: reader.readIntOrNull(offsets[6]) ?? 0,
    selectedStatistics: reader.readByteList(offsets[7]) ?? const <byte>[],
    showButtonLDCHours: reader.readBoolOrNull(offsets[8]) ?? false,
    showTips: reader.readBoolOrNull(offsets[9]) ?? true,
    themeMode: reader.readByteOrNull(offsets[10]) ?? 0,
  );
  return object;
}

P _preferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_PreferencesminutesPrecisionValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MinutesPrecision.five) as P;
    case 6:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 7:
      return (reader.readByteList(offset) ?? const <byte>[]) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 9:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 10:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PreferencesminutesPrecisionEnumValueMap = {
  'one': 0,
  'five': 1,
  'ten': 2,
  'fifteen': 3,
  'thirty': 4,
};
const _PreferencesminutesPrecisionValueEnumMap = {
  0: MinutesPrecision.one,
  1: MinutesPrecision.five,
  2: MinutesPrecision.ten,
  3: MinutesPrecision.fifteen,
  4: MinutesPrecision.thirty,
};

extension PreferencesQueryFilter
    on QueryBuilder<Preferences, Preferences, QFilterCondition> {
  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      annualHourGoalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualHourGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      annualHourGoalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualHourGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      annualHourGoalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualHourGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      annualHourGoalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualHourGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      bibleStudiesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bibleStudies',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      bibleStudiesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bibleStudies',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      bibleStudiesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bibleStudies',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      bibleStudiesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bibleStudies',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionLDC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionLDC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionLDC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionLDC',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptionLDC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptionLDC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptionLDC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptionLDC',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionLDC',
        value: '',
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      descriptionLDCIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptionLDC',
        value: '',
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      firstWeekDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstWeekDay',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      firstWeekDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstWeekDay',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      firstWeekDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstWeekDay',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      firstWeekDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstWeekDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      minutesPrecisionEqualTo(MinutesPrecision value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minutesPrecision',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      minutesPrecisionGreaterThan(
    MinutesPrecision value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minutesPrecision',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      minutesPrecisionLessThan(
    MinutesPrecision value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minutesPrecision',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      minutesPrecisionBetween(
    MinutesPrecision lower,
    MinutesPrecision upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minutesPrecision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      monthlyHourGoalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyHourGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      monthlyHourGoalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyHourGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      monthlyHourGoalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyHourGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      monthlyHourGoalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyHourGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedStatistics',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedStatistics',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedStatistics',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedStatistics',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedStatistics',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedStatistics',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedStatistics',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedStatistics',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedStatistics',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      selectedStatisticsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedStatistics',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      showButtonLDCHoursEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showButtonLDCHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> showTipsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showTips',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      themeModeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      themeModeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      themeModeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition>
      themeModeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PreferencesQueryObject
    on QueryBuilder<Preferences, Preferences, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      createdAt: User._fromJson(json['createdAt'] as int),
      lastModified: User._fromJson(json['lastModified'] as int),
      avatarIndex: json['avatarIndex'] as int? ?? 0,
      displayedRatingRequestsNo: json['displayedRatingRequestsNo'] as int? ?? 0,
      haveRatedTheApp: json['haveRatedTheApp'] as bool? ?? false,
      id: json['id'] as int? ?? Isar.autoIncrement,
      isOnboardingPassed: json['isOnboardingPassed'] as bool? ?? false,
      languageCode: json['languageCode'] as String? ?? '',
      name: json['name'] as String? ?? 'default user',
      nextRateRequestDate:
          User._fromJsonNullable(json['nextRateRequestDate'] as int?),
      preferences: json['preferences'] == null
          ? const Preferences()
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
      uid: json['uid'] as String? ?? 'defaultUserUid',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatarIndex': instance.avatarIndex,
      'displayedRatingRequestsNo': instance.displayedRatingRequestsNo,
      'haveRatedTheApp': instance.haveRatedTheApp,
      'id': instance.id,
      'isOnboardingPassed': instance.isOnboardingPassed,
      'createdAt': User._toJson(instance.createdAt),
      'lastModified': User._toJson(instance.lastModified),
      'languageCode': instance.languageCode,
      'name': instance.name,
      'nextRateRequestDate': User._toJsonNullable(instance.nextRateRequestDate),
      'preferences': instance.preferences,
      'token': instance.token,
      'uid': instance.uid,
    };

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      annualHourGoal: json['annualHourGoal'] as int? ?? 0,
      bibleStudies: json['bibleStudies'] as int? ?? 0,
      descriptionLDC: json['descriptionLDC'] as String? ?? '',
      firstWeekDay: json['firstWeekDay'] as int? ?? 0,
      minutesPrecision: $enumDecodeNullable(
              _$MinutesPrecisionEnumMap, json['minutesPrecision']) ??
          MinutesPrecision.five,
      monthlyHourGoal: json['monthlyHourGoal'] as int? ?? 0,
      selectedStatistics: (json['selectedStatistics'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const <byte>[],
      showButtonLDCHours: json['showButtonLDCHours'] as bool? ?? false,
      showTips: json['showTips'] as bool? ?? true,
      themeMode: json['themeMode'] as int? ?? 0,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'annualHourGoal': instance.annualHourGoal,
      'bibleStudies': instance.bibleStudies,
      'descriptionLDC': instance.descriptionLDC,
      'firstWeekDay': instance.firstWeekDay,
      'minutesPrecision': _$MinutesPrecisionEnumMap[instance.minutesPrecision]!,
      'monthlyHourGoal': instance.monthlyHourGoal,
      'selectedStatistics': instance.selectedStatistics,
      'showButtonLDCHours': instance.showButtonLDCHours,
      'showTips': instance.showTips,
      'themeMode': instance.themeMode,
    };

const _$MinutesPrecisionEnumMap = {
  MinutesPrecision.one: 0,
  MinutesPrecision.five: 1,
  MinutesPrecision.ten: 2,
  MinutesPrecision.fifteen: 3,
  MinutesPrecision.thirty: 4,
};
