// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetReportCollection on Isar {
  IsarCollection<Report> get reports => this.collection();
}

const ReportSchema = CollectionSchema(
  name: r'Report',
  id: 4107730612455750309,
  properties: {
    r'bibleStudies': PropertySchema(
      id: 0,
      name: r'bibleStudies',
      type: IsarType.int,
    ),
    r'businessTerritoryWitnessingHours': PropertySchema(
      id: 1,
      name: r'businessTerritoryWitnessingHours',
      type: IsarType.int,
    ),
    r'businessTerritoryWitnessingQuantity': PropertySchema(
      id: 2,
      name: r'businessTerritoryWitnessingQuantity',
      type: IsarType.int,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'durationInMinutes': PropertySchema(
      id: 4,
      name: r'durationInMinutes',
      type: IsarType.int,
    ),
    r'eveningWitnessingHours': PropertySchema(
      id: 5,
      name: r'eveningWitnessingHours',
      type: IsarType.int,
    ),
    r'eveningWitnessingQuantity': PropertySchema(
      id: 6,
      name: r'eveningWitnessingQuantity',
      type: IsarType.int,
    ),
    r'hashCode': PropertySchema(
      id: 7,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'informalWitnessingHours': PropertySchema(
      id: 8,
      name: r'informalWitnessingHours',
      type: IsarType.int,
    ),
    r'informalWitnessingQuantity': PropertySchema(
      id: 9,
      name: r'informalWitnessingQuantity',
      type: IsarType.int,
    ),
    r'isClosed': PropertySchema(
      id: 10,
      name: r'isClosed',
      type: IsarType.bool,
    ),
    r'lastModified': PropertySchema(
      id: 11,
      name: r'lastModified',
      type: IsarType.dateTime,
    ),
    r'minutesLDC': PropertySchema(
      id: 12,
      name: r'minutesLDC',
      type: IsarType.int,
    ),
    r'month': PropertySchema(
      id: 13,
      name: r'month',
      type: IsarType.byte,
    ),
    r'placements': PropertySchema(
      id: 14,
      name: r'placements',
      type: IsarType.int,
    ),
    r'publicWitnessingHours': PropertySchema(
      id: 15,
      name: r'publicWitnessingHours',
      type: IsarType.int,
    ),
    r'publicWitnessingQuantity': PropertySchema(
      id: 16,
      name: r'publicWitnessingQuantity',
      type: IsarType.int,
    ),
    r'remarks': PropertySchema(
      id: 17,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'returnVisits': PropertySchema(
      id: 18,
      name: r'returnVisits',
      type: IsarType.int,
    ),
    r'serviceYear': PropertySchema(
      id: 19,
      name: r'serviceYear',
      type: IsarType.string,
    ),
    r'sundayWitnessingHours': PropertySchema(
      id: 20,
      name: r'sundayWitnessingHours',
      type: IsarType.int,
    ),
    r'sundayWitnessingQuantity': PropertySchema(
      id: 21,
      name: r'sundayWitnessingQuantity',
      type: IsarType.int,
    ),
    r'transferredMinutes': PropertySchema(
      id: 22,
      name: r'transferredMinutes',
      type: IsarType.byte,
    ),
    r'transferredMinutesActivityId': PropertySchema(
      id: 23,
      name: r'transferredMinutesActivityId',
      type: IsarType.long,
    ),
    r'uid': PropertySchema(
      id: 24,
      name: r'uid',
      type: IsarType.string,
    ),
    r'videos': PropertySchema(
      id: 25,
      name: r'videos',
      type: IsarType.int,
    ),
    r'withFieldServiceGroupWitnessingHours': PropertySchema(
      id: 26,
      name: r'withFieldServiceGroupWitnessingHours',
      type: IsarType.int,
    ),
    r'withFieldServiceGroupWitnessingQuantity': PropertySchema(
      id: 27,
      name: r'withFieldServiceGroupWitnessingQuantity',
      type: IsarType.int,
    ),
    r'year': PropertySchema(
      id: 28,
      name: r'year',
      type: IsarType.int,
    )
  },
  estimateSize: _reportEstimateSize,
  serialize: _reportSerialize,
  deserialize: _reportDeserialize,
  deserializeProp: _reportDeserializeProp,
  idName: r'id',
  indexes: {
    r'year_month_serviceYear': IndexSchema(
      id: 5063331407564209742,
      name: r'year_month_serviceYear',
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
          name: r'serviceYear',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _reportGetId,
  getLinks: _reportGetLinks,
  attach: _reportAttach,
  version: '3.0.5',
);

int _reportEstimateSize(
  Report object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.remarks.length * 3;
  bytesCount += 3 + object.serviceYear.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _reportSerialize(
  Report object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeInt(offsets[0], object.bibleStudies);
  writer.writeInt(offsets[1], object.businessTerritoryWitnessingHours);
  writer.writeInt(offsets[2], object.businessTerritoryWitnessingQuantity);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeInt(offsets[4], object.durationInMinutes);
  writer.writeInt(offsets[5], object.eveningWitnessingHours);
  writer.writeInt(offsets[6], object.eveningWitnessingQuantity);
  writer.writeLong(offsets[7], object.hashCode);
  writer.writeInt(offsets[8], object.informalWitnessingHours);
  writer.writeInt(offsets[9], object.informalWitnessingQuantity);
  writer.writeBool(offsets[10], object.isClosed);
  writer.writeDateTime(offsets[11], object.lastModified);
  writer.writeInt(offsets[12], object.minutesLDC);
  writer.writeByte(offsets[13], object.month);
  writer.writeInt(offsets[14], object.placements);
  writer.writeInt(offsets[15], object.publicWitnessingHours);
  writer.writeInt(offsets[16], object.publicWitnessingQuantity);
  writer.writeString(offsets[17], object.remarks);
  writer.writeInt(offsets[18], object.returnVisits);
  writer.writeString(offsets[19], object.serviceYear);
  writer.writeInt(offsets[20], object.sundayWitnessingHours);
  writer.writeInt(offsets[21], object.sundayWitnessingQuantity);
  writer.writeByte(offsets[22], object.transferredMinutes);
  writer.writeLong(offsets[23], object.transferredMinutesActivityId);
  writer.writeString(offsets[24], object.uid);
  writer.writeInt(offsets[25], object.videos);
  writer.writeInt(offsets[26], object.withFieldServiceGroupWitnessingHours);
  writer.writeInt(offsets[27], object.withFieldServiceGroupWitnessingQuantity);
  writer.writeInt(offsets[28], object.year);
}

Report _reportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Report(
    bibleStudies: reader.readIntOrNull(offsets[0]) ?? 0,
    businessTerritoryWitnessingHours: reader.readIntOrNull(offsets[1]) ?? 0,
    businessTerritoryWitnessingQuantity: reader.readIntOrNull(offsets[2]) ?? 0,
    createdAt: reader.readDateTime(offsets[3]),
    durationInMinutes: reader.readIntOrNull(offsets[4]) ?? 0,
    eveningWitnessingHours: reader.readIntOrNull(offsets[5]) ?? 0,
    eveningWitnessingQuantity: reader.readIntOrNull(offsets[6]) ?? 0,
    id: id,
    informalWitnessingHours: reader.readIntOrNull(offsets[8]) ?? 0,
    informalWitnessingQuantity: reader.readIntOrNull(offsets[9]) ?? 0,
    isClosed: reader.readBoolOrNull(offsets[10]) ?? false,
    lastModified: reader.readDateTime(offsets[11]),
    minutesLDC: reader.readIntOrNull(offsets[12]) ?? 0,
    month: reader.readByte(offsets[13]),
    placements: reader.readIntOrNull(offsets[14]) ?? 0,
    publicWitnessingHours: reader.readIntOrNull(offsets[15]) ?? 0,
    publicWitnessingQuantity: reader.readIntOrNull(offsets[16]) ?? 0,
    remarks: reader.readStringOrNull(offsets[17]) ?? '',
    returnVisits: reader.readIntOrNull(offsets[18]) ?? 0,
    serviceYear: reader.readString(offsets[19]),
    sundayWitnessingHours: reader.readIntOrNull(offsets[20]) ?? 0,
    sundayWitnessingQuantity: reader.readIntOrNull(offsets[21]) ?? 0,
    transferredMinutes: reader.readByteOrNull(offsets[22]) ?? 0,
    transferredMinutesActivityId: reader.readLongOrNull(offsets[23]) ?? -1,
    uid: reader.readStringOrNull(offsets[24]) ?? '',
    videos: reader.readIntOrNull(offsets[25]) ?? 0,
    withFieldServiceGroupWitnessingHours:
        reader.readIntOrNull(offsets[26]) ?? 0,
    withFieldServiceGroupWitnessingQuantity:
        reader.readIntOrNull(offsets[27]) ?? 0,
    year: reader.readInt(offsets[28]),
  );
  return object;
}

P _reportDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 6:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 9:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 13:
      return (reader.readByte(offset)) as P;
    case 14:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 15:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 16:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 17:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 18:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 21:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 22:
      return (reader.readByteOrNull(offset) ?? 0) as P;
    case 23:
      return (reader.readLongOrNull(offset) ?? -1) as P;
    case 24:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 25:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 26:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 27:
      return (reader.readIntOrNull(offset) ?? 0) as P;
    case 28:
      return (reader.readInt(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reportGetId(Report object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reportGetLinks(Report object) {
  return [];
}

void _reportAttach(IsarCollection<dynamic> col, Id id, Report object) {}

extension ReportQueryWhereSort on QueryBuilder<Report, Report, QWhere> {
  QueryBuilder<Report, Report, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Report, Report, QAfterWhere> anyYearMonthServiceYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'year_month_serviceYear'),
      );
    });
  }
}

extension ReportQueryWhere on QueryBuilder<Report, Report, QWhereClause> {
  QueryBuilder<Report, Report, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Report, Report, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> idBetween(
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

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearEqualToAnyMonthServiceYear(int year) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_serviceYear',
        value: [year],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearNotEqualToAnyMonthServiceYear(int year) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [],
              upper: [year],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [],
              upper: [year],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearGreaterThanAnyMonthServiceYear(
    int year, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearLessThanAnyMonthServiceYear(
    int year, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [],
        upper: [year],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearBetweenAnyMonthServiceYear(
    int lowerYear,
    int upperYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [lowerYear],
        includeLower: includeLower,
        upper: [upperYear],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToAnyServiceYear(int year, int month) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_serviceYear',
        value: [year, month],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearEqualToMonthNotEqualToAnyServiceYear(int year, int month) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year],
              upper: [year, month],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year, month],
              includeLower: false,
              upper: [year],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year, month],
              includeLower: false,
              upper: [year],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year],
              upper: [year, month],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearEqualToMonthGreaterThanAnyServiceYear(
    int year,
    int month, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year, month],
        includeLower: include,
        upper: [year],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearEqualToMonthLessThanAnyServiceYear(
    int year,
    int month, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year],
        upper: [year, month],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearEqualToMonthBetweenAnyServiceYear(
    int year,
    int lowerMonth,
    int upperMonth, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year, lowerMonth],
        includeLower: includeLower,
        upper: [year, upperMonth],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause> yearMonthServiceYearEqualTo(
      int year, int month, String serviceYear) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_serviceYear',
        value: [year, month, serviceYear],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearNotEqualTo(
          int year, int month, String serviceYear) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year, month],
              upper: [year, month, serviceYear],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year, month, serviceYear],
              includeLower: false,
              upper: [year, month],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year, month, serviceYear],
              includeLower: false,
              upper: [year, month],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'year_month_serviceYear',
              lower: [year, month],
              upper: [year, month, serviceYear],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearGreaterThan(
    int year,
    int month,
    String serviceYear, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year, month, serviceYear],
        includeLower: include,
        upper: [year, month],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearLessThan(
    int year,
    int month,
    String serviceYear, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year, month],
        upper: [year, month, serviceYear],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearBetween(
    int year,
    int month,
    String lowerServiceYear,
    String upperServiceYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year, month, lowerServiceYear],
        includeLower: includeLower,
        upper: [year, month, upperServiceYear],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearStartsWith(
          int year, int month, String ServiceYearPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'year_month_serviceYear',
        lower: [year, month, ServiceYearPrefix],
        upper: [year, month, '$ServiceYearPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearIsEmpty(int year, int month) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year_month_serviceYear',
        value: [year, month, ''],
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterWhereClause>
      yearMonthEqualToServiceYearIsNotEmpty(int year, int month) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'year_month_serviceYear',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'year_month_serviceYear',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'year_month_serviceYear',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'year_month_serviceYear',
              upper: [''],
            ));
      }
    });
  }
}

