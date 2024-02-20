// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFixturesCollection on Isar {
  IsarCollection<Fixtures> get fixtures => this.collection();
}

const FixturesSchema = CollectionSchema(
  name: r'Fixtures',
  id: 1213557845256013914,
  properties: {
    r'matchRound': PropertySchema(
      id: 0,
      name: r'matchRound',
      type: IsarType.long,
    ),
    r'playerOne': PropertySchema(
      id: 1,
      name: r'playerOne',
      type: IsarType.object,
      target: r'DbPlayer',
    ),
    r'playerOneScore': PropertySchema(
      id: 2,
      name: r'playerOneScore',
      type: IsarType.long,
    ),
    r'playerTwo': PropertySchema(
      id: 3,
      name: r'playerTwo',
      type: IsarType.object,
      target: r'DbPlayer',
    ),
    r'playerTwoScore': PropertySchema(
      id: 4,
      name: r'playerTwoScore',
      type: IsarType.long,
    ),
    r'tournament': PropertySchema(
      id: 5,
      name: r'tournament',
      type: IsarType.object,
      target: r'DbTournament',
    )
  },
  estimateSize: _fixturesEstimateSize,
  serialize: _fixturesSerialize,
  deserialize: _fixturesDeserialize,
  deserializeProp: _fixturesDeserializeProp,
  idName: r'fixtureId',
  indexes: {
    r'playerOneScore': IndexSchema(
      id: 4309166036387475089,
      name: r'playerOneScore',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'playerOneScore',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'playerTwoScore': IndexSchema(
      id: -3285249242515412361,
      name: r'playerTwoScore',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'playerTwoScore',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'matchRound': IndexSchema(
      id: -7351132893835632960,
      name: r'matchRound',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'matchRound',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'DbPlayer': DbPlayerSchema,
    r'DbTournament': DbTournamentSchema
  },
  getId: _fixturesGetId,
  getLinks: _fixturesGetLinks,
  attach: _fixturesAttach,
  version: '3.1.0+1',
);

int _fixturesEstimateSize(
  Fixtures object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.playerOne;
    if (value != null) {
      bytesCount += 3 +
          DbPlayerSchema.estimateSize(value, allOffsets[DbPlayer]!, allOffsets);
    }
  }
  {
    final value = object.playerTwo;
    if (value != null) {
      bytesCount += 3 +
          DbPlayerSchema.estimateSize(value, allOffsets[DbPlayer]!, allOffsets);
    }
  }
  {
    final value = object.tournament;
    if (value != null) {
      bytesCount += 3 +
          DbTournamentSchema.estimateSize(
              value, allOffsets[DbTournament]!, allOffsets);
    }
  }
  return bytesCount;
}

void _fixturesSerialize(
  Fixtures object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.matchRound);
  writer.writeObject<DbPlayer>(
    offsets[1],
    allOffsets,
    DbPlayerSchema.serialize,
    object.playerOne,
  );
  writer.writeLong(offsets[2], object.playerOneScore);
  writer.writeObject<DbPlayer>(
    offsets[3],
    allOffsets,
    DbPlayerSchema.serialize,
    object.playerTwo,
  );
  writer.writeLong(offsets[4], object.playerTwoScore);
  writer.writeObject<DbTournament>(
    offsets[5],
    allOffsets,
    DbTournamentSchema.serialize,
    object.tournament,
  );
}

Fixtures _fixturesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Fixtures(
    matchRound: reader.readLongOrNull(offsets[0]),
    playerOne: reader.readObjectOrNull<DbPlayer>(
      offsets[1],
      DbPlayerSchema.deserialize,
      allOffsets,
    ),
    playerOneScore: reader.readLongOrNull(offsets[2]),
    playerTwo: reader.readObjectOrNull<DbPlayer>(
      offsets[3],
      DbPlayerSchema.deserialize,
      allOffsets,
    ),
    playerTwoScore: reader.readLongOrNull(offsets[4]),
    tournament: reader.readObjectOrNull<DbTournament>(
      offsets[5],
      DbTournamentSchema.deserialize,
      allOffsets,
    ),
  );
  object.fixtureId = id;
  return object;
}

