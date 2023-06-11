// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameSave.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameSaveCollection on Isar {
  IsarCollection<GameSave> get gameSaves => this.collection();
}

const GameSaveSchema = CollectionSchema(
  name: r'GameSave',
  id: -2957817159186665000,
  properties: {
    r'infoDay': PropertySchema(
      id: 0,
      name: r'infoDay',
      type: IsarType.long,
    ),
    r'infoName': PropertySchema(
      id: 1,
      name: r'infoName',
      type: IsarType.string,
    ),
    r'infoYear': PropertySchema(
      id: 2,
      name: r'infoYear',
      type: IsarType.long,
    ),
    r'lastProfit': PropertySchema(
      id: 3,
      name: r'lastProfit',
      type: IsarType.long,
    ),
    r'money': PropertySchema(
      id: 4,
      name: r'money',
      type: IsarType.long,
    ),
    r'plotList': PropertySchema(
      id: 5,
      name: r'plotList',
      type: IsarType.object,
      target: r'PlotList',
    ),
    r'rulesNewPropCost': PropertySchema(
      id: 6,
      name: r'rulesNewPropCost',
      type: IsarType.long,
    ),
    r'rulesTaxRate': PropertySchema(
      id: 7,
      name: r'rulesTaxRate',
      type: IsarType.double,
    ),
    r'staff': PropertySchema(
      id: 8,
      name: r'staff',
      type: IsarType.object,
      target: r'Staff',
    )
  },
  estimateSize: _gameSaveEstimateSize,
  serialize: _gameSaveSerialize,
  deserialize: _gameSaveDeserialize,
  deserializeProp: _gameSaveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'PlotList': PlotListSchema,
    r'Plot': PlotSchema,
    r'Upgrades': UpgradesSchema,
    r'Staff': StaffSchema
  },
  getId: _gameSaveGetId,
  getLinks: _gameSaveGetLinks,
  attach: _gameSaveAttach,
  version: '3.1.0+1',
);

int _gameSaveEstimateSize(
  GameSave object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.infoName.length * 3;
  {
    final value = object.plotList;
    if (value != null) {
      bytesCount += 3 +
          PlotListSchema.estimateSize(value, allOffsets[PlotList]!, allOffsets);
    }
  }
  {
    final value = object.staff;
    if (value != null) {
      bytesCount +=
          3 + StaffSchema.estimateSize(value, allOffsets[Staff]!, allOffsets);
    }
  }
  return bytesCount;
}

void _gameSaveSerialize(
  GameSave object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.infoDay);
  writer.writeString(offsets[1], object.infoName);
  writer.writeLong(offsets[2], object.infoYear);
  writer.writeLong(offsets[3], object.lastProfit);
  writer.writeLong(offsets[4], object.money);
  writer.writeObject<PlotList>(
    offsets[5],
    allOffsets,
    PlotListSchema.serialize,
    object.plotList,
  );
  writer.writeLong(offsets[6], object.rulesNewPropCost);
  writer.writeDouble(offsets[7], object.rulesTaxRate);
  writer.writeObject<Staff>(
    offsets[8],
    allOffsets,
    StaffSchema.serialize,
    object.staff,
  );
}

GameSave _gameSaveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameSave(
    infoDay: reader.readLongOrNull(offsets[0]) ?? 1,
    infoName: reader.readStringOrNull(offsets[1]) ?? 'Save 1',
    infoYear: reader.readLongOrNull(offsets[2]) ?? 1,
    lastProfit: reader.readLongOrNull(offsets[3]) ?? 0,
    money: reader.readLongOrNull(offsets[4]) ?? 55000,
    plotList: reader.readObjectOrNull<PlotList>(
      offsets[5],
      PlotListSchema.deserialize,
      allOffsets,
    ),
    rulesNewPropCost: reader.readLongOrNull(offsets[6]) ?? 50000,
    rulesTaxRate: reader.readDoubleOrNull(offsets[7]) ?? 0.1,
    staff: reader.readObjectOrNull<Staff>(
      offsets[8],
      StaffSchema.deserialize,
      allOffsets,
    ),
  );
  object.id = id;
  return object;
}

