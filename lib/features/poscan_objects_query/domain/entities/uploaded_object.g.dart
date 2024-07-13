// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_object.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUploadedObjectCollection on Isar {
  IsarCollection<UploadedObject> get uploadedObjects => this.collection();
}

const UploadedObjectSchema = CollectionSchema(
  name: r'UploadedObject',
  id: 2979253959031145124,
  properties: {
    r'cacheDate': PropertySchema(
      id: 0,
      name: r'cacheDate',
      type: IsarType.dateTime,
    ),
    r'categoryExternal': PropertySchema(
      id: 1,
      name: r'categoryExternal',
      type: IsarType.string,
    ),
    r'categoryInternal': PropertySchema(
      id: 2,
      name: r'categoryInternal',
      type: IsarType.string,
    ),
    r'compressedWith': PropertySchema(
      id: 3,
      name: r'compressedWith',
      type: IsarType.string,
    ),
    r'hashesListJoined': PropertySchema(
      id: 4,
      name: r'hashesListJoined',
      type: IsarType.string,
    ),
    r'obj': PropertySchema(
      id: 5,
      name: r'obj',
      type: IsarType.string,
    ),
    r'owner': PropertySchema(
      id: 6,
      name: r'owner',
      type: IsarType.string,
    ),
    r'propsRaw': PropertySchema(
      id: 7,
      name: r'propsRaw',
      type: IsarType.objectList,
      target: r'PropValueRaw',
    ),
    r'stateBlock': PropertySchema(
      id: 8,
      name: r'stateBlock',
      type: IsarType.longList,
    ),
    r'stateName': PropertySchema(
      id: 9,
      name: r'stateName',
      type: IsarType.string,
    ),
    r'whenApproved': PropertySchema(
      id: 10,
      name: r'whenApproved',
      type: IsarType.long,
    ),
    r'whenCreated': PropertySchema(
      id: 11,
      name: r'whenCreated',
      type: IsarType.long,
    )
  },
  estimateSize: _uploadedObjectEstimateSize,
  serialize: _uploadedObjectSerialize,
  deserialize: _uploadedObjectDeserialize,
  deserializeProp: _uploadedObjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'hashesListJoined': IndexSchema(
      id: -6593688471153462637,
      name: r'hashesListJoined',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hashesListJoined',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'owner': IndexSchema(
      id: 937942649497171216,
      name: r'owner',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'owner',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'PropValueRaw': PropValueRawSchema},
  getId: _uploadedObjectGetId,
  getLinks: _uploadedObjectGetLinks,
  attach: _uploadedObjectAttach,
  version: '3.1.0',
);

int _uploadedObjectEstimateSize(
  UploadedObject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryExternal.length * 3;
  bytesCount += 3 + object.categoryInternal.length * 3;
  bytesCount += 3 + object.compressedWith.length * 3;
  bytesCount += 3 + object.hashesListJoined.length * 3;
  bytesCount += 3 + object.obj.length * 3;
  bytesCount += 3 + object.owner.length * 3;
  bytesCount += 3 + object.propsRaw.length * 3;
  {
    final offsets = allOffsets[PropValueRaw]!;
    for (var i = 0; i < object.propsRaw.length; i++) {
      final value = object.propsRaw[i];
      bytesCount += PropValueRawSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.stateBlock.length * 8;
  bytesCount += 3 + object.stateName.length * 3;
  return bytesCount;
}

void _uploadedObjectSerialize(
  UploadedObject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.cacheDate);
  writer.writeString(offsets[1], object.categoryExternal);
  writer.writeString(offsets[2], object.categoryInternal);
  writer.writeString(offsets[3], object.compressedWith);
  writer.writeString(offsets[4], object.hashesListJoined);
  writer.writeString(offsets[5], object.obj);
  writer.writeString(offsets[6], object.owner);
  writer.writeObjectList<PropValueRaw>(
    offsets[7],
    allOffsets,
    PropValueRawSchema.serialize,
    object.propsRaw,
  );
  writer.writeLongList(offsets[8], object.stateBlock);
  writer.writeString(offsets[9], object.stateName);
  writer.writeLong(offsets[10], object.whenApproved);
  writer.writeLong(offsets[11], object.whenCreated);
}

UploadedObject _uploadedObjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UploadedObject(
    cacheDate: reader.readDateTime(offsets[0]),
    categoryExternal: reader.readString(offsets[1]),
    categoryInternal: reader.readString(offsets[2]),
    compressedWith: reader.readString(offsets[3]),
    hashesListJoined: reader.readString(offsets[4]),
    id: id,
    obj: reader.readString(offsets[5]),
    owner: reader.readString(offsets[6]),
    propsRaw: reader.readObjectList<PropValueRaw>(
          offsets[7],
          PropValueRawSchema.deserialize,
          allOffsets,
          PropValueRaw(),
        ) ??
        [],
    stateBlock: reader.readLongList(offsets[8]) ?? [],
    stateName: reader.readString(offsets[9]),
    whenApproved: reader.readLongOrNull(offsets[10]),
    whenCreated: reader.readLong(offsets[11]),
  );
  return object;
}

