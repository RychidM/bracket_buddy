// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../fixtures_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFixtureCollection on Isar {
  IsarCollection<Fixture> get fixtures => this.collection();
}

const FixtureSchema = CollectionSchema(
  name: r'Fixture',
  id: 2779665279279999780,
  properties: {
    r'fixtureRoundName': PropertySchema(
      id: 0,
      name: r'fixtureRoundName',
      type: IsarType.string,
    ),
    r'matchRound': PropertySchema(
      id: 1,
      name: r'matchRound',
      type: IsarType.long,
    ),
    r'playerOneScore': PropertySchema(
      id: 2,
      name: r'playerOneScore',
      type: IsarType.long,
    ),
    r'playerTwoScore': PropertySchema(
      id: 3,
      name: r'playerTwoScore',
      type: IsarType.long,
    )
  },
  estimateSize: _fixtureEstimateSize,
  serialize: _fixtureSerialize,
  deserialize: _fixtureDeserialize,
  deserializeProp: _fixtureDeserializeProp,
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
  links: {
    r'playerOne': LinkSchema(
      id: 3937956257251945832,
      name: r'playerOne',
      target: r'Player',
      single: true,
    ),
    r'playerTwo': LinkSchema(
      id: -8104155939434258203,
      name: r'playerTwo',
      target: r'Player',
      single: true,
    ),
    r'fixtureWinner': LinkSchema(
      id: 225407294888788772,
      name: r'fixtureWinner',
      target: r'Player',
      single: true,
    ),
    r'tournament': LinkSchema(
      id: -6527774612563809017,
      name: r'tournament',
      target: r'Tournament',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _fixtureGetId,
  getLinks: _fixtureGetLinks,
  attach: _fixtureAttach,
  version: '3.1.0+1',
);

int _fixtureEstimateSize(
  Fixture object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fixtureRoundName.length * 3;
  return bytesCount;
}

void _fixtureSerialize(
  Fixture object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fixtureRoundName);
  writer.writeLong(offsets[1], object.matchRound);
  writer.writeLong(offsets[2], object.playerOneScore);
  writer.writeLong(offsets[3], object.playerTwoScore);
}

Fixture _fixtureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Fixture();
  object.fixtureId = id;
  object.fixtureRoundName = reader.readString(offsets[0]);
  object.matchRound = reader.readLongOrNull(offsets[1]);
  object.playerOneScore = reader.readLongOrNull(offsets[2]);
  object.playerTwoScore = reader.readLongOrNull(offsets[3]);
  return object;
}

P _fixtureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fixtureGetId(Fixture object) {
  return object.fixtureId;
}

List<IsarLinkBase<dynamic>> _fixtureGetLinks(Fixture object) {
  return [
    object.playerOne,
    object.playerTwo,
    object.fixtureWinner,
    object.tournament
  ];
}

void _fixtureAttach(IsarCollection<dynamic> col, Id id, Fixture object) {
  object.fixtureId = id;
  object.playerOne.attach(col, col.isar.collection<Player>(), r'playerOne', id);
  object.playerTwo.attach(col, col.isar.collection<Player>(), r'playerTwo', id);
  object.fixtureWinner
      .attach(col, col.isar.collection<Player>(), r'fixtureWinner', id);
  object.tournament
      .attach(col, col.isar.collection<Tournament>(), r'tournament', id);
}

extension FixtureQueryWhereSort on QueryBuilder<Fixture, Fixture, QWhere> {
  QueryBuilder<Fixture, Fixture, QAfterWhere> anyFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhere> anyPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'playerOneScore'),
      );
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhere> anyPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'playerTwoScore'),
      );
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhere> anyMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'matchRound'),
      );
    });
  }
}

