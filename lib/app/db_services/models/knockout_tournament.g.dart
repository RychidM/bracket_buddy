// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knockout_tournament.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const KnockoutTournamentSchema = Schema(
  name: r'KnockoutTournament',
  id: 4656920279364894175,
  properties: {
    r'currentRound': PropertySchema(
      id: 0,
      name: r'currentRound',
      type: IsarType.long,
    )
  },
  estimateSize: _knockoutTournamentEstimateSize,
  serialize: _knockoutTournamentSerialize,
  deserialize: _knockoutTournamentDeserialize,
  deserializeProp: _knockoutTournamentDeserializeProp,
);

int _knockoutTournamentEstimateSize(
  KnockoutTournament object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _knockoutTournamentSerialize(
  KnockoutTournament object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentRound);
}

KnockoutTournament _knockoutTournamentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KnockoutTournament();
  object.currentRound = reader.readLong(offsets[0]);
  return object;
}

P _knockoutTournamentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension KnockoutTournamentQueryFilter
    on QueryBuilder<KnockoutTournament, KnockoutTournament, QFilterCondition> {
  QueryBuilder<KnockoutTournament, KnockoutTournament, QAfterFilterCondition>
      currentRoundEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentRound',
        value: value,
      ));
    });
  }

  QueryBuilder<KnockoutTournament, KnockoutTournament, QAfterFilterCondition>
      currentRoundGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentRound',
        value: value,
      ));
    });
  }

  QueryBuilder<KnockoutTournament, KnockoutTournament, QAfterFilterCondition>
      currentRoundLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentRound',
        value: value,
      ));
    });
  }

  QueryBuilder<KnockoutTournament, KnockoutTournament, QAfterFilterCondition>
      currentRoundBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentRound',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KnockoutTournamentQueryObject
    on QueryBuilder<KnockoutTournament, KnockoutTournament, QFilterCondition> {}
