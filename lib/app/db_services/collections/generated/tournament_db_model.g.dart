// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tournament_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTournamentCollection on Isar {
  IsarCollection<Tournament> get tournaments => this.collection();
}

const TournamentSchema = CollectionSchema(
  name: r'Tournament',
  id: 3840673688892599922,
  properties: {
    r'knockoutTournament': PropertySchema(
      id: 0,
      name: r'knockoutTournament',
      type: IsarType.object,
      target: r'KnockoutTournament',
    ),
    r'leagueTournament': PropertySchema(
      id: 1,
      name: r'leagueTournament',
      type: IsarType.object,
      target: r'LeagueTournament',
    ),
    r'tournamentName': PropertySchema(
      id: 2,
      name: r'tournamentName',
      type: IsarType.string,
    ),
    r'tournamentType': PropertySchema(
      id: 3,
      name: r'tournamentType',
      type: IsarType.string,
      enumMap: _TournamenttournamentTypeEnumValueMap,
    )
  },
  estimateSize: _tournamentEstimateSize,
  serialize: _tournamentSerialize,
  deserialize: _tournamentDeserialize,
  deserializeProp: _tournamentDeserializeProp,
  idName: r'tournamentId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'LeagueTournament': LeagueTournamentSchema,
    r'KnockoutTournament': KnockoutTournamentSchema
  },
  getId: _tournamentGetId,
  getLinks: _tournamentGetLinks,
  attach: _tournamentAttach,
  version: '3.1.0+1',
);

int _tournamentEstimateSize(
  Tournament object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.knockoutTournament;
    if (value != null) {
      bytesCount += 3 +
          KnockoutTournamentSchema.estimateSize(
              value, allOffsets[KnockoutTournament]!, allOffsets);
    }
  }
  {
    final value = object.leagueTournament;
    if (value != null) {
      bytesCount += 3 +
          LeagueTournamentSchema.estimateSize(
              value, allOffsets[LeagueTournament]!, allOffsets);
    }
  }
  {
    final value = object.tournamentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tournamentType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _tournamentSerialize(
  Tournament object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<KnockoutTournament>(
    offsets[0],
    allOffsets,
    KnockoutTournamentSchema.serialize,
    object.knockoutTournament,
  );
  writer.writeObject<LeagueTournament>(
    offsets[1],
    allOffsets,
    LeagueTournamentSchema.serialize,
    object.leagueTournament,
  );
  writer.writeString(offsets[2], object.tournamentName);
  writer.writeString(offsets[3], object.tournamentType?.name);
}

Tournament _tournamentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tournament();
  object.knockoutTournament = reader.readObjectOrNull<KnockoutTournament>(
    offsets[0],
    KnockoutTournamentSchema.deserialize,
    allOffsets,
  );
  object.leagueTournament = reader.readObjectOrNull<LeagueTournament>(
    offsets[1],
    LeagueTournamentSchema.deserialize,
    allOffsets,
  );
  object.tournamentId = id;
  object.tournamentName = reader.readStringOrNull(offsets[2]);
  object.tournamentType = _TournamenttournamentTypeValueEnumMap[
      reader.readStringOrNull(offsets[3])];
  return object;
}