extension ReportQueryFilter on QueryBuilder<Report, Report, QFilterCondition> {
  QueryBuilder<Report, Report, QAfterFilterCondition> bibleStudiesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bibleStudies',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> bibleStudiesGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> bibleStudiesLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> bibleStudiesBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessTerritoryWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessTerritoryWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessTerritoryWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessTerritoryWitnessingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessTerritoryWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessTerritoryWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessTerritoryWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      businessTerritoryWitnessingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessTerritoryWitnessingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> durationInMinutesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
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

  QueryBuilder<Report, Report, QAfterFilterCondition> durationInMinutesLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> durationInMinutesBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eveningWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eveningWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eveningWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eveningWitnessingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eveningWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eveningWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eveningWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      eveningWitnessingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eveningWitnessingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'informalWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'informalWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'informalWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'informalWitnessingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'informalWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'informalWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'informalWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      informalWitnessingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'informalWitnessingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> isClosedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> lastModifiedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> lastModifiedGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> lastModifiedLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> lastModifiedBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> minutesLDCEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minutesLDC',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> minutesLDCGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minutesLDC',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> minutesLDCLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minutesLDC',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> minutesLDCBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minutesLDC',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> monthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> monthGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> monthLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> monthBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> placementsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placements',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> placementsGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> placementsLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> placementsBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicWitnessingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      publicWitnessingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicWitnessingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksEqualTo(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksStartsWith(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksEndsWith(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksContains(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksMatches(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> returnVisitsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnVisits',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> returnVisitsGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> returnVisitsLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> returnVisitsBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearEqualTo(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearStartsWith(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearEndsWith(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearContains(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearMatches(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceYear',
        value: '',
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> serviceYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceYear',
        value: '',
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sundayWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sundayWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sundayWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sundayWitnessingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sundayWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sundayWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sundayWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      sundayWitnessingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sundayWitnessingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> transferredMinutesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transferredMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      transferredMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transferredMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      transferredMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transferredMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> transferredMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transferredMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      transferredMinutesActivityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transferredMinutesActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      transferredMinutesActivityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transferredMinutesActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      transferredMinutesActivityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transferredMinutesActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      transferredMinutesActivityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transferredMinutesActivityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> uidGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> uidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> uidMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> videosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videos',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> videosGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> videosLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> videosBetween(
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

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withFieldServiceGroupWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'withFieldServiceGroupWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'withFieldServiceGroupWitnessingHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'withFieldServiceGroupWitnessingHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withFieldServiceGroupWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'withFieldServiceGroupWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'withFieldServiceGroupWitnessingQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition>
      withFieldServiceGroupWitnessingQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'withFieldServiceGroupWitnessingQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> yearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Report, Report, QAfterFilterCondition> yearGreaterThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> yearLessThan(
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

  QueryBuilder<Report, Report, QAfterFilterCondition> yearBetween(
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

extension ReportQueryObject on QueryBuilder<Report, Report, QFilterCondition> {}

extension ReportQueryLinks on QueryBuilder<Report, Report, QFilterCondition> {}

extension ReportQuerySortBy on QueryBuilder<Report, Report, QSortBy> {
  QueryBuilder<Report, Report, QAfterSortBy> sortByBibleStudies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByBibleStudiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByBusinessTerritoryWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByBusinessTerritoryWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByBusinessTerritoryWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByBusinessTerritoryWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByDurationInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByDurationInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByEveningWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByEveningWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByEveningWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByEveningWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByInformalWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByInformalWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByInformalWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByInformalWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByIsClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByIsClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByMinutesLDC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesLDC', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByMinutesLDCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesLDC', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByPlacements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByPlacementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByPublicWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByPublicWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByPublicWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByPublicWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByReturnVisits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByReturnVisitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByServiceYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByServiceYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortBySundayWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortBySundayWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortBySundayWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortBySundayWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByTransferredMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutes', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByTransferredMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutes', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByTransferredMinutesActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutesActivityId', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByTransferredMinutesActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutesActivityId', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByVideos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByVideosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByWithFieldServiceGroupWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withFieldServiceGroupWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByWithFieldServiceGroupWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'withFieldServiceGroupWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByWithFieldServiceGroupWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'withFieldServiceGroupWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      sortByWithFieldServiceGroupWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'withFieldServiceGroupWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension ReportQuerySortThenBy on QueryBuilder<Report, Report, QSortThenBy> {
  QueryBuilder<Report, Report, QAfterSortBy> thenByBibleStudies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByBibleStudiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bibleStudies', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByBusinessTerritoryWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByBusinessTerritoryWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByBusinessTerritoryWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByBusinessTerritoryWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessTerritoryWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByDurationInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByDurationInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInMinutes', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByEveningWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByEveningWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByEveningWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByEveningWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByInformalWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByInformalWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByInformalWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByInformalWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'informalWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByIsClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByIsClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClosed', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByMinutesLDC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesLDC', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByMinutesLDCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesLDC', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByPlacements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByPlacementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'placements', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByPublicWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByPublicWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByPublicWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByPublicWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByReturnVisits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByReturnVisitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnVisits', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByServiceYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByServiceYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceYear', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenBySundayWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenBySundayWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenBySundayWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenBySundayWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sundayWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByTransferredMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutes', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByTransferredMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutes', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByTransferredMinutesActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutesActivityId', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByTransferredMinutesActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferredMinutesActivityId', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByVideos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByVideosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videos', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByWithFieldServiceGroupWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withFieldServiceGroupWitnessingHours', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByWithFieldServiceGroupWitnessingHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'withFieldServiceGroupWitnessingHours', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByWithFieldServiceGroupWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'withFieldServiceGroupWitnessingQuantity', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy>
      thenByWithFieldServiceGroupWitnessingQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'withFieldServiceGroupWitnessingQuantity', Sort.desc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Report, Report, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension ReportQueryWhereDistinct on QueryBuilder<Report, Report, QDistinct> {
  QueryBuilder<Report, Report, QDistinct> distinctByBibleStudies() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bibleStudies');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByBusinessTerritoryWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessTerritoryWitnessingHours');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByBusinessTerritoryWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessTerritoryWitnessingQuantity');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByDurationInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInMinutes');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByEveningWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eveningWitnessingHours');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByEveningWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eveningWitnessingQuantity');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByInformalWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'informalWitnessingHours');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByInformalWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'informalWitnessingQuantity');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByIsClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isClosed');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModified');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByMinutesLDC() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minutesLDC');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByPlacements() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'placements');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByPublicWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicWitnessingHours');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByPublicWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicWitnessingQuantity');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByReturnVisits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnVisits');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByServiceYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceYear', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctBySundayWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sundayWitnessingHours');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctBySundayWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sundayWitnessingQuantity');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByTransferredMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transferredMinutes');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByTransferredMinutesActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transferredMinutesActivityId');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByVideos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videos');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByWithFieldServiceGroupWitnessingHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'withFieldServiceGroupWitnessingHours');
    });
  }

  QueryBuilder<Report, Report, QDistinct>
      distinctByWithFieldServiceGroupWitnessingQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'withFieldServiceGroupWitnessingQuantity');
    });
  }

  QueryBuilder<Report, Report, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension ReportQueryProperty on QueryBuilder<Report, Report, QQueryProperty> {
  QueryBuilder<Report, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> bibleStudiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bibleStudies');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      businessTerritoryWitnessingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessTerritoryWitnessingHours');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      businessTerritoryWitnessingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessTerritoryWitnessingQuantity');
    });
  }

  QueryBuilder<Report, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> durationInMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInMinutes');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> eveningWitnessingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eveningWitnessingHours');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      eveningWitnessingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eveningWitnessingQuantity');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      informalWitnessingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'informalWitnessingHours');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      informalWitnessingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'informalWitnessingQuantity');
    });
  }

  QueryBuilder<Report, bool, QQueryOperations> isClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isClosed');
    });
  }

  QueryBuilder<Report, DateTime, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModified');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> minutesLDCProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minutesLDC');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> placementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'placements');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> publicWitnessingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicWitnessingHours');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      publicWitnessingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicWitnessingQuantity');
    });
  }

  QueryBuilder<Report, String, QQueryOperations> remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> returnVisitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnVisits');
    });
  }

  QueryBuilder<Report, String, QQueryOperations> serviceYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceYear');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> sundayWitnessingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sundayWitnessingHours');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      sundayWitnessingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sundayWitnessingQuantity');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> transferredMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transferredMinutes');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      transferredMinutesActivityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transferredMinutesActivityId');
    });
  }

  QueryBuilder<Report, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> videosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videos');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      withFieldServiceGroupWitnessingHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'withFieldServiceGroupWitnessingHours');
    });
  }

  QueryBuilder<Report, int, QQueryOperations>
      withFieldServiceGroupWitnessingQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'withFieldServiceGroupWitnessingQuantity');
    });
  }

  QueryBuilder<Report, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      createdAt: Report._fromJson(json['createdAt'] as int),
      lastModified: Report._fromJson(json['lastModified'] as int),
      month: json['month'] as int,
      serviceYear: json['serviceYear'] as String,
      year: json['year'] as int,
      bibleStudies: json['bibleStudies'] as int? ?? 0,
      businessTerritoryWitnessingHours:
          json['businessTerritoryWitnessingHours'] as int? ?? 0,
      businessTerritoryWitnessingQuantity:
          json['businessTerritoryWitnessingQuantity'] as int? ?? 0,
      eveningWitnessingHours: json['eveningWitnessingHours'] as int? ?? 0,
      eveningWitnessingQuantity: json['eveningWitnessingQuantity'] as int? ?? 0,
      id: json['id'] as int? ?? Isar.autoIncrement,
      informalWitnessingHours: json['informalWitnessingHours'] as int? ?? 0,
      informalWitnessingQuantity:
          json['informalWitnessingQuantity'] as int? ?? 0,
      durationInMinutes: json['durationInMinutes'] as int? ?? 0,
      isClosed: json['isClosed'] as bool? ?? false,
      placements: json['placements'] as int? ?? 0,
      publicWitnessingHours: json['publicWitnessingHours'] as int? ?? 0,
      publicWitnessingQuantity: json['publicWitnessingQuantity'] as int? ?? 0,
      remarks: json['remarks'] as String? ?? '',
      returnVisits: json['returnVisits'] as int? ?? 0,
      minutesLDC: json['minutesLDC'] as int? ?? 0,
      sundayWitnessingHours: json['sundayWitnessingHours'] as int? ?? 0,
      sundayWitnessingQuantity: json['sundayWitnessingQuantity'] as int? ?? 0,
      transferredMinutes: json['transferredMinutes'] as int? ?? 0,
      transferredMinutesActivityId:
          json['transferredMinutesActivityId'] as int? ?? -1,
      uid: json['uid'] as String? ?? '',
      withFieldServiceGroupWitnessingHours:
          json['withFieldServiceGroupWitnessingHours'] as int? ?? 0,
      withFieldServiceGroupWitnessingQuantity:
          json['withFieldServiceGroupWitnessingQuantity'] as int? ?? 0,
      videos: json['videos'] as int? ?? 0,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'bibleStudies': instance.bibleStudies,
      'createdAt': Report._toJson(instance.createdAt),
      'businessTerritoryWitnessingHours':
          instance.businessTerritoryWitnessingHours,
      'businessTerritoryWitnessingQuantity':
          instance.businessTerritoryWitnessingQuantity,
      'eveningWitnessingHours': instance.eveningWitnessingHours,
      'eveningWitnessingQuantity': instance.eveningWitnessingQuantity,
      'durationInMinutes': instance.durationInMinutes,
      'informalWitnessingHours': instance.informalWitnessingHours,
      'informalWitnessingQuantity': instance.informalWitnessingQuantity,
      'isClosed': instance.isClosed,
      'lastModified': Report._toJson(instance.lastModified),
      'month': instance.month,
      'placements': instance.placements,
      'publicWitnessingHours': instance.publicWitnessingHours,
      'publicWitnessingQuantity': instance.publicWitnessingQuantity,
      'remarks': instance.remarks,
      'returnVisits': instance.returnVisits,
      'serviceYear': instance.serviceYear,
      'minutesLDC': instance.minutesLDC,
      'sundayWitnessingHours': instance.sundayWitnessingHours,
      'sundayWitnessingQuantity': instance.sundayWitnessingQuantity,
      'transferredMinutes': instance.transferredMinutes,
      'transferredMinutesActivityId': instance.transferredMinutesActivityId,
      'uid': instance.uid,
      'withFieldServiceGroupWitnessingHours':
          instance.withFieldServiceGroupWitnessingHours,
      'withFieldServiceGroupWitnessingQuantity':
          instance.withFieldServiceGroupWitnessingQuantity,
      'videos': instance.videos,
      'year': instance.year,
    };