P _fixturesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<DbPlayer>(
        offset,
        DbPlayerSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<DbPlayer>(
        offset,
        DbPlayerSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<DbTournament>(
        offset,
        DbTournamentSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fixturesGetId(Fixtures object) {
  return object.fixtureId;
}

List<IsarLinkBase<dynamic>> _fixturesGetLinks(Fixtures object) {
  return [];
}

void _fixturesAttach(IsarCollection<dynamic> col, Id id, Fixtures object) {
  object.fixtureId = id;
}

extension FixturesQueryWhereSort on QueryBuilder<Fixtures, Fixtures, QWhere> {
  QueryBuilder<Fixtures, Fixtures, QAfterWhere> anyFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhere> anyPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'playerOneScore'),
      );
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhere> anyPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'playerTwoScore'),
      );
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhere> anyMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'matchRound'),
      );
    });
  }
}

extension FixturesQueryWhere on QueryBuilder<Fixtures, Fixtures, QWhereClause> {
  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> fixtureIdEqualTo(
      Id fixtureId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: fixtureId,
        upper: fixtureId,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> fixtureIdNotEqualTo(
      Id fixtureId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: fixtureId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: fixtureId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: fixtureId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: fixtureId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> fixtureIdGreaterThan(
      Id fixtureId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: fixtureId, includeLower: include),
      );
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> fixtureIdLessThan(
      Id fixtureId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: fixtureId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> fixtureIdBetween(
    Id lowerFixtureId,
    Id upperFixtureId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerFixtureId,
        includeLower: includeLower,
        upper: upperFixtureId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerOneScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerOneScore',
        value: [null],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause>
      playerOneScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerOneScore',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerOneScoreEqualTo(
      int? playerOneScore) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerOneScore',
        value: [playerOneScore],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerOneScoreNotEqualTo(
      int? playerOneScore) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerOneScore',
              lower: [],
              upper: [playerOneScore],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerOneScore',
              lower: [playerOneScore],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerOneScore',
              lower: [playerOneScore],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerOneScore',
              lower: [],
              upper: [playerOneScore],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerOneScoreGreaterThan(
    int? playerOneScore, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerOneScore',
        lower: [playerOneScore],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerOneScoreLessThan(
    int? playerOneScore, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerOneScore',
        lower: [],
        upper: [playerOneScore],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerOneScoreBetween(
    int? lowerPlayerOneScore,
    int? upperPlayerOneScore, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerOneScore',
        lower: [lowerPlayerOneScore],
        includeLower: includeLower,
        upper: [upperPlayerOneScore],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerTwoScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerTwoScore',
        value: [null],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause>
      playerTwoScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerTwoScore',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerTwoScoreEqualTo(
      int? playerTwoScore) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerTwoScore',
        value: [playerTwoScore],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerTwoScoreNotEqualTo(
      int? playerTwoScore) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerTwoScore',
              lower: [],
              upper: [playerTwoScore],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerTwoScore',
              lower: [playerTwoScore],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerTwoScore',
              lower: [playerTwoScore],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerTwoScore',
              lower: [],
              upper: [playerTwoScore],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerTwoScoreGreaterThan(
    int? playerTwoScore, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerTwoScore',
        lower: [playerTwoScore],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerTwoScoreLessThan(
    int? playerTwoScore, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerTwoScore',
        lower: [],
        upper: [playerTwoScore],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> playerTwoScoreBetween(
    int? lowerPlayerTwoScore,
    int? upperPlayerTwoScore, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerTwoScore',
        lower: [lowerPlayerTwoScore],
        includeLower: includeLower,
        upper: [upperPlayerTwoScore],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchRound',
        value: [null],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchRound',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundEqualTo(
      int? matchRound) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchRound',
        value: [matchRound],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundNotEqualTo(
      int? matchRound) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchRound',
              lower: [],
              upper: [matchRound],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchRound',
              lower: [matchRound],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchRound',
              lower: [matchRound],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchRound',
              lower: [],
              upper: [matchRound],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundGreaterThan(
    int? matchRound, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchRound',
        lower: [matchRound],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundLessThan(
    int? matchRound, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchRound',
        lower: [],
        upper: [matchRound],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterWhereClause> matchRoundBetween(
    int? lowerMatchRound,
    int? upperMatchRound, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchRound',
        lower: [lowerMatchRound],
        includeLower: includeLower,
        upper: [upperMatchRound],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FixturesQueryFilter
    on QueryBuilder<Fixtures, Fixtures, QFilterCondition> {
  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> fixtureIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> fixtureIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> fixtureIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> fixtureIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fixtureId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> matchRoundIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchRound',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      matchRoundIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchRound',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> matchRoundEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchRound',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> matchRoundGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchRound',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> matchRoundLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchRound',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> matchRoundBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchRound',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerOneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerOne',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerOneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerOne',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerOneScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerOneScore',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerOneScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerOneScore',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerOneScoreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerOneScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerOneScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerOneScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerOneScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerOneScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerOneScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerOneScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerTwoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerTwo',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerTwoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerTwo',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerTwoScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerTwoScore',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerTwoScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerTwoScore',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerTwoScoreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerTwoScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerTwoScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerTwoScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      playerTwoScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerTwoScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerTwoScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerTwoScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> tournamentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tournament',
      ));
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition>
      tournamentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tournament',
      ));
    });
  }
}

extension FixturesQueryObject
    on QueryBuilder<Fixtures, Fixtures, QFilterCondition> {
  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerOne(
      FilterQuery<DbPlayer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'playerOne');
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> playerTwo(
      FilterQuery<DbPlayer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'playerTwo');
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterFilterCondition> tournament(
      FilterQuery<DbTournament> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tournament');
    });
  }
}

extension FixturesQueryLinks
    on QueryBuilder<Fixtures, Fixtures, QFilterCondition> {}

extension FixturesQuerySortBy on QueryBuilder<Fixtures, Fixtures, QSortBy> {
  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> sortByMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> sortByMatchRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.desc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> sortByPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> sortByPlayerOneScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.desc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> sortByPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> sortByPlayerTwoScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.desc);
    });
  }
}