extension FixtureQueryWhere on QueryBuilder<Fixture, Fixture, QWhereClause> {
  QueryBuilder<Fixture, Fixture, QAfterWhereClause> fixtureIdEqualTo(
      Id fixtureId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: fixtureId,
        upper: fixtureId,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> fixtureIdNotEqualTo(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> fixtureIdGreaterThan(
      Id fixtureId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: fixtureId, includeLower: include),
      );
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> fixtureIdLessThan(
      Id fixtureId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: fixtureId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> fixtureIdBetween(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerOneScore',
        value: [null],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerOneScore',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreEqualTo(
      int? playerOneScore) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerOneScore',
        value: [playerOneScore],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreNotEqualTo(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreGreaterThan(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerOneScoreBetween(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerTwoScore',
        value: [null],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'playerTwoScore',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreEqualTo(
      int? playerTwoScore) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerTwoScore',
        value: [playerTwoScore],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreNotEqualTo(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreGreaterThan(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> playerTwoScoreBetween(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchRound',
        value: [null],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchRound',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundEqualTo(
      int? matchRound) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchRound',
        value: [matchRound],
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundNotEqualTo(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundGreaterThan(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterWhereClause> matchRoundBetween(
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

extension FixtureQueryFilter
    on QueryBuilder<Fixture, Fixture, QFilterCondition> {
  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureIdGreaterThan(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureIdLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureIdBetween(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureRoundNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fixtureRoundName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fixtureRoundName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fixtureRoundName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureRoundNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fixtureRoundName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fixtureRoundName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fixtureRoundName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fixtureRoundName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureRoundNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fixtureRoundName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fixtureRoundName',
        value: '',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      fixtureRoundNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fixtureRoundName',
        value: '',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> matchRoundIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchRound',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> matchRoundIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchRound',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> matchRoundEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchRound',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> matchRoundGreaterThan(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> matchRoundLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> matchRoundBetween(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerOneScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerOneScore',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      playerOneScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerOneScore',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerOneScoreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerOneScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerOneScoreLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerOneScoreBetween(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerTwoScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerTwoScore',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
      playerTwoScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerTwoScore',
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerTwoScoreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerTwoScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition>
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerTwoScoreLessThan(
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

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerTwoScoreBetween(
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
}

extension FixtureQueryObject
    on QueryBuilder<Fixture, Fixture, QFilterCondition> {}

extension FixtureQueryLinks
    on QueryBuilder<Fixture, Fixture, QFilterCondition> {
  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerOne(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'playerOne');
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerOneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playerOne', 0, true, 0, true);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerTwo(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'playerTwo');
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> playerTwoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playerTwo', 0, true, 0, true);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureWinner(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'fixtureWinner');
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> fixtureWinnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'fixtureWinner', 0, true, 0, true);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> tournament(
      FilterQuery<Tournament> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tournament');
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterFilterCondition> tournamentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tournament', 0, true, 0, true);
    });
  }
}

extension FixtureQuerySortBy on QueryBuilder<Fixture, Fixture, QSortBy> {
  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByFixtureRoundName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureRoundName', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByFixtureRoundNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureRoundName', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByMatchRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByPlayerOneScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> sortByPlayerTwoScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.desc);
    });
  }
}

extension FixtureQuerySortThenBy
    on QueryBuilder<Fixture, Fixture, QSortThenBy> {
  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByFixtureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByFixtureRoundName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureRoundName', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByFixtureRoundNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureRoundName', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByMatchRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchRound', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByPlayerOneScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOneScore', Sort.desc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.asc);
    });
  }

  QueryBuilder<Fixture, Fixture, QAfterSortBy> thenByPlayerTwoScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerTwoScore', Sort.desc);
    });
  }
}

extension FixtureQueryWhereDistinct
    on QueryBuilder<Fixture, Fixture, QDistinct> {
  QueryBuilder<Fixture, Fixture, QDistinct> distinctByFixtureRoundName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fixtureRoundName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Fixture, Fixture, QDistinct> distinctByMatchRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchRound');
    });
  }

  QueryBuilder<Fixture, Fixture, QDistinct> distinctByPlayerOneScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerOneScore');
    });
  }

  QueryBuilder<Fixture, Fixture, QDistinct> distinctByPlayerTwoScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerTwoScore');
    });
  }
}

extension FixtureQueryProperty
    on QueryBuilder<Fixture, Fixture, QQueryProperty> {
  QueryBuilder<Fixture, int, QQueryOperations> fixtureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fixtureId');
    });
  }

  QueryBuilder<Fixture, String, QQueryOperations> fixtureRoundNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fixtureRoundName');
    });
  }

  QueryBuilder<Fixture, int?, QQueryOperations> matchRoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchRound');
    });
  }

  QueryBuilder<Fixture, int?, QQueryOperations> playerOneScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerOneScore');
    });
  }

  QueryBuilder<Fixture, int?, QQueryOperations> playerTwoScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerTwoScore');
    });
  }
}
