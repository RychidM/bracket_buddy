// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_db_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DbTournamentSchema = Schema(
  name: r'DbTournament',
  id: 6287777430220674843,
  properties: {
    r'tournamentName': PropertySchema(
      id: 0,
      name: r'tournamentName',
      type: IsarType.string,
    ),
    r'tournamentType': PropertySchema(
      id: 1,
      name: r'tournamentType',
      type: IsarType.string,
      enumMap: _DbTournamenttournamentTypeEnumValueMap,
    )
  },
  estimateSize: _dbTournamentEstimateSize,
  serialize: _dbTournamentSerialize,
  deserialize: _dbTournamentDeserialize,
  deserializeProp: _dbTournamentDeserializeProp,
);

int _dbTournamentEstimateSize(
  DbTournament object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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

void _dbTournamentSerialize(
  DbTournament object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.tournamentName);
  writer.writeString(offsets[1], object.tournamentType?.name);
}

DbTournament _dbTournamentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbTournament();
  object.tournamentName = reader.readStringOrNull(offsets[0]);
  object.tournamentType = _DbTournamenttournamentTypeValueEnumMap[
      reader.readStringOrNull(offsets[1])];
  return object;
}

P _dbTournamentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_DbTournamenttournamentTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DbTournamenttournamentTypeEnumValueMap = {
  r'league': r'league',
  r'knockout': r'knockout',
};
const _DbTournamenttournamentTypeValueEnumMap = {
  r'league': TournamentType.league,
  r'knockout': TournamentType.knockout,
};

extension DbTournamentQueryFilter
    on QueryBuilder<DbTournament, DbTournament, QFilterCondition> {
  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tournamentName',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tournamentName',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tournamentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tournamentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tournamentName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tournamentType',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tournamentType',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
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

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tournamentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tournamentType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tournamentType',
        value: '',
      ));
    });
  }

  QueryBuilder<DbTournament, DbTournament, QAfterFilterCondition>
      tournamentTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tournamentType',
        value: '',
      ));
    });
  }
}

extension DbTournamentQueryObject
    on QueryBuilder<DbTournament, DbTournament, QFilterCondition> {}
