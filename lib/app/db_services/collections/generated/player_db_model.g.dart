// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../player_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerCollection on Isar {
  IsarCollection<Player> get players => this.collection();
}

const PlayerSchema = CollectionSchema(
  name: r'Player',
  id: -1052842935974721688,
  properties: {
    r'avatar': PropertySchema(
      id: 0,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'gamerTag': PropertySchema(
      id: 1,
      name: r'gamerTag',
      type: IsarType.string,
    ),
    r'isSelected': PropertySchema(
      id: 2,
      name: r'isSelected',
      type: IsarType.bool,
    ),
    r'points': PropertySchema(
      id: 3,
      name: r'points',
      type: IsarType.long,
    ),
    r'winStatus': PropertySchema(
      id: 4,
      name: r'winStatus',
      type: IsarType.bool,
    )
  },
  estimateSize: _playerEstimateSize,
  serialize: _playerSerialize,
  deserialize: _playerDeserialize,
  deserializeProp: _playerDeserializeProp,
  idName: r'playerId',
  indexes: {
    r'gamerTag': IndexSchema(
      id: -4918746510061473483,
      name: r'gamerTag',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'gamerTag',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'points': IndexSchema(
      id: 4015994326363592107,
      name: r'points',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'points',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'winStatus': IndexSchema(
      id: -6786608353175219777,
      name: r'winStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'winStatus',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'tournaments': LinkSchema(
      id: -7870942891485501450,
      name: r'tournaments',
      target: r'Tournament',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _playerGetId,
  getLinks: _playerGetLinks,
  attach: _playerAttach,
  version: '3.1.0+1',
);

int _playerEstimateSize(
  Player object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.avatar.length * 3;
  bytesCount += 3 + object.gamerTag.length * 3;
  return bytesCount;
}

void _playerSerialize(
  Player object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatar);
  writer.writeString(offsets[1], object.gamerTag);
  writer.writeBool(offsets[2], object.isSelected);
  writer.writeLong(offsets[3], object.points);
  writer.writeBool(offsets[4], object.winStatus);
}

Player _playerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Player();
  object.avatar = reader.readString(offsets[0]);
  object.gamerTag = reader.readString(offsets[1]);
  object.isSelected = reader.readBool(offsets[2]);
  object.playerId = id;
  object.points = reader.readLong(offsets[3]);
  object.winStatus = reader.readBool(offsets[4]);
  return object;
}

P _playerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playerGetId(Player object) {
  return object.playerId;
}

List<IsarLinkBase<dynamic>> _playerGetLinks(Player object) {
  return [object.tournaments];
}

void _playerAttach(IsarCollection<dynamic> col, Id id, Player object) {
  object.playerId = id;
  object.tournaments
      .attach(col, col.isar.collection<Tournament>(), r'tournaments', id);
}

extension PlayerQueryWhereSort on QueryBuilder<Player, Player, QWhere> {
  QueryBuilder<Player, Player, QAfterWhere> anyPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Player, Player, QAfterWhere> anyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'points'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhere> anyWinStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'winStatus'),
      );
    });
  }
}

extension PlayerQueryWhere on QueryBuilder<Player, Player, QWhereClause> {
  QueryBuilder<Player, Player, QAfterWhereClause> playerIdEqualTo(Id playerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: playerId,
        upper: playerId,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> playerIdNotEqualTo(
      Id playerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: playerId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: playerId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: playerId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: playerId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> playerIdGreaterThan(
      Id playerId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: playerId, includeLower: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> playerIdLessThan(Id playerId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: playerId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> playerIdBetween(
    Id lowerPlayerId,
    Id upperPlayerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerPlayerId,
        includeLower: includeLower,
        upper: upperPlayerId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> gamerTagEqualTo(
      String gamerTag) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'gamerTag',
        value: [gamerTag],
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> gamerTagNotEqualTo(
      String gamerTag) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'gamerTag',
              lower: [],
              upper: [gamerTag],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'gamerTag',
              lower: [gamerTag],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'gamerTag',
              lower: [gamerTag],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'gamerTag',
              lower: [],
              upper: [gamerTag],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> pointsEqualTo(int points) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'points',
        value: [points],
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> pointsNotEqualTo(int points) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'points',
              lower: [],
              upper: [points],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'points',
              lower: [points],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'points',
              lower: [points],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'points',
              lower: [],
              upper: [points],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> pointsGreaterThan(
    int points, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'points',
        lower: [points],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> pointsLessThan(
    int points, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'points',
        lower: [],
        upper: [points],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> pointsBetween(
    int lowerPoints,
    int upperPoints, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'points',
        lower: [lowerPoints],
        includeLower: includeLower,
        upper: [upperPoints],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> winStatusEqualTo(
      bool winStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'winStatus',
        value: [winStatus],
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> winStatusNotEqualTo(
      bool winStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'winStatus',
              lower: [],
              upper: [winStatus],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'winStatus',
              lower: [winStatus],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'winStatus',
              lower: [winStatus],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'winStatus',
              lower: [],
              upper: [winStatus],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PlayerQueryFilter on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> avatarEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gamerTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gamerTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gamerTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gamerTag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gamerTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gamerTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gamerTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gamerTag',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gamerTag',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> gamerTagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gamerTag',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isSelectedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelected',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerId',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerId',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerId',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> pointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> pointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> pointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> pointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'points',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> winStatusEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winStatus',
        value: value,
      ));
    });
  }
}

extension PlayerQueryObject on QueryBuilder<Player, Player, QFilterCondition> {}

extension PlayerQueryLinks on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> tournaments(
      FilterQuery<Tournament> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tournaments');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> tournamentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tournaments', 0, true, 0, true);
    });
  }
}

extension PlayerQuerySortBy on QueryBuilder<Player, Player, QSortBy> {
  QueryBuilder<Player, Player, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByGamerTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gamerTag', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByGamerTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gamerTag', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByWinStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winStatus', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByWinStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winStatus', Sort.desc);
    });
  }
}

extension PlayerQuerySortThenBy on QueryBuilder<Player, Player, QSortThenBy> {
  QueryBuilder<Player, Player, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByGamerTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gamerTag', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByGamerTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gamerTag', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerId', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByPlayerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerId', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByWinStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winStatus', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByWinStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winStatus', Sort.desc);
    });
  }
}

extension PlayerQueryWhereDistinct on QueryBuilder<Player, Player, QDistinct> {
  QueryBuilder<Player, Player, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByGamerTag(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gamerTag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSelected');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByWinStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winStatus');
    });
  }
}

extension PlayerQueryProperty on QueryBuilder<Player, Player, QQueryProperty> {
  QueryBuilder<Player, int, QQueryOperations> playerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerId');
    });
  }

  QueryBuilder<Player, String, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<Player, String, QQueryOperations> gamerTagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gamerTag');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> isSelectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSelected');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> winStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winStatus');
    });
  }
}
