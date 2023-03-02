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
    r'hashCode': PropertySchema(
      id: 3,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'hours': PropertySchema(
      id: 4,
      name: r'hours',
      type: IsarType.byte,
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
    r'isInformalWitnessing': PropertySchema(
      id: 7,
      name: r'isInformalWitnessing',
      type: IsarType.bool,
    ),
    r'isLCDHours': PropertySchema(
      id: 8,
      name: r'isLCDHours',
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
    r'isWithFieldServiceGroupWitnessing': PropertySchema(
      id: 11,
      name: r'isWithFieldServiceGroupWitnessing',
      type: IsarType.bool,
    ),
    r'lastModified': PropertySchema(
      id: 12,
      name: r'lastModified',
      type: IsarType.dateTime,
    ),
    r'minutes': PropertySchema(
      id: 13,
      name: r'minutes',
      type: IsarType.byte,
    ),
    r'month': PropertySchema(
      id: 14,
      name: r'month',
      type: IsarType.byte,
    ),
    r'placements': PropertySchema(
      id: 15,
      name: r'placements',
      type: IsarType.byte,
    ),
    r'remarks': PropertySchema(
      id: 16,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'returnVisits': PropertySchema(
      id: 17,
      name: r'returnVisits',
      type: IsarType.byte,
    ),
    r'serviceYear': PropertySchema(
      id: 18,
      name: r'serviceYear',
      type: IsarType.string,
    ),
    r'uid': PropertySchema(
      id: 19,
      name: r'uid',
      type: IsarType.string,
    ),
    r'videos': PropertySchema(
      id: 20,
      name: r'videos',
      type: IsarType.byte,
    ),
    r'year': PropertySchema(
      id: 21,
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
  {
    final value = object.uid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  writer.writeLong(offsets[3], object.hashCode);
  writer.writeByte(offsets[4], object.hours);
  writer.writeBool(offsets[5], object.isBusinessTerritoryWitnessing);
  writer.writeBool(offsets[6], object.isEveningWitnessing);
  writer.writeBool(offsets[7], object.isInformalWitnessing);
  writer.writeBool(offsets[8], object.isLCDHours);
  writer.writeBool(offsets[9], object.isPublicWitnessing);
  writer.writeBool(offsets[10], object.isSundayWitnessing);
  writer.writeBool(offsets[11], object.isWithFieldServiceGroupWitnessing);
  writer.writeDateTime(offsets[12], object.lastModified);
  writer.writeByte(offsets[13], object.minutes);
  writer.writeByte(offsets[14], object.month);
  writer.writeByte(offsets[15], object.placements);
  writer.writeString(offsets[16], object.remarks);
  writer.writeByte(offsets[17], object.returnVisits);
  writer.writeString(offsets[18], object.serviceYear);
  writer.writeString(offsets[19], object.uid);
  writer.writeByte(offsets[20], object.videos);
  writer.writeInt(offsets[21], object.year);
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
    hours: reader.readByteOrNull(offsets[4]) ?? 0,
    id: id,
    isBusinessTerritoryWitnessing: reader.readBoolOrNull(offsets[5]) ?? false,
    isEveningWitnessing: reader.readBoolOrNull(offsets[6]) ?? false,
    isInformalWitnessing: reader.readBoolOrNull(offsets[7]) ?? false,
    isLCDHours: reader.readBoolOrNull(offsets[8]) ?? false,
    isPublicWitnessing: reader.readBoolOrNull(offsets[9]) ?? false,
    isSundayWitnessing: reader.readBoolOrNull(offsets[10]) ?? false,
    isWithFieldServiceGroupWitnessing:
        reader.readBoolOrNull(offsets[11]) ?? false,
    lastModified: reader.readDateTime(offsets[12]),
    minutes: reader.readByteOrNull(offsets[13]) ?? 0,
    month: reader.readByte(offsets[14]),
    placements: reader.readByteOrNull(offsets[15]) ?? 0,
    remarks: reader.readStringOrNull(offsets[16]) ?? '',
    returnVisits: reader.readByteOrNull(offsets[17]) ?? 0,
    serviceYear: reader.readString(offsets[18]),
    uid: reader.readStringOrNull(offsets[19]),
    videos: reader.readByteOrNull(offsets[20]) ?? 0,
    year: reader.readInt(offsets[21]),
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
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readByteOrNull(offset) ?? 0) as P;
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
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 14:
      return (reader.readByte(offset)) as P;
    case 15:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 16:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 17:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 21:
      return (reader.readInt(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hoursEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> hoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hours',
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
      isInformalWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInformalWitnessing',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> isLCDHoursEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLCDHours',
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition>
      isWithFieldServiceGroupWitnessingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWithFieldServiceGroupWitnessing',
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> minutesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> minutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> minutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> minutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minutes',
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

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<Activity, Activity, QAfterFilterCondition> uidEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsLCDHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLCDHours', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByIsLCDHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLCDHours', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsWithFieldServiceGroupWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWithFieldServiceGroupWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      sortByIsWithFieldServiceGroupWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWithFieldServiceGroupWitnessing', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> sortByMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsLCDHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLCDHours', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByIsLCDHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLCDHours', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsWithFieldServiceGroupWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWithFieldServiceGroupWitnessing', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy>
      thenByIsWithFieldServiceGroupWitnessingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWithFieldServiceGroupWitnessing', Sort.desc);
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

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.asc);
    });
  }

  QueryBuilder<Activity, Activity, QAfterSortBy> thenByMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.desc);
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

  QueryBuilder<Activity, Activity, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hours');
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

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsInformalWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInformalWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByIsLCDHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLCDHours');
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

  QueryBuilder<Activity, Activity, QDistinct>
      distinctByIsWithFieldServiceGroupWitnessing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWithFieldServiceGroupWitnessing');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModified');
    });
  }

  QueryBuilder<Activity, Activity, QDistinct> distinctByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minutes');
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

  QueryBuilder<Activity, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> hoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hours');
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

  QueryBuilder<Activity, bool, QQueryOperations>
      isInformalWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInformalWitnessing');
    });
  }

  QueryBuilder<Activity, bool, QQueryOperations> isLCDHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLCDHours');
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

  QueryBuilder<Activity, bool, QQueryOperations>
      isWithFieldServiceGroupWitnessingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWithFieldServiceGroupWitnessing');
    });
  }

  QueryBuilder<Activity, DateTime, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModified');
    });
  }

  QueryBuilder<Activity, int, QQueryOperations> minutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minutes');
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

  QueryBuilder<Activity, String?, QQueryOperations> uidProperty() {
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      day: json['day'] as int,
      lastModified: DateTime.parse(json['lastModified'] as String),
      month: json['month'] as int,
      serviceYear: json['serviceYear'] as String,
      year: json['year'] as int,
      bibleStudies: json['bibleStudies'] as int? ?? 0,
      hours: json['hours'] as int? ?? 0,
      id: json['id'] as int? ?? Isar.autoIncrement,
      isBusinessTerritoryWitnessing:
          json['isBusinessTerritoryWitnessing'] as bool? ?? false,
      isEveningWitnessing: json['isEveningWitnessing'] as bool? ?? false,
      isInformalWitnessing: json['isInformalWitnessing'] as bool? ?? false,
      isPublicWitnessing: json['isPublicWitnessing'] as bool? ?? false,
      isSundayWitnessing: json['isSundayWitnessing'] as bool? ?? false,
      isWithFieldServiceGroupWitnessing:
          json['isWithFieldServiceGroupWitnessing'] as bool? ?? false,
      minutes: json['minutes'] as int? ?? 0,
      placements: json['placements'] as int? ?? 0,
      remarks: json['remarks'] as String? ?? '',
      returnVisits: json['returnVisits'] as int? ?? 0,
      isLCDHours: json['isLCDHours'] as bool? ?? false,
      uid: json['uid'] as String?,
      videos: json['videos'] as int? ?? 0,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
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
      'isWithFieldServiceGroupWitnessing':
          instance.isWithFieldServiceGroupWitnessing,
      'lastModified': instance.lastModified.toIso8601String(),
      'minutes': instance.minutes,
      'month': instance.month,
      'placements': instance.placements,
      'remarks': instance.remarks,
      'returnVisits': instance.returnVisits,
      'serviceYear': instance.serviceYear,
      'isLCDHours': instance.isLCDHours,
      'uid': instance.uid,
      'videos': instance.videos,
      'year': instance.year,
    };
