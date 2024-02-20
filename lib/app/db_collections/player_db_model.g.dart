// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_db_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DbPlayerSchema = Schema(
  name: r'DbPlayer',
  id: 8598241474454501523,
  properties: {
    r'avatar': PropertySchema(
      id: 0,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'eliminationStatus': PropertySchema(
      id: 1,
      name: r'eliminationStatus',
      type: IsarType.bool,
    ),
    r'gamerTag': PropertySchema(
      id: 2,
      name: r'gamerTag',
      type: IsarType.string,
    ),
    r'isSelected': PropertySchema(
      id: 3,
      name: r'isSelected',
      type: IsarType.bool,
    ),
    r'points': PropertySchema(
      id: 4,
      name: r'points',
      type: IsarType.long,
    ),
    r'tournament': PropertySchema(
      id: 5,
      name: r'tournament',
      type: IsarType.object,
      target: r'DbTournament',
    )
  },
  estimateSize: _dbPlayerEstimateSize,
  serialize: _dbPlayerSerialize,
  deserialize: _dbPlayerDeserialize,
  deserializeProp: _dbPlayerDeserializeProp,
);

int _dbPlayerEstimateSize(
  DbPlayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gamerTag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
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

void _dbPlayerSerialize(
  DbPlayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatar);
  writer.writeBool(offsets[1], object.eliminationStatus);
  writer.writeString(offsets[2], object.gamerTag);
  writer.writeBool(offsets[3], object.isSelected);
  writer.writeLong(offsets[4], object.points);
  writer.writeObject<DbTournament>(
    offsets[5],
    allOffsets,
    DbTournamentSchema.serialize,
    object.tournament,
  );
}

DbPlayer _dbPlayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbPlayer(
    avatar: reader.readStringOrNull(offsets[0]),
    eliminationStatus: reader.readBoolOrNull(offsets[1]) ?? false,
    gamerTag: reader.readStringOrNull(offsets[2]),
    isSelected: reader.readBoolOrNull(offsets[3]) ?? false,
    points: reader.readLongOrNull(offsets[4]),
    tournament: reader.readObjectOrNull<DbTournament>(
      offsets[5],
      DbTournamentSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _dbPlayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
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

extension DbPlayerQueryFilter
    on QueryBuilder<DbPlayer, DbPlayer, QFilterCondition> {
  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarEqualTo(
    String? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarGreaterThan(
    String? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarLessThan(
    String? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarStartsWith(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarEndsWith(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarContains(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarMatches(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition>
      eliminationStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eliminationStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gamerTag',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gamerTag',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagEqualTo(
    String? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagGreaterThan(
    String? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagLessThan(
    String? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagStartsWith(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagEndsWith(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagContains(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagMatches(
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gamerTag',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> gamerTagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gamerTag',
        value: '',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> isSelectedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelected',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> pointsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'points',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> pointsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'points',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> pointsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> pointsGreaterThan(
    int? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> pointsLessThan(
    int? value, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> pointsBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> tournamentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tournament',
      ));
    });
  }

  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition>
      tournamentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tournament',
      ));
    });
  }
}

extension DbPlayerQueryObject
    on QueryBuilder<DbPlayer, DbPlayer, QFilterCondition> {
  QueryBuilder<DbPlayer, DbPlayer, QAfterFilterCondition> tournament(
      FilterQuery<DbTournament> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tournament');
    });
  }
}
