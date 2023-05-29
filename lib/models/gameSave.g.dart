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
    r'info_name': PropertySchema(
      id: 0,
      name: r'info_name',
      type: IsarType.string,
    ),
    r'money': PropertySchema(
      id: 1,
      name: r'money',
      type: IsarType.long,
    )
  },
  estimateSize: _gameSaveEstimateSize,
  serialize: _gameSaveSerialize,
  deserialize: _gameSaveDeserialize,
  deserializeProp: _gameSaveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
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
  return bytesCount;
}

void _gameSaveSerialize(
  GameSave object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.info_name);
  writer.writeLong(offsets[1], object.money);
}

GameSave _gameSaveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameSave(
    info_name: reader.readStringOrNull(offsets[0]) ?? 'Save 1',
    money: reader.readLongOrNull(offsets[1]) ?? 1000,
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
      return (reader.readStringOrNull(offset) ?? 'Save 1') as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 1000) as P;
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
}

extension GameSaveQueryObject
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {}

extension GameSaveQueryLinks
    on QueryBuilder<GameSave, GameSave, QFilterCondition> {}

extension GameSaveQuerySortBy on QueryBuilder<GameSave, GameSave, QSortBy> {
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
}

extension GameSaveQueryWhereDistinct
    on QueryBuilder<GameSave, GameSave, QDistinct> {
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
}

extension GameSaveQueryProperty
    on QueryBuilder<GameSave, GameSave, QQueryProperty> {
  QueryBuilder<GameSave, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
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
}
