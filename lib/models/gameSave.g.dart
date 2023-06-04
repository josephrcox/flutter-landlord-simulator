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
    r'info_day': PropertySchema(
      id: 0,
      name: r'info_day',
      type: IsarType.long,
    ),
    r'info_name': PropertySchema(
      id: 1,
      name: r'info_name',
      type: IsarType.string,
    ),
    r'money': PropertySchema(
      id: 2,
      name: r'money',
      type: IsarType.long,
    ),
    r'plotList': PropertySchema(
      id: 3,
      name: r'plotList',
      type: IsarType.object,
      target: r'PlotList',
    ),
    r'rulesNewPropCost': PropertySchema(
      id: 4,
      name: r'rulesNewPropCost',
      type: IsarType.long,
    ),
    r'rulesTaxRate': PropertySchema(
      id: 5,
      name: r'rulesTaxRate',
      type: IsarType.double,
    )
  },
  estimateSize: _gameSaveEstimateSize,
  serialize: _gameSaveSerialize,
  deserialize: _gameSaveDeserialize,
  deserializeProp: _gameSaveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'PlotList': PlotListSchema, r'Plot': PlotSchema},
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
  bytesCount += 3 + object.info_name.length * 3;
  {
    final value = object.plotList;
    if (value != null) {
      bytesCount += 3 +
          PlotListSchema.estimateSize(value, allOffsets[PlotList]!, allOffsets);
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
  writer.writeLong(offsets[0], object.info_day);
  writer.writeString(offsets[1], object.info_name);
  writer.writeLong(offsets[2], object.money);
  writer.writeObject<PlotList>(
    offsets[3],
    allOffsets,
    PlotListSchema.serialize,
    object.plotList,
  );
  writer.writeLong(offsets[4], object.rulesNewPropCost);
  writer.writeDouble(offsets[5], object.rulesTaxRate);
}

GameSave _gameSaveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameSave(
    info_day: reader.readLongOrNull(offsets[0]) ?? 1,
    info_name: reader.readStringOrNull(offsets[1]) ?? 'Save 1',
    money: reader.readLongOrNull(offsets[2]) ?? 55000,
    plotList: reader.readObjectOrNull<PlotList>(
      offsets[3],
      PlotListSchema.deserialize,
      allOffsets,
    ),
    rulesNewPropCost: reader.readLongOrNull(offsets[4]) ?? 50000,
    rulesTaxRate: reader.readDoubleOrNull(offsets[5]) ?? 0.1,
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
      return (reader.readLongOrNull(offset) ?? 55000) as P;
    case 3:
      return (reader.readObjectOrNull<PlotList>(
        offset,
        PlotListSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 50000) as P;
    case 5:
      return (reader.readDoubleOrNull(offset) ?? 0.1) as P;
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

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_dayEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info_day',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_dayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'info_day',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_dayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'info_day',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_dayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'info_day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'info_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'info_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'info_name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'info_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'info_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'info_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'info_name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> info_nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info_name',
        value: '',
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      info_nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'info_name',
        value: '',
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
}

extension GameSaveQueryObject
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {
  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> plotList(
      FilterQuery<PlotList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plotList');
    });
  }
}

extension GameSaveQueryLinks
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {}

extension GameSaveQuerySortBy on QueryBuilder<GameSave, GameSave, QSortBy> {
  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfo_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_day', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfo_dayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_day', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfo_name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_name', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByInfo_nameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_name', Sort.desc);
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

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfo_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_day', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfo_dayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_day', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfo_name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_name', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByInfo_nameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info_name', Sort.desc);
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
  QueryBuilder<GameSave, GameSave, QDistinct> distinctByInfo_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'info_day');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByInfo_name(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'info_name', caseSensitive: caseSensitive);
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

  QueryBuilder<GameSave, int, QQueryOperations> info_dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'info_day');
    });
  }

  QueryBuilder<GameSave, String, QQueryOperations> info_nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'info_name');
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
    r'rent': PropertySchema(
      id: 2,
      name: r'rent',
      type: IsarType.long,
    ),
    r'residents': PropertySchema(
      id: 3,
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
  writer.writeLong(offsets[2], object.rent);
  writer.writeLong(offsets[3], object.residents);
}

Plot _plotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plot(
    happiness: reader.readLongOrNull(offsets[0]) ?? 50,
    maxResidents: reader.readLongOrNull(offsets[1]) ?? 10,
    rent: reader.readLongOrNull(offsets[2]) ?? 400,
    residents: reader.readLongOrNull(offsets[3]) ?? 0,
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
      return (reader.readLongOrNull(offset) ?? 50) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 10) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 400) as P;
    case 3:
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

extension PlotQueryObject on QueryBuilder<Plot, Plot, QFilterCondition> {}