P _gameSaveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? 'Save 1') as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 55000) as P;
    case 5:
      return (reader.readObjectOrNull<PlotList>(
        offset,
        PlotListSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 50000) as P;
    case 7:
      return (reader.readDoubleOrNull(offset) ?? 0.1) as P;
    case 8:
      return (reader.readObjectOrNull<Staff>(
        offset,
        StaffSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameSaveGetId(GameSave object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameSaveGetLinks(GameSave object) {
  return [];
}

void _gameSaveAttach(IsarCollection<dynamic> col, Id id, GameSave object) {
  object.id = id;
}

extension GameSaveQueryWhereSort on QueryBuilder<GameSave, GameSave, QWhere> {
  QueryBuilder<GameSave, GameSave, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameSaveQueryWhere on QueryBuilder<GameSave, GameSave, QWhereClause> {
  QueryBuilder<GameSave, GameSave, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GameSave, GameSave, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterWhereClause> idBetween(
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
}

extension GameSaveQueryFilter
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {
  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoDayEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoDay',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoDay',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoDay',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'infoName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoName',
        value: '',
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'infoName',
        value: '',
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoYearEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoYear',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoYearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoYear',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoYearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoYear',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> infoYearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> lastProfitEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastProfit',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> lastProfitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastProfit',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> lastProfitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastProfit',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> lastProfitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastProfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> moneyEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'money',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> moneyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'money',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> moneyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'money',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> moneyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'money',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> plotListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plotList',
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> plotListIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plotList',
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      rulesNewPropCostEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rulesNewPropCost',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      rulesNewPropCostGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rulesNewPropCost',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      rulesNewPropCostLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rulesNewPropCost',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      rulesNewPropCostBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rulesNewPropCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> rulesTaxRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rulesTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      rulesTaxRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rulesTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> rulesTaxRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rulesTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> rulesTaxRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rulesTaxRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> staffIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'staff',
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> staffIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'staff',
      ));
    });
  }
}

extension GameSaveQueryObject
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {
  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> plotList(
      FilterQuery<PlotList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plotList');
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> staff(
      FilterQuery<Staff> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'staff');
    });
  }
}

extension GameSaveQueryLinks
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {}

extension GameSaveQuerySortBy on QueryBuilder<GameSave, GameSave, QSortBy> {
  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfoDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoDay', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfoDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoDay', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoName', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoName', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfoYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoYear', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfoYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoYear', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByLastProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProfit', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByLastProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProfit', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByMoney() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'money', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByMoneyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'money', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByRulesNewPropCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesNewPropCost', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByRulesNewPropCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesNewPropCost', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByRulesTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesTaxRate', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByRulesTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesTaxRate', Sort.desc);
    });
  }
}

extension GameSaveQuerySortThenBy
    on QueryBuilder<GameSave, GameSave, QSortThenBy> {
  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfoDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoDay', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfoDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoDay', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoName', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoName', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfoYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoYear', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfoYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoYear', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByLastProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProfit', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByLastProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProfit', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByMoney() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'money', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByMoneyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'money', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByRulesNewPropCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesNewPropCost', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByRulesNewPropCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesNewPropCost', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByRulesTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesTaxRate', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByRulesTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rulesTaxRate', Sort.desc);
    });
  }
}

extension GameSaveQueryWhereDistinct
    on QueryBuilder<GameSave, GameSave, QDistinct> {
  QueryBuilder<GameSave, GameSave, QDistinct> distinctByInfoDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoDay');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByInfoName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByInfoYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoYear');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByLastProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastProfit');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByMoney() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'money');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByRulesNewPropCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rulesNewPropCost');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByRulesTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rulesTaxRate');
    });
  }
}

extension GameSaveQueryProperty
    on QueryBuilder<GameSave, GameSave, QQueryProperty> {
  QueryBuilder<GameSave, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameSave, int, QQueryOperations> infoDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoDay');
    });
  }

  QueryBuilder<GameSave, String, QQueryOperations> infoNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoName');
    });
  }

  QueryBuilder<GameSave, int, QQueryOperations> infoYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoYear');
    });
  }

  QueryBuilder<GameSave, int, QQueryOperations> lastProfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastProfit');
    });
  }

  QueryBuilder<GameSave, int, QQueryOperations> moneyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'money');
    });
  }

  QueryBuilder<GameSave, PlotList?, QQueryOperations> plotListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plotList');
    });
  }

  QueryBuilder<GameSave, int, QQueryOperations> rulesNewPropCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rulesNewPropCost');
    });
  }

  QueryBuilder<GameSave, double, QQueryOperations> rulesTaxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rulesTaxRate');
    });
  }

  QueryBuilder<GameSave, Staff?, QQueryOperations> staffProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'staff');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlotListSchema = Schema(
  name: r'PlotList',
  id: -3544980990120019457,
  properties: {
    r'plots': PropertySchema(
      id: 0,
      name: r'plots',
      type: IsarType.objectList,
      target: r'Plot',
    )
  },
  estimateSize: _plotListEstimateSize,
  serialize: _plotListSerialize,
  deserialize: _plotListDeserialize,
  deserializeProp: _plotListDeserializeProp,
);