P _uploadedObjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectList<PropValueRaw>(
            offset,
            PropValueRawSchema.deserialize,
            allOffsets,
            PropValueRaw(),
          ) ??
          []) as P;
    case 8:
      return (reader.readLongList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _uploadedObjectGetId(UploadedObject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _uploadedObjectGetLinks(UploadedObject object) {
  return [];
}

void _uploadedObjectAttach(
    IsarCollection<dynamic> col, Id id, UploadedObject object) {}

extension UploadedObjectQueryWhereSort
    on QueryBuilder<UploadedObject, UploadedObject, QWhere> {
  QueryBuilder<UploadedObject, UploadedObject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UploadedObjectQueryWhere
    on QueryBuilder<UploadedObject, UploadedObject, QWhereClause> {
  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause> idBetween(
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

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause>
      hashesListJoinedEqualTo(String hashesListJoined) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hashesListJoined',
        value: [hashesListJoined],
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause>
      hashesListJoinedNotEqualTo(String hashesListJoined) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashesListJoined',
              lower: [],
              upper: [hashesListJoined],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashesListJoined',
              lower: [hashesListJoined],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashesListJoined',
              lower: [hashesListJoined],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashesListJoined',
              lower: [],
              upper: [hashesListJoined],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause> ownerEqualTo(
      String owner) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'owner',
        value: [owner],
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterWhereClause>
      ownerNotEqualTo(String owner) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'owner',
              lower: [],
              upper: [owner],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'owner',
              lower: [owner],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'owner',
              lower: [owner],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'owner',
              lower: [],
              upper: [owner],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UploadedObjectQueryFilter
    on QueryBuilder<UploadedObject, UploadedObject, QFilterCondition> {
  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      cacheDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      cacheDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      cacheDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      cacheDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryExternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryExternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryExternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryExternal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryExternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryExternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryExternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryExternal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryExternal',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryExternalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryExternal',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryInternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryInternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryInternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryInternal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryInternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryInternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryInternal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryInternal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryInternal',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      categoryInternalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryInternal',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compressedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compressedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compressedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compressedWith',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'compressedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'compressedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'compressedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'compressedWith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compressedWith',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      compressedWithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compressedWith',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashesListJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashesListJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashesListJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashesListJoined',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashesListJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashesListJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashesListJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashesListJoined',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashesListJoined',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      hashesListJoinedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashesListJoined',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'obj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'obj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'obj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'obj',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'obj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'obj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'obj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'obj',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'obj',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      objIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'obj',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'owner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'owner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      ownerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'owner',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propsRaw',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propsRaw',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propsRaw',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propsRaw',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propsRaw',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'propsRaw',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stateBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stateBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stateBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stateBlock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stateBlock',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stateBlock',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stateBlock',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stateBlock',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stateBlock',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateBlockLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stateBlock',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stateName',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      stateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stateName',
        value: '',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenApprovedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'whenApproved',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenApprovedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'whenApproved',
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenApprovedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whenApproved',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenApprovedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'whenApproved',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenApprovedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'whenApproved',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenApprovedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'whenApproved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenCreatedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whenCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenCreatedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'whenCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenCreatedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'whenCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      whenCreatedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'whenCreated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UploadedObjectQueryObject
    on QueryBuilder<UploadedObject, UploadedObject, QFilterCondition> {
  QueryBuilder<UploadedObject, UploadedObject, QAfterFilterCondition>
      propsRawElement(FilterQuery<PropValueRaw> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'propsRaw');
    });
  }
}

extension UploadedObjectQueryLinks
    on QueryBuilder<UploadedObject, UploadedObject, QFilterCondition> {}

extension UploadedObjectQuerySortBy
    on QueryBuilder<UploadedObject, UploadedObject, QSortBy> {
  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> sortByCacheDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheDate', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCacheDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheDate', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCategoryExternal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryExternal', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCategoryExternalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryExternal', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCategoryInternal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryInternal', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCategoryInternalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryInternal', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCompressedWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compressedWith', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByCompressedWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compressedWith', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByHashesListJoined() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashesListJoined', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByHashesListJoinedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashesListJoined', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> sortByObj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obj', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> sortByObjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obj', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> sortByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> sortByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> sortByStateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateName', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByStateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateName', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByWhenApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenApproved', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByWhenApprovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenApproved', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByWhenCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenCreated', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      sortByWhenCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenCreated', Sort.desc);
    });
  }
}

