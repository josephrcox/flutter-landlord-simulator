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
    r'economyHealth': PropertySchema(
      id: 0,
      name: r'economyHealth',
      type: IsarType.double,
    ),
    r'economyTrendIndex': PropertySchema(
      id: 1,
      name: r'economyTrendIndex',
      type: IsarType.long,
    ),
    r'economyTrends': PropertySchema(
      id: 2,
      name: r'economyTrends',
      type: IsarType.doubleList,
    ),
    r'gameOver': PropertySchema(
      id: 3,
      name: r'gameOver',
      type: IsarType.bool,
    ),
    r'infoDay': PropertySchema(
      id: 4,
      name: r'infoDay',
      type: IsarType.long,
    ),
    r'infoName': PropertySchema(
      id: 5,
      name: r'infoName',
      type: IsarType.string,
    ),
    r'infoYear': PropertySchema(
      id: 6,
      name: r'infoYear',
      type: IsarType.long,
    ),
    r'money': PropertySchema(
      id: 7,
      name: r'money',
      type: IsarType.long,
    ),
    r'plotList': PropertySchema(
      id: 8,
      name: r'plotList',
      type: IsarType.object,
      target: r'PlotList',
    ),
    r'profitHistory': PropertySchema(
      id: 9,
      name: r'profitHistory',
      type: IsarType.longList,
    ),
    r'rulesNewPropCost': PropertySchema(
      id: 10,
      name: r'rulesNewPropCost',
      type: IsarType.long,
    ),
    r'rulesTaxRate': PropertySchema(
      id: 11,
      name: r'rulesTaxRate',
      type: IsarType.double,
    ),
    r'staff': PropertySchema(
      id: 12,
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
    r'ResPlot': ResPlotSchema,
    r'Upgrades': UpgradesSchema,
    r'BusPlot': BusPlotSchema,
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
  bytesCount += 3 + object.economyTrends.length * 8;
  bytesCount += 3 + object.infoName.length * 3;
  {
    final value = object.plotList;
    if (value != null) {
      bytesCount += 3 +
          PlotListSchema.estimateSize(value, allOffsets[PlotList]!, allOffsets);
    }
  }
  bytesCount += 3 + object.profitHistory.length * 8;
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
  writer.writeDouble(offsets[0], object.economyHealth);
  writer.writeLong(offsets[1], object.economyTrendIndex);
  writer.writeDoubleList(offsets[2], object.economyTrends);
  writer.writeBool(offsets[3], object.gameOver);
  writer.writeLong(offsets[4], object.infoDay);
  writer.writeString(offsets[5], object.infoName);
  writer.writeLong(offsets[6], object.infoYear);
  writer.writeLong(offsets[7], object.money);
  writer.writeObject<PlotList>(
    offsets[8],
    allOffsets,
    PlotListSchema.serialize,
    object.plotList,
  );
  writer.writeLongList(offsets[9], object.profitHistory);
  writer.writeLong(offsets[10], object.rulesNewPropCost);
  writer.writeDouble(offsets[11], object.rulesTaxRate);
  writer.writeObject<Staff>(
    offsets[12],
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
    economyHealth: reader.readDoubleOrNull(offsets[0]) ?? 150,
    gameOver: reader.readBoolOrNull(offsets[3]) ?? false,
    infoDay: reader.readLongOrNull(offsets[4]) ?? 1,
    infoName: reader.readStringOrNull(offsets[5]) ?? 'Save 1',
    infoYear: reader.readLongOrNull(offsets[6]) ?? 1,
    money: reader.readLongOrNull(offsets[7]) ?? 75000,
    plotList: reader.readObjectOrNull<PlotList>(
      offsets[8],
      PlotListSchema.deserialize,
      allOffsets,
    ),
    rulesNewPropCost: reader.readLongOrNull(offsets[10]) ?? 50000,
    rulesTaxRate: reader.readDoubleOrNull(offsets[11]) ?? 0.1,
    staff: reader.readObjectOrNull<Staff>(
      offsets[12],
      StaffSchema.deserialize,
      allOffsets,
    ),
  );
  object.economyTrendIndex = reader.readLong(offsets[1]);
  object.economyTrends = reader.readDoubleList(offsets[2]) ?? [];
  object.id = id;
  object.profitHistory = reader.readLongList(offsets[9]) ?? [];
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
      return (reader.readDoubleOrNull(offset) ?? 150) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 5:
      return (reader.readStringOrNull(offset) ?? 'Save 1') as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 75000) as P;
    case 8:
      return (reader.readObjectOrNull<PlotList>(
        offset,
        PlotListSchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readLongList(offset) ?? []) as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 50000) as P;
    case 11:
      return (reader.readDoubleOrNull(offset) ?? 0.1) as P;
    case 12:
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
  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> economyHealthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'economyHealth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyHealthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'economyHealth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> economyHealthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'economyHealth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> economyHealthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'economyHealth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'economyTrendIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'economyTrendIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'economyTrendIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'economyTrendIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'economyTrends',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'economyTrends',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'economyTrends',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'economyTrends',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'economyTrends',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'economyTrends',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'economyTrends',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'economyTrends',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'economyTrends',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      economyTrendsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'economyTrends',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition> gameOverEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameOver',
        value: value,
      ));
    });
  }

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
      profitHistoryElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profitHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profitHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profitHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profitHistory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'profitHistory',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'profitHistory',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'profitHistory',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'profitHistory',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'profitHistory',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterFilterCondition>
      profitHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'profitHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByEconomyHealth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyHealth', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByEconomyHealthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyHealth', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByEconomyTrendIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyTrendIndex', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByEconomyTrendIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyTrendIndex', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByGameOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameOver', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> sortByGameOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameOver', Sort.desc);
    });
  }

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
  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByEconomyHealth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyHealth', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByEconomyHealthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyHealth', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByEconomyTrendIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyTrendIndex', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByEconomyTrendIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyTrendIndex', Sort.desc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByGameOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameOver', Sort.asc);
    });
  }

  QueryBuilder<GameSave, GameSave, QAfterSortBy> thenByGameOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameOver', Sort.desc);
    });
  }

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
  QueryBuilder<GameSave, GameSave, QDistinct> distinctByEconomyHealth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'economyHealth');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByEconomyTrendIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'economyTrendIndex');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByEconomyTrends() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'economyTrends');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByGameOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameOver');
    });
  }

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

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByMoney() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'money');
    });
  }

  QueryBuilder<GameSave, GameSave, QDistinct> distinctByProfitHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profitHistory');
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

  QueryBuilder<GameSave, double, QQueryOperations> economyHealthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'economyHealth');
    });
  }

  QueryBuilder<GameSave, int, QQueryOperations> economyTrendIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'economyTrendIndex');
    });
  }

  QueryBuilder<GameSave, List<double>, QQueryOperations>
      economyTrendsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'economyTrends');
    });
  }

  QueryBuilder<GameSave, bool, QQueryOperations> gameOverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameOver');
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

  QueryBuilder<GameSave, List<int>, QQueryOperations> profitHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profitHistory');
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
    r'busPlots': PropertySchema(
      id: 0,
      name: r'busPlots',
      type: IsarType.objectList,
      target: r'BusPlot',
    ),
    r'resPlots': PropertySchema(
      id: 1,
      name: r'resPlots',
      type: IsarType.objectList,
      target: r'ResPlot',
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
    final list = object.busPlots;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[BusPlot]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += BusPlotSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.resPlots;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ResPlot]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ResPlotSchema.estimateSize(value, offsets, allOffsets);
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
  writer.writeObjectList<BusPlot>(
    offsets[0],
    allOffsets,
    BusPlotSchema.serialize,
    object.busPlots,
  );
  writer.writeObjectList<ResPlot>(
    offsets[1],
    allOffsets,
    ResPlotSchema.serialize,
    object.resPlots,
  );
}