int _plotListEstimateSize(
  PlotList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.plots;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Plot]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += PlotSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _plotListSerialize(
  PlotList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Plot>(
    offsets[0],
    allOffsets,
    PlotSchema.serialize,
    object.plots,
  );
}

PlotList _plotListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlotList();
  object.plots = reader.readObjectList<Plot>(
    offsets[0],
    PlotSchema.deserialize,
    allOffsets,
    Plot(),
  );
  return object;
}

P _plotListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Plot>(
        offset,
        PlotSchema.deserialize,
        allOffsets,
        Plot(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlotListQueryFilter
    on QueryBuilder<PlotList, PlotList, QFilterCondition> {
  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plots',
      ));
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plots',
      ));
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition>
      plotsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'plots',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PlotListQueryObject
    on QueryBuilder<PlotList, PlotList, QFilterCondition> {
  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> plotsElement(
      FilterQuery<Plot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plots');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlotSchema = Schema(
  name: r'Plot',
  id: -6891091333884084029,
  properties: {
    r'happiness': PropertySchema(
      id: 0,
      name: r'happiness',
      type: IsarType.long,
    ),
    r'maxResidents': PropertySchema(
      id: 1,
      name: r'maxResidents',
      type: IsarType.long,
    ),
    r'plotUpgrades': PropertySchema(
      id: 2,
      name: r'plotUpgrades',
      type: IsarType.object,
      target: r'Upgrades',
    ),
    r'rent': PropertySchema(
      id: 3,
      name: r'rent',
      type: IsarType.long,
    ),
    r'residents': PropertySchema(
      id: 4,
      name: r'residents',
      type: IsarType.long,
    )
  },
  estimateSize: _plotEstimateSize,
  serialize: _plotSerialize,
  deserialize: _plotDeserialize,
  deserializeProp: _plotDeserializeProp,
);

int _plotEstimateSize(
  Plot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.plotUpgrades;
    if (value != null) {
      bytesCount += 3 +
          UpgradesSchema.estimateSize(value, allOffsets[Upgrades]!, allOffsets);
    }
  }
  return bytesCount;
}

void _plotSerialize(
  Plot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.happiness);
  writer.writeLong(offsets[1], object.maxResidents);
  writer.writeObject<Upgrades>(
    offsets[2],
    allOffsets,
    UpgradesSchema.serialize,
    object.plotUpgrades,
  );
  writer.writeLong(offsets[3], object.rent);
  writer.writeLong(offsets[4], object.residents);
}

Plot _plotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plot(
    happiness: reader.readLongOrNull(offsets[0]) ?? 100,
    maxResidents: reader.readLongOrNull(offsets[1]) ?? 10,
    plotUpgrades: reader.readObjectOrNull<Upgrades>(
      offsets[2],
      UpgradesSchema.deserialize,
      allOffsets,
    ),
    rent: reader.readLongOrNull(offsets[3]) ?? 500,
    residents: reader.readLongOrNull(offsets[4]) ?? 0,
  );
  return object;
}