P _tournamentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<KnockoutTournament>(
        offset,
        KnockoutTournamentSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<LeagueTournament>(
        offset,
        LeagueTournamentSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_TournamenttournamentTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TournamenttournamentTypeEnumValueMap = {
  r'league': r'league',
  r'knockout': r'knockout',
};
const _TournamenttournamentTypeValueEnumMap = {
  r'league': TournamentType.league,
  r'knockout': TournamentType.knockout,
};

Id _tournamentGetId(Tournament object) {
  return object.tournamentId;
}

List<IsarLinkBase<dynamic>> _tournamentGetLinks(Tournament object) {
  return [];
}

void _tournamentAttach(IsarCollection<dynamic> col, Id id, Tournament object) {
  object.tournamentId = id;
}

extension TournamentQueryWhereSort
    on QueryBuilder<Tournament, Tournament, QWhere> {
  QueryBuilder<Tournament, Tournament, QAfterWhere> anyTournamentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TournamentQueryWhere
    on QueryBuilder<Tournament, Tournament, QWhereClause> {
  QueryBuilder<Tournament, Tournament, QAfterWhereClause> tournamentIdEqualTo(
      Id tournamentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: tournamentId,
        upper: tournamentId,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterWhereClause>
      tournamentIdNotEqualTo(Id tournamentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: tournamentId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: tournamentId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: tournamentId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: tournamentId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterWhereClause>
      tournamentIdGreaterThan(Id tournamentId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: tournamentId, includeLower: include),
      );
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterWhereClause> tournamentIdLessThan(
      Id tournamentId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: tournamentId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterWhereClause> tournamentIdBetween(
    Id lowerTournamentId,
    Id upperTournamentId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerTournamentId,
        includeLower: includeLower,
        upper: upperTournamentId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TournamentQueryFilter
    on QueryBuilder<Tournament, Tournament, QFilterCondition> {
  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      knockoutTournamentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'knockoutTournament',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      knockoutTournamentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'knockoutTournament',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      leagueTournamentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'leagueTournament',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      leagueTournamentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'leagueTournament',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tournamentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tournamentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tournamentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tournamentName',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tournamentName',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tournamentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tournamentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tournamentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tournamentType',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tournamentType',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeEqualTo(
    TournamentType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeGreaterThan(
    TournamentType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeLessThan(
    TournamentType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeBetween(
    TournamentType? lower,
    TournamentType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tournamentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tournamentType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentType',
        value: '',
      ));
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      tournamentTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tournamentType',
        value: '',
      ));
    });
  }
}

extension TournamentQueryObject
    on QueryBuilder<Tournament, Tournament, QFilterCondition> {
  QueryBuilder<Tournament, Tournament, QAfterFilterCondition>
      knockoutTournament(FilterQuery<KnockoutTournament> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'knockoutTournament');
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterFilterCondition> leagueTournament(
      FilterQuery<LeagueTournament> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'leagueTournament');
    });
  }
}

extension TournamentQueryLinks
    on QueryBuilder<Tournament, Tournament, QFilterCondition> {}

extension TournamentQuerySortBy
    on QueryBuilder<Tournament, Tournament, QSortBy> {
  QueryBuilder<Tournament, Tournament, QAfterSortBy> sortByTournamentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentName', Sort.asc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy>
      sortByTournamentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentName', Sort.desc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy> sortByTournamentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentType', Sort.asc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy>
      sortByTournamentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentType', Sort.desc);
    });
  }
}

extension TournamentQuerySortThenBy
    on QueryBuilder<Tournament, Tournament, QSortThenBy> {
  QueryBuilder<Tournament, Tournament, QAfterSortBy> thenByTournamentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentId', Sort.asc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy> thenByTournamentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentId', Sort.desc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy> thenByTournamentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentName', Sort.asc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy>
      thenByTournamentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentName', Sort.desc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy> thenByTournamentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentType', Sort.asc);
    });
  }

  QueryBuilder<Tournament, Tournament, QAfterSortBy>
      thenByTournamentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tournamentType', Sort.desc);
    });
  }
}

extension TournamentQueryWhereDistinct
    on QueryBuilder<Tournament, Tournament, QDistinct> {
  QueryBuilder<Tournament, Tournament, QDistinct> distinctByTournamentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tournamentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Tournament, Tournament, QDistinct> distinctByTournamentType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tournamentType',
          caseSensitive: caseSensitive);
    });
  }
}

extension TournamentQueryProperty
    on QueryBuilder<Tournament, Tournament, QQueryProperty> {
  QueryBuilder<Tournament, int, QQueryOperations> tournamentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tournamentId');
    });
  }

  QueryBuilder<Tournament, KnockoutTournament?, QQueryOperations>
      knockoutTournamentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'knockoutTournament');
    });
  }

  QueryBuilder<Tournament, LeagueTournament?, QQueryOperations>
      leagueTournamentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leagueTournament');
    });
  }

  QueryBuilder<Tournament, String?, QQueryOperations> tournamentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tournamentName');
    });
  }

  QueryBuilder<Tournament, TournamentType?, QQueryOperations>
      tournamentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tournamentType');
    });
  }
}
