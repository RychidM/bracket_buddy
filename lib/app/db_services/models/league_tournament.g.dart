// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_tournament.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LeagueTournamentSchema = Schema(
  name: r'LeagueTournament',
  id: 624187116376454888,
  properties: {
    r'leagueType': PropertySchema(
      id: 0,
      name: r'leagueType',
      type: IsarType.string,
      enumMap: _LeagueTournamentleagueTypeEnumValueMap,
    )
  },
  estimateSize: _leagueTournamentEstimateSize,
  serialize: _leagueTournamentSerialize,
  deserialize: _leagueTournamentDeserialize,
  deserializeProp: _leagueTournamentDeserializeProp,
);

int _leagueTournamentEstimateSize(
  LeagueTournament object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.leagueType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _leagueTournamentSerialize(
  LeagueTournament object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.leagueType?.name);
}

LeagueTournament _leagueTournamentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LeagueTournament();
  object.leagueType = _LeagueTournamentleagueTypeValueEnumMap[
      reader.readStringOrNull(offsets[0])];
  return object;
}

P _leagueTournamentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_LeagueTournamentleagueTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LeagueTournamentleagueTypeEnumValueMap = {
  r'singleLeg': r'singleLeg',
  r'doubleLeg': r'doubleLeg',
};
const _LeagueTournamentleagueTypeValueEnumMap = {
  r'singleLeg': LeagueType.singleLeg,
  r'doubleLeg': LeagueType.doubleLeg,
};

extension LeagueTournamentQueryFilter
    on QueryBuilder<LeagueTournament, LeagueTournament, QFilterCondition> {
  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'leagueType',
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'leagueType',
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeEqualTo(
    LeagueType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leagueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeGreaterThan(
    LeagueType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leagueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeLessThan(
    LeagueType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leagueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeBetween(
    LeagueType? lower,
    LeagueType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leagueType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'leagueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'leagueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'leagueType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'leagueType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leagueType',
        value: '',
      ));
    });
  }

  QueryBuilder<LeagueTournament, LeagueTournament, QAfterFilterCondition>
      leagueTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'leagueType',
        value: '',
      ));
    });
  }
}

extension LeagueTournamentQueryObject
    on QueryBuilder<LeagueTournament, LeagueTournament, QFilterCondition> {}