P _plotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 100) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 10) as P;
    case 2:
      return (reader.readObjectOrNull<Upgrades>(
        offset,
        UpgradesSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 500) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlotQueryFilter on QueryBuilder<Plot, Plot, QFilterCondition> {
  QueryBuilder<Plot, Plot, QAfterFilterCondition> happinessEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'happiness',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> happinessGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'happiness',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> happinessLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'happiness',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> happinessBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'happiness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> maxResidentsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxResidents',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> maxResidentsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxResidents',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> maxResidentsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxResidents',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> maxResidentsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxResidents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> plotUpgradesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plotUpgrades',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> plotUpgradesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plotUpgrades',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> rentEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rent',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> rentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rent',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> rentLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rent',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> rentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> residentsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residents',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> residentsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'residents',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> residentsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'residents',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> residentsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'residents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlotQueryObject on QueryBuilder<Plot, Plot, QFilterCondition> {
  QueryBuilder<Plot, Plot, QAfterFilterCondition> plotUpgrades(
      FilterQuery<Upgrades> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plotUpgrades');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UpgradesSchema = Schema(
  name: r'Upgrades',
  id: 3176977477447023689,
  properties: {
    r'upgradeOptions': PropertySchema(
      id: 0,
      name: r'upgradeOptions',
      type: IsarType.stringList,
    ),
    r'upgradeValues': PropertySchema(
      id: 1,
      name: r'upgradeValues',
      type: IsarType.boolList,
    )
  },
  estimateSize: _upgradesEstimateSize,
  serialize: _upgradesSerialize,
  deserialize: _upgradesDeserialize,
  deserializeProp: _upgradesDeserializeProp,
);

int _upgradesEstimateSize(
  Upgrades object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.upgradeOptions.length * 3;
  {
    for (var i = 0; i < object.upgradeOptions.length; i++) {
      final value = object.upgradeOptions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.upgradeValues.length;
  return bytesCount;
}

void _upgradesSerialize(
  Upgrades object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.upgradeOptions);
  writer.writeBoolList(offsets[1], object.upgradeValues);
}

Upgrades _upgradesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Upgrades();
  object.upgradeOptions = reader.readStringList(offsets[0]) ?? [];
  object.upgradeValues = reader.readBoolList(offsets[1]) ?? [];
  return object;
}

P _upgradesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readBoolList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UpgradesQueryFilter
    on QueryBuilder<Upgrades, Upgrades, QFilterCondition> {
  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upgradeOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upgradeOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upgradeOptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'upgradeOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'upgradeOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'upgradeOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'upgradeOptions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'upgradeOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeOptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeOptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeOptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeOptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeOptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeValues',
        value: value,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      upgradeValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'upgradeValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension UpgradesQueryObject
    on QueryBuilder<Upgrades, Upgrades, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StaffSchema = Schema(
  name: r'Staff',
  id: -1348815836572273625,
  properties: {
    r'residentVacanciesFilledByPropertyManager': PropertySchema(
      id: 0,
      name: r'residentVacanciesFilledByPropertyManager',
      type: IsarType.long,
    ),
    r'staffOptions': PropertySchema(
      id: 1,
      name: r'staffOptions',
      type: IsarType.stringList,
    ),
    r'staffValues': PropertySchema(
      id: 2,
      name: r'staffValues',
      type: IsarType.boolList,
    )
  },
  estimateSize: _staffEstimateSize,
  serialize: _staffSerialize,
  deserialize: _staffDeserialize,
  deserializeProp: _staffDeserializeProp,
);

int _staffEstimateSize(
  Staff object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.staffOptions.length * 3;
  {
    for (var i = 0; i < object.staffOptions.length; i++) {
      final value = object.staffOptions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.staffValues.length;
  return bytesCount;
}

void _staffSerialize(
  Staff object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.residentVacanciesFilledByPropertyManager);
  writer.writeStringList(offsets[1], object.staffOptions);
  writer.writeBoolList(offsets[2], object.staffValues);
}

Staff _staffDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Staff();
  object.residentVacanciesFilledByPropertyManager = reader.readLong(offsets[0]);
  object.staffOptions = reader.readStringList(offsets[1]) ?? [];
  object.staffValues = reader.readBoolList(offsets[2]) ?? [];
  return object;
}

P _staffDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readBoolList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension StaffQueryFilter on QueryBuilder<Staff, Staff, QFilterCondition> {
  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByPropertyManagerEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residentVacanciesFilledByPropertyManager',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByPropertyManagerGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'residentVacanciesFilledByPropertyManager',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByPropertyManagerLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'residentVacanciesFilledByPropertyManager',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByPropertyManagerBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'residentVacanciesFilledByPropertyManager',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      staffOptionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'staffOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'staffOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'staffOptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      staffOptionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'staffOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'staffOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'staffOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'staffOptions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      staffOptionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      staffOptionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'staffOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffOptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffOptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffOptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffOptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      staffOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffOptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffValuesElementEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'staffValues',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffValuesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      staffValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition> staffValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'staffValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension StaffQueryObject on QueryBuilder<Staff, Staff, QFilterCondition> {}
