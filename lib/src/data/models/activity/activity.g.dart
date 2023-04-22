// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetActivityCollection on Isar {
  IsarCollection<Activity> get activitys => this.collection();
}

const ActivitySchema = CollectionSchema(
  name: r'Activity',
  id: -6099828696840999229,
  properties: {
    r'bibleStudies': PropertySchema(
      id: 0,
      name: r'bibleStudies',
      type: IsarType.byte,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'day': PropertySchema(
      id: 2,
      name: r'day',
      type: IsarType.byte,
    ),
    r'durationInMinutes': PropertySchema(
      id: 3,
      name: r'durationInMinutes',
      type: IsarType.int,
    ),
    r'hashCode': PropertySchema(
      id: 4,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'isBusinessTerritoryWitnessing': PropertySchema(
      id: 5,
      name: r'isBusinessTerritoryWitnessing',
      type: IsarType.bool,
    ),
    r'isEveningWitnessing': PropertySchema(
      id: 6,
      name: r'isEveningWitnessing',
      type: IsarType.bool,
    ),
    r'isGroupWitnessing': PropertySchema(
      id: 7,
      name: r'isGroupWitnessing',
      type: IsarType.bool,
    ),
    r'isInformalWitnessing': PropertySchema(
      id: 8,
      name: r'isInformalWitnessing',
      type: IsarType.bool,
    ),
    r'isPublicWitnessing': PropertySchema(
      id: 9,
      name: r'isPublicWitnessing',
      type: IsarType.bool,
    ),
    r'isSundayWitnessing': PropertySchema(
      id: 10,
      name: r'isSundayWitnessing',
      type: IsarType.bool,
    ),
    r'lastModified': PropertySchema(
      id: 11,
      name: r'lastModified',
      type: IsarType.dateTime,
    ),
    r'month': PropertySchema(
      id: 12,
      name: r'month',
      type: IsarType.byte,
    ),
    r'placements': PropertySchema(
      id: 13,
      name: r'placements',
      type: IsarType.byte,
    ),
    r'remarks': PropertySchema(
      id: 14,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'returnVisits': PropertySchema(
      id: 15,
      name: r'returnVisits',
      type: IsarType.byte,
    ),
    r'serviceYear': PropertySchema(
      id: 16,
      name: r'serviceYear',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 17,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ActivitytypeEnumValueMap,
    ),
    r'uid': PropertySchema(
      id: 18,
      name: r'uid',
      type: IsarType.string,
    ),
    r'videos': PropertySchema(
      id: 19,
      name: r'videos',
      type: IsarType.byte,
    ),
    r'year': PropertySchema(
      id: 20,
      name: r'year',
      type: IsarType.int,
    )
  },
  estimateSize: _activityEstimateSize,
  serialize: _activitySerialize,
  deserialize: _activityDeserialize,
  deserializeProp: _activityDeserializeProp,
  idName: r'id',
  indexes: {
    r'year_month_day': IndexSchema(
      id: -6628116573558850283,
      name: r'year_month_day',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'year',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'month',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'day',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _activityGetId,
  getLinks: _activityGetLinks,
  attach: _activityAttach,
  version: '3.0.5',
);

int _activityEstimateSize(
  Activity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.remarks.length * 3;
  bytesCount += 3 + object.serviceYear.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _activitySerialize(
  Activity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.bibleStudies);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeByte(offsets[2], object.day);
  writer.writeInt(offsets[3], object.durationInMinutes);
  writer.writeLong(offsets[4], object.hashCode);
  writer.writeBool(offsets[5], object.isBusinessTerritoryWitnessing);
  writer.writeBool(offsets[6], object.isEveningWitnessing);
  writer.writeBool(offsets[7], object.isGroupWitnessing);
  writer.writeBool(offsets[8], object.isInformalWitnessing);
  writer.writeBool(offsets[9], object.isPublicWitnessing);
  writer.writeBool(offsets[10], object.isSundayWitnessing);
  writer.writeDateTime(offsets[11], object.lastModified);
  writer.writeByte(offsets[12], object.month);
  writer.writeByte(offsets[13], object.placements);
  writer.writeString(offsets[14], object.remarks);
  writer.writeByte(offsets[15], object.returnVisits);
  writer.writeString(offsets[16], object.serviceYear);
  writer.writeByte(offsets[17], object.type.index);
  writer.writeString(offsets[18], object.uid);
  writer.writeByte(offsets[19], object.videos);
  writer.writeInt(offsets[20], object.year);
}

Activity _activityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Activity(
    bibleStudies: reader.readByteOrNull(offsets[0]) ?? 0,
    createdAt: reader.readDateTime(offsets[1]),
    day: reader.readByte(offsets[2]),
    durationInMinutes: reader.readIntOrNull(offsets[3]) ?? 0,
    id: id,
    isBusinessTerritoryWitnessing: reader.readBoolOrNull(offsets[5]) ?? false,
    isEveningWitnessing: reader.readBoolOrNull(offsets[6]) ?? false,
    isGroupWitnessing: reader.readBoolOrNull(offsets[7]) ?? false,
    isInformalWitnessing: reader.readBoolOrNull(offsets[8]) ?? false,
    isPublicWitnessing: reader.readBoolOrNull(offsets[9]) ?? false,
    isSundayWitnessing: reader.readBoolOrNull(offsets[10]) ?? false,
    lastModified: reader.readDateTime(offsets[11]),
    month: reader.readByte(offsets[12]),
    placements: reader.readByteOrNull(offsets[13]) ?? 0,
    remarks: reader.readStringOrNull(offsets[14]) ?? '',
    returnVisits: reader.readByteOrNull(offsets[15]) ?? 0,
    serviceYear: reader.readString(offsets[16]),
    type: _ActivitytypeValueEnumMap[reader.readByteOrNull(offsets[17])] ??
        ActivityType.normal,
    uid: reader.readStringOrNull(offsets[18]) ?? '',
    videos: reader.readByteOrNull(offsets[19]) ?? 0,
    year: reader.readInt(offsets[20]),
  );
  return object;
}

P _activityDeserializeProp<P>(
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
      return (reader.readByte(offset)) as P;
    case 3:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 9:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readByte(offset)) as P;
    case 13:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 14:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 15:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (_ActivitytypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ActivityType.normal) as P;
    case 18:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 19:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 20:
      return (reader.readInt(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ActivitytypeEnumValueMap = {
  'normal': 0,
  'ldc': 1,
  'transferred': 2,
  'transferredLdc': 3,
};
const _ActivitytypeValueEnumMap = {
  0: ActivityType.normal,
  1: ActivityType.ldc,
  2: ActivityType.transferred,
  3: ActivityType.transferredLdc,
};

Id _activityGetId(Activity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activityGetLinks(Activity object) {
  return [];
}

void _activityAttach(IsarCollection<dynamic> col, Id id, Activity object) {}

extension ActivityQueryWhereSort on QueryBuilder<Activity, Activity, QWhere> {
  QueryBuilder<Activity, Activity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhere> anyYearMonthDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'year_month_day'),
      );
    });
  }
}

extension ActivityQueryWhere on QueryBuilder<Activity, Activity, QWhereClause> {
  QueryBuilder<Activity, Activity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Activity, Activity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> idBetween(
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

  QueryBuilder<Activity, Activity, QAfterWhereClause> yearEqualToAnyMonthDay(
      int year) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_day',
        value: [year],
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> yearNotEqualToAnyMonthDay(
      int year) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [],
              upper: [year],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [],
              upper: [year],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearGreaterThanAnyMonthDay(
    int year, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> yearLessThanAnyMonthDay(
    int year, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [],
        upper: [year],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> yearBetweenAnyMonthDay(
    int lowerYear,
    int upperYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [lowerYear],
        includeLower: includeLower,
        upper: [upperYear],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> yearMonthEqualToAnyDay(
      int year, int month) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_day',
        value: [year, month],
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearEqualToMonthNotEqualToAnyDay(int year, int month) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year],
              upper: [year, month],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year, month],
              includeLower: false,
              upper: [year],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year, month],
              includeLower: false,
              upper: [year],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year],
              upper: [year, month],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearEqualToMonthGreaterThanAnyDay(
    int year,
    int month, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year, month],
        includeLower: include,
        upper: [year],
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearEqualToMonthLessThanAnyDay(
    int year,
    int month, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year],
        upper: [year, month],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearEqualToMonthBetweenAnyDay(
    int year,
    int lowerMonth,
    int upperMonth, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year, lowerMonth],
        includeLower: includeLower,
        upper: [year, upperMonth],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause> yearMonthDayEqualTo(
      int year, int month, int day) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_day',
        value: [year, month, day],
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearMonthEqualToDayNotEqualTo(int year, int month, int day) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year, month],
              upper: [year, month, day],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year, month, day],
              includeLower: false,
              upper: [year, month],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year, month, day],
              includeLower: false,
              upper: [year, month],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_day',
              lower: [year, month],
              upper: [year, month, day],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearMonthEqualToDayGreaterThan(
    int year,
    int month,
    int day, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year, month, day],
        includeLower: include,
        upper: [year, month],
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearMonthEqualToDayLessThan(
    int year,
    int month,
    int day, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year, month],
        upper: [year, month, day],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterWhereClause>
      yearMonthEqualToDayBetween(
    int year,
    int month,
    int lowerDay,
    int upperDay, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_day',
        lower: [year, month, lowerDay],
        includeLower: includeLower,
        upper: [year, month, upperDay],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActivityQueryFilter
    on QueryBuilder<Activity, Activity, QFilterCondition> {
  QueryBuilder<Activity, Activity, QAfterFilterCondition> bibleStudiesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bibleStudies',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> bibleStudiesLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> bibleStudiesBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> dayEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> dayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> dayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> dayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationInMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationInMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationInMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      durationInMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isBusinessTerritoryWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBusinessTerritoryWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isEveningWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEveningWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isGroupWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isGroupWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isInformalWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInformalWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isPublicWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPublicWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isSundayWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSundayWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lastModifiedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      lastModifiedGreaterThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lastModifiedLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> lastModifiedBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> monthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> monthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> monthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> placementsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placements',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> placementsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'placements',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> placementsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'placements',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> placementsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'placements',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> returnVisitsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnVisits',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      returnVisitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnVisits',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> returnVisitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnVisits',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> returnVisitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnVisits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      serviceYearGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceYear',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> serviceYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceYear',
        value: '',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      serviceYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceYear',
        value: '',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> typeEqualTo(
      ActivityType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> typeGreaterThan(
    ActivityType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> typeLessThan(
    ActivityType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> typeBetween(
    ActivityType lower,
    ActivityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidGreaterThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> videosEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videos',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> videosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videos',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> videosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videos',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> videosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> yearEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActivityQueryObject
    on QueryBuilder<Activity, Activity, QFilterCondition> {}

extension ActivityQueryLinks
    on QueryBuilder<Activity, Activity, QFilterCondition> {}

extension ActivityQuerySortBy on QueryBuilder<Activity, Activity, QSortBy> {
  QueryBuilder<Activity, Activity, QAfterSortBy> sortByBibleStudies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByBibleStudiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDurationInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByDurationInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsBusinessTerritoryWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBusinessTerritoryWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsBusinessTerritoryWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBusinessTerritoryWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsEveningWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEveningWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsEveningWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEveningWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsGroupWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsGroupWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsInformalWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInformalWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsInformalWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInformalWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsPublicWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsPublicWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsSundayWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSundayWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsSundayWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSundayWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByPlacements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByPlacementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByReturnVisits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByReturnVisitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByServiceYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByServiceYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByVideos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByVideosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension ActivityQuerySortThenBy
    on QueryBuilder<Activity, Activity, QSortThenBy> {
  QueryBuilder<Activity, Activity, QAfterSortBy> thenByBibleStudies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByBibleStudiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDurationInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByDurationInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsBusinessTerritoryWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBusinessTerritoryWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsBusinessTerritoryWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBusinessTerritoryWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsEveningWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEveningWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsEveningWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEveningWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsGroupWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsGroupWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsInformalWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInformalWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsInformalWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInformalWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsPublicWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsPublicWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPublicWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsSundayWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSundayWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsSundayWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSundayWitnessing', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByPlacements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByPlacementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByReturnVisits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByReturnVisitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByServiceYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByServiceYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByVideos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByVideosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.desc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension ActivityQueryWhereDistinct
    on QueryBuilder<Activity, Activity, QDistinct> {
  QueryBuilder<Activity, Activity, QDistinct> distinctByBibleStudies() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bibleStudies');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByDurationInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInMinutes');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct>
      distinctByIsBusinessTerritoryWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBusinessTerritoryWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsEveningWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEveningWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsGroupWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isGroupWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsInformalWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInformalWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsPublicWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPublicWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsSundayWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSundayWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModified');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByPlacements() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placements');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByReturnVisits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnVisits');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByServiceYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceYear', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByVideos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videos');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension ActivityQueryProperty
    on QueryBuilder<Activity, Activity, QQueryProperty> {
  QueryBuilder<Activity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> bibleStudiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bibleStudies');
    });
  }

  QueryBuilder<Activity, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> durationInMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInMinutes');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations>
      isBusinessTerritoryWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBusinessTerritoryWitnessing');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> isEveningWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEveningWitnessing');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> isGroupWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isGroupWitnessing');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations>
      isInformalWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInformalWitnessing');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> isPublicWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPublicWitnessing');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> isSundayWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSundayWitnessing');
    });
  }

  QueryBuilder<Activity, DateTime, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModified');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> placementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placements');
    });
  }

  QueryBuilder<Activity, String, QQueryOperations> remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> returnVisitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnVisits');
    });
  }

  QueryBuilder<Activity, String, QQueryOperations> serviceYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceYear');
    });
  }

  QueryBuilder<Activity, ActivityType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Activity, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> videosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videos');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      createdAt: Activity._fromJson(json['createdAt'] as int),
      day: json['day'] as int,
      lastModified: Activity._fromJson(json['lastModified'] as int),
      month: json['month'] as int,
      serviceYear: json['serviceYear'] as String,
      year: json['year'] as int,
      bibleStudies: json['bibleStudies'] as int? ?? 0,
      durationInMinutes: json['durationInMinutes'] as int? ?? 0,
      id: json['id'] as int? ?? Isar.autoIncrement,
      isBusinessTerritoryWitnessing:
          json['isBusinessTerritoryWitnessing'] as bool? ?? false,
      isEveningWitnessing: json['isEveningWitnessing'] as bool? ?? false,
      isInformalWitnessing: json['isInformalWitnessing'] as bool? ?? false,
      isPublicWitnessing: json['isPublicWitnessing'] as bool? ?? false,
      isSundayWitnessing: json['isSundayWitnessing'] as bool? ?? false,
      isGroupWitnessing: json['isGroupWitnessing'] as bool? ?? false,
      placements: json['placements'] as int? ?? 0,
      remarks: json['remarks'] as String? ?? '',
      returnVisits: json['returnVisits'] as int? ?? 0,
      type: $enumDecodeNullable(_$ActivityTypeEnumMap, json['type']) ??
          ActivityType.normal,
      uid: json['uid'] as String? ?? '',
      videos: json['videos'] as int? ?? 0,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'bibleStudies': instance.bibleStudies,
      'createdAt': Activity._toJson(instance.createdAt),
      'day': instance.day,
      'durationInMinutes': instance.durationInMinutes,
      'id': instance.id,
      'isBusinessTerritoryWitnessing': instance.isBusinessTerritoryWitnessing,
      'isEveningWitnessing': instance.isEveningWitnessing,
      'isInformalWitnessing': instance.isInformalWitnessing,
      'isPublicWitnessing': instance.isPublicWitnessing,
      'isSundayWitnessing': instance.isSundayWitnessing,
      'isGroupWitnessing': instance.isGroupWitnessing,
      'lastModified': Activity._toJson(instance.lastModified),
      'month': instance.month,
      'placements': instance.placements,
      'remarks': instance.remarks,
      'returnVisits': instance.returnVisits,
      'serviceYear': instance.serviceYear,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'uid': instance.uid,
      'videos': instance.videos,
      'year': instance.year,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.normal: 0,
  ActivityType.ldc: 1,
  ActivityType.transferred: 2,
  ActivityType.transferredLdc: 3,
};