extension FixturesQuerySortThenBy
    on QueryBuilder<Fixtures, Fixtures, QSortThenBy> {
  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByFixtureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.desc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByMatchRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.desc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByPlayerOneScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.desc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.asc);
    });
  }

  QueryBuilder<Fixtures, Fixtures, QAfterSortBy> thenByPlayerTwoScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.desc);
    });
  }
}

extension FixturesQueryWhereDistinct
    on QueryBuilder<Fixtures, Fixtures, QDistinct> {
  QueryBuilder<Fixtures, Fixtures, QDistinct> distinctByMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchRound');
    });
  }

  QueryBuilder<Fixtures, Fixtures, QDistinct> distinctByPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerOneScore');
    });
  }

  QueryBuilder<Fixtures, Fixtures, QDistinct> distinctByPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerTwoScore');
    });
  }
}

extension FixturesQueryProperty
    on QueryBuilder<Fixtures, Fixtures, QQueryProperty> {
  QueryBuilder<Fixtures, int, QQueryOperations> fixtureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fixtureId');
    });
  }

  QueryBuilder<Fixtures, int?, QQueryOperations> matchRoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchRound');
    });
  }

  QueryBuilder<Fixtures, DbPlayer?, QQueryOperations> playerOneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerOne');
    });
  }

  QueryBuilder<Fixtures, int?, QQueryOperations> playerOneScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerOneScore');
    });
  }

  QueryBuilder<Fixtures, DbPlayer?, QQueryOperations> playerTwoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerTwo');
    });
  }

  QueryBuilder<Fixtures, int?, QQueryOperations> playerTwoScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerTwoScore');
    });
  }

  QueryBuilder<Fixtures, DbTournament?, QQueryOperations> tournamentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tournament');
    });
  }
}