PlotList _plotListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlotList();
  object.busPlots = reader.readObjectList<BusPlot>(
    offsets[0],
    BusPlotSchema.deserialize,
    allOffsets,
    BusPlot(),
  );
  object.resPlots = reader.readObjectList<ResPlot>(
    offsets[1],
    ResPlotSchema.deserialize,
    allOffsets,
    ResPlot(),
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
      return (reader.readObjectList<BusPlot>(
        offset,
        BusPlotSchema.deserialize,
        allOffsets,
        BusPlot(),
      )) as P;
    case 1:
      return (reader.readObjectList<ResPlot>(
        offset,
        ResPlotSchema.deserialize,
        allOffsets,
        ResPlot(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlotListQueryFilter
    on QueryBuilder<PlotList, PlotList, QFilterCondition> {
  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'busPlots',
      ));
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'busPlots',
      ));
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'busPlots',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'busPlots',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'busPlots',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition>
      busPlotsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'busPlots',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition>
      busPlotsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'busPlots',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'busPlots',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resPlots',
      ));
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resPlots',
      ));
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resPlots',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resPlots',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resPlots',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition>
      resPlotsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resPlots',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition>
      resPlotsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resPlots',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resPlots',
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
  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> busPlotsElement(
      FilterQuery<BusPlot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'busPlots');
    });
  }

  QueryBuilder<PlotList, PlotList, QAfterFilterCondition> resPlotsElement(
      FilterQuery<ResPlot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'resPlots');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ResPlotSchema = Schema(
  name: r'ResPlot',
  id: -3187895061326683208,
  properties: {
    r'amenities': PropertySchema(
      id: 0,
      name: r'amenities',
      type: IsarType.object,
      target: r'Upgrades',
    ),
    r'area': PropertySchema(
      id: 1,
      name: r'area',
      type: IsarType.string,
    ),
    r'happiness': PropertySchema(
      id: 2,
      name: r'happiness',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.long,
    ),
    r'maxResidents': PropertySchema(
      id: 4,
      name: r'maxResidents',
      type: IsarType.long,
    ),
    r'propertyValue': PropertySchema(
      id: 5,
      name: r'propertyValue',
      type: IsarType.long,
    ),
    r'purchaseDate': PropertySchema(
      id: 6,
      name: r'purchaseDate',
      type: IsarType.long,
    ),
    r'rent': PropertySchema(
      id: 7,
      name: r'rent',
      type: IsarType.long,
    ),
    r'residents': PropertySchema(
      id: 8,
      name: r'residents',
      type: IsarType.long,
    ),
    r'subArea': PropertySchema(
      id: 9,
      name: r'subArea',
      type: IsarType.string,
    ),
    r'subType': PropertySchema(
      id: 10,
      name: r'subType',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _resPlotEstimateSize,
  serialize: _resPlotSerialize,
  deserialize: _resPlotDeserialize,
  deserializeProp: _resPlotDeserializeProp,
);

int _resPlotEstimateSize(
  ResPlot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.amenities;
    if (value != null) {
      bytesCount += 3 +
          UpgradesSchema.estimateSize(value, allOffsets[Upgrades]!, allOffsets);
    }
  }
  {
    final value = object.area;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subArea;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _resPlotSerialize(
  ResPlot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Upgrades>(
    offsets[0],
    allOffsets,
    UpgradesSchema.serialize,
    object.amenities,
  );
  writer.writeString(offsets[1], object.area);
  writer.writeLong(offsets[2], object.happiness);
  writer.writeLong(offsets[3], object.id);
  writer.writeLong(offsets[4], object.maxResidents);
  writer.writeLong(offsets[5], object.propertyValue);
  writer.writeLong(offsets[6], object.purchaseDate);
  writer.writeLong(offsets[7], object.rent);
  writer.writeLong(offsets[8], object.residents);
  writer.writeString(offsets[9], object.subArea);
  writer.writeString(offsets[10], object.subType);
  writer.writeString(offsets[11], object.type);
}

ResPlot _resPlotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ResPlot(
    amenities: reader.readObjectOrNull<Upgrades>(
      offsets[0],
      UpgradesSchema.deserialize,
      allOffsets,
    ),
    propertyValue: reader.readLongOrNull(offsets[5]) ?? 50000,
    purchaseDate: reader.readLongOrNull(offsets[6]) ?? -1,
    residents: reader.readLongOrNull(offsets[8]) ?? 0,
  );
  object.area = reader.readStringOrNull(offsets[1]);
  object.happiness = reader.readLong(offsets[2]);
  object.id = reader.readLong(offsets[3]);
  object.maxResidents = reader.readLong(offsets[4]);
  object.rent = reader.readLong(offsets[7]);
  object.subArea = reader.readStringOrNull(offsets[9]);
  object.subType = reader.readStringOrNull(offsets[10]);
  object.type = reader.readStringOrNull(offsets[11]);
  return object;
}

P _resPlotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Upgrades>(
        offset,
        UpgradesSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 50000) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? -1) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ResPlotQueryFilter
    on QueryBuilder<ResPlot, ResPlot, QFilterCondition> {
  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> amenitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amenities',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> amenitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amenities',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'area',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'area',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> areaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> happinessEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'happiness',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> happinessGreaterThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> happinessLessThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> happinessBetween(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> idGreaterThan(
    int value, {
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> idLessThan(
    int value, {
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> maxResidentsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxResidents',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> maxResidentsGreaterThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> maxResidentsLessThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> maxResidentsBetween(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> propertyValueEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition>
      propertyValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> propertyValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> propertyValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> purchaseDateEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> purchaseDateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> purchaseDateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> purchaseDateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> rentEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rent',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> rentGreaterThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> rentLessThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> rentBetween(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> residentsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residents',
        value: value,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> residentsGreaterThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> residentsLessThan(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> residentsBetween(
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

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subArea',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subArea',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subArea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subArea',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subArea',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subAreaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subArea',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subType',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subType',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subType',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> subTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subType',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ResPlotQueryObject
    on QueryBuilder<ResPlot, ResPlot, QFilterCondition> {
  QueryBuilder<ResPlot, ResPlot, QAfterFilterCondition> amenities(
      FilterQuery<Upgrades> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'amenities');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BusPlotSchema = Schema(
  name: r'BusPlot',
  id: 791026558307473788,
  properties: {
    r'area': PropertySchema(
      id: 0,
      name: r'area',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'propertyValue': PropertySchema(
      id: 2,
      name: r'propertyValue',
      type: IsarType.long,
    ),
    r'subarea': PropertySchema(
      id: 3,
      name: r'subarea',
      type: IsarType.string,
    ),
    r'subtype': PropertySchema(
      id: 4,
      name: r'subtype',
      type: IsarType.string,
    ),
    r'totalRevenue': PropertySchema(
      id: 5,
      name: r'totalRevenue',
      type: IsarType.long,
    )
  },
  estimateSize: _busPlotEstimateSize,
  serialize: _busPlotSerialize,
  deserialize: _busPlotDeserialize,
  deserializeProp: _busPlotDeserializeProp,
);

int _busPlotEstimateSize(
  BusPlot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.area.length * 3;
  bytesCount += 3 + object.subarea.length * 3;
  bytesCount += 3 + object.subtype.length * 3;
  return bytesCount;
}

void _busPlotSerialize(
  BusPlot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.area);
  writer.writeLong(offsets[1], object.id);
  writer.writeLong(offsets[2], object.propertyValue);
  writer.writeString(offsets[3], object.subarea);
  writer.writeString(offsets[4], object.subtype);
  writer.writeLong(offsets[5], object.totalRevenue);
}

BusPlot _busPlotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BusPlot(
    propertyValue: reader.readLongOrNull(offsets[2]) ?? 50000,
    subtype: reader.readStringOrNull(offsets[4]) ?? '',
    totalRevenue: reader.readLongOrNull(offsets[5]) ?? 0,
  );
  object.area = reader.readString(offsets[0]);
  object.id = reader.readLong(offsets[1]);
  object.subarea = reader.readString(offsets[3]);
  return object;
}

P _busPlotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 50000) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BusPlotQueryFilter
    on QueryBuilder<BusPlot, BusPlot, QFilterCondition> {
  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'area',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'area',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'area',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> areaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'area',
        value: '',
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> idGreaterThan(
    int value, {
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

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> idLessThan(
    int value, {
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

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
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

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> propertyValueEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition>
      propertyValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> propertyValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> propertyValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subarea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subarea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subarea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subarea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subarea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subarea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subarea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subarea',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subarea',
        value: '',
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subareaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subarea',
        value: '',
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtype',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtype',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtype',
        value: '',
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> subtypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtype',
        value: '',
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> totalRevenueEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRevenue',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> totalRevenueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRevenue',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> totalRevenueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRevenue',
        value: value,
      ));
    });
  }

  QueryBuilder<BusPlot, BusPlot, QAfterFilterCondition> totalRevenueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BusPlotQueryObject
    on QueryBuilder<BusPlot, BusPlot, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UpgradesSchema = Schema(
  name: r'Upgrades',
  id: 3176977477447023689,
  properties: {
    r'amenOptions': PropertySchema(
      id: 0,
      name: r'amenOptions',
      type: IsarType.stringList,
    ),
    r'amenValues': PropertySchema(
      id: 1,
      name: r'amenValues',
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
  bytesCount += 3 + object.amenOptions.length * 3;
  {
    for (var i = 0; i < object.amenOptions.length; i++) {
      final value = object.amenOptions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.amenValues.length;
  return bytesCount;
}

void _upgradesSerialize(
  Upgrades object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.amenOptions);
  writer.writeBoolList(offsets[1], object.amenValues);
}

Upgrades _upgradesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Upgrades();
  object.amenOptions = reader.readStringList(offsets[0]) ?? [];
  object.amenValues = reader.readBoolList(offsets[1]) ?? [];
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
      amenOptionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amenOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amenOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amenOptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'amenOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'amenOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amenOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amenOptions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amenOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenOptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition> amenOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenOptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenOptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenOptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenOptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenValuesElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amenValues',
        value: value,
      ));
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition> amenValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Upgrades, Upgrades, QAfterFilterCondition>
      amenValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'amenValues',
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
    r'residentVacanciesFilledByLeasingAgent': PropertySchema(
      id: 0,
      name: r'residentVacanciesFilledByLeasingAgent',
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
  writer.writeLong(offsets[0], object.residentVacanciesFilledByLeasingAgent);
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
  object.residentVacanciesFilledByLeasingAgent = reader.readLong(offsets[0]);
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
      residentVacanciesFilledByLeasingAgentEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residentVacanciesFilledByLeasingAgent',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByLeasingAgentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'residentVacanciesFilledByLeasingAgent',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByLeasingAgentLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'residentVacanciesFilledByLeasingAgent',
        value: value,
      ));
    });
  }

  QueryBuilder<Staff, Staff, QAfterFilterCondition>
      residentVacanciesFilledByLeasingAgentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'residentVacanciesFilledByLeasingAgent',
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