extension UploadedObjectQuerySortThenBy
    on QueryBuilder<UploadedObject, UploadedObject, QSortThenBy> {
  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByCacheDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheDate', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCacheDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheDate', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCategoryExternal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryExternal', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCategoryExternalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryExternal', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCategoryInternal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryInternal', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCategoryInternalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryInternal', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCompressedWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compressedWith', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByCompressedWithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compressedWith', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByHashesListJoined() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashesListJoined', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByHashesListJoinedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashesListJoined', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByObj() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obj', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByObjDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obj', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy> thenByStateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateName', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByStateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stateName', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByWhenApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenApproved', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByWhenApprovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenApproved', Sort.desc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByWhenCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenCreated', Sort.asc);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QAfterSortBy>
      thenByWhenCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whenCreated', Sort.desc);
    });
  }
}

extension UploadedObjectQueryWhereDistinct
    on QueryBuilder<UploadedObject, UploadedObject, QDistinct> {
  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByCacheDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cacheDate');
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByCategoryExternal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryExternal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByCategoryInternal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryInternal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByCompressedWith({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compressedWith',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByHashesListJoined({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashesListJoined',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct> distinctByObj(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct> distinctByOwner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'owner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByStateBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stateBlock');
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct> distinctByStateName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stateName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByWhenApproved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whenApproved');
    });
  }

  QueryBuilder<UploadedObject, UploadedObject, QDistinct>
      distinctByWhenCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whenCreated');
    });
  }
}

extension UploadedObjectQueryProperty
    on QueryBuilder<UploadedObject, UploadedObject, QQueryProperty> {
  QueryBuilder<UploadedObject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UploadedObject, DateTime, QQueryOperations> cacheDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheDate');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations>
      categoryExternalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryExternal');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations>
      categoryInternalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryInternal');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations>
      compressedWithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compressedWith');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations>
      hashesListJoinedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashesListJoined');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations> objProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obj');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations> ownerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owner');
    });
  }

  QueryBuilder<UploadedObject, List<PropValueRaw>, QQueryOperations>
      propsRawProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propsRaw');
    });
  }

  QueryBuilder<UploadedObject, List<int>, QQueryOperations>
      stateBlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stateBlock');
    });
  }

  QueryBuilder<UploadedObject, String, QQueryOperations> stateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stateName');
    });
  }

  QueryBuilder<UploadedObject, int?, QQueryOperations> whenApprovedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whenApproved');
    });
  }

  QueryBuilder<UploadedObject, int, QQueryOperations> whenCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whenCreated');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PropValueRawSchema = Schema(
  name: r'PropValueRaw',
  id: 2712088076207206571,
  properties: {
    r'maxValue': PropertySchema(
      id: 0,
      name: r'maxValue',
      type: IsarType.string,
    ),
    r'propIdx': PropertySchema(
      id: 1,
      name: r'propIdx',
      type: IsarType.string,
    )
  },
  estimateSize: _propValueRawEstimateSize,
  serialize: _propValueRawSerialize,
  deserialize: _propValueRawDeserialize,
  deserializeProp: _propValueRawDeserializeProp,
);

int _propValueRawEstimateSize(
  PropValueRaw object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.maxValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.propIdx;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _propValueRawSerialize(
  PropValueRaw object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.maxValue);
  writer.writeString(offsets[1], object.propIdx);
}

PropValueRaw _propValueRawDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PropValueRaw(
    maxValue: reader.readStringOrNull(offsets[0]),
    propIdx: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _propValueRawDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PropValueRawQueryFilter
    on QueryBuilder<PropValueRaw, PropValueRaw, QFilterCondition> {
  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxValue',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxValue',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxValue',
        value: '',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      maxValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxValue',
        value: '',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propIdx',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propIdx',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propIdx',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propIdx',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propIdx',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propIdx',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propIdx',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propIdx',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propIdx',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propIdx',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propIdx',
        value: '',
      ));
    });
  }

  QueryBuilder<PropValueRaw, PropValueRaw, QAfterFilterCondition>
      propIdxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propIdx',
        value: '',
      ));
    });
  }
}

extension PropValueRawQueryObject
    on QueryBuilder<PropValueRaw, PropValueRaw, QFilterCondition> {}
