// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_database.dart';

// ignore_for_file: type=lint
class $BlockTimeCachesTable extends BlockTimeCaches
    with TableInfo<$BlockTimeCachesTable, BlockTimeCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlockTimeCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chainIndexMeta =
      const VerificationMeta('chainIndex');
  @override
  late final GeneratedColumnWithTypeConverter<ChainType, int> chainIndex =
      GeneratedColumn<int>('chain_index', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ChainType>($BlockTimeCachesTable.$converterchainIndex);
  static const VerificationMeta _blockNumberMeta =
      const VerificationMeta('blockNumber');
  @override
  late final GeneratedColumn<int> blockNumber = GeneratedColumn<int>(
      'block_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _blockTimeMeta =
      const VerificationMeta('blockTime');
  @override
  late final GeneratedColumn<DateTime> blockTime = GeneratedColumn<DateTime>(
      'block_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, chainIndex, blockNumber, blockTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'block_time_caches';
  @override
  VerificationContext validateIntegrity(Insertable<BlockTimeCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_chainIndexMeta, const VerificationResult.success());
    if (data.containsKey('block_number')) {
      context.handle(
          _blockNumberMeta,
          blockNumber.isAcceptableOrUnknown(
              data['block_number']!, _blockNumberMeta));
    } else if (isInserting) {
      context.missing(_blockNumberMeta);
    }
    if (data.containsKey('block_time')) {
      context.handle(_blockTimeMeta,
          blockTime.isAcceptableOrUnknown(data['block_time']!, _blockTimeMeta));
    } else if (isInserting) {
      context.missing(_blockTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BlockTimeCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlockTimeCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chainIndex: $BlockTimeCachesTable.$converterchainIndex.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}chain_index'])!),
      blockNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}block_number'])!,
      blockTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}block_time'])!,
    );
  }

  @override
  $BlockTimeCachesTable createAlias(String alias) {
    return $BlockTimeCachesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ChainType, int, int> $converterchainIndex =
      const EnumIndexConverter<ChainType>(ChainType.values);
}

class BlockTimeCache extends DataClass implements Insertable<BlockTimeCache> {
  final int id;
  final ChainType chainIndex;
  final int blockNumber;
  final DateTime blockTime;
  const BlockTimeCache(
      {required this.id,
      required this.chainIndex,
      required this.blockNumber,
      required this.blockTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['chain_index'] = Variable<int>(
          $BlockTimeCachesTable.$converterchainIndex.toSql(chainIndex));
    }
    map['block_number'] = Variable<int>(blockNumber);
    map['block_time'] = Variable<DateTime>(blockTime);
    return map;
  }

  BlockTimeCachesCompanion toCompanion(bool nullToAbsent) {
    return BlockTimeCachesCompanion(
      id: Value(id),
      chainIndex: Value(chainIndex),
      blockNumber: Value(blockNumber),
      blockTime: Value(blockTime),
    );
  }

  factory BlockTimeCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlockTimeCache(
      id: serializer.fromJson<int>(json['id']),
      chainIndex: $BlockTimeCachesTable.$converterchainIndex
          .fromJson(serializer.fromJson<int>(json['chainIndex'])),
      blockNumber: serializer.fromJson<int>(json['blockNumber']),
      blockTime: serializer.fromJson<DateTime>(json['blockTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chainIndex': serializer.toJson<int>(
          $BlockTimeCachesTable.$converterchainIndex.toJson(chainIndex)),
      'blockNumber': serializer.toJson<int>(blockNumber),
      'blockTime': serializer.toJson<DateTime>(blockTime),
    };
  }

  BlockTimeCache copyWith(
          {int? id,
          ChainType? chainIndex,
          int? blockNumber,
          DateTime? blockTime}) =>
      BlockTimeCache(
        id: id ?? this.id,
        chainIndex: chainIndex ?? this.chainIndex,
        blockNumber: blockNumber ?? this.blockNumber,
        blockTime: blockTime ?? this.blockTime,
      );
  BlockTimeCache copyWithCompanion(BlockTimeCachesCompanion data) {
    return BlockTimeCache(
      id: data.id.present ? data.id.value : this.id,
      chainIndex:
          data.chainIndex.present ? data.chainIndex.value : this.chainIndex,
      blockNumber:
          data.blockNumber.present ? data.blockNumber.value : this.blockNumber,
      blockTime: data.blockTime.present ? data.blockTime.value : this.blockTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlockTimeCache(')
          ..write('id: $id, ')
          ..write('chainIndex: $chainIndex, ')
          ..write('blockNumber: $blockNumber, ')
          ..write('blockTime: $blockTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chainIndex, blockNumber, blockTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlockTimeCache &&
          other.id == this.id &&
          other.chainIndex == this.chainIndex &&
          other.blockNumber == this.blockNumber &&
          other.blockTime == this.blockTime);
}

class BlockTimeCachesCompanion extends UpdateCompanion<BlockTimeCache> {
  final Value<int> id;
  final Value<ChainType> chainIndex;
  final Value<int> blockNumber;
  final Value<DateTime> blockTime;
  const BlockTimeCachesCompanion({
    this.id = const Value.absent(),
    this.chainIndex = const Value.absent(),
    this.blockNumber = const Value.absent(),
    this.blockTime = const Value.absent(),
  });
  BlockTimeCachesCompanion.insert({
    this.id = const Value.absent(),
    required ChainType chainIndex,
    required int blockNumber,
    required DateTime blockTime,
  })  : chainIndex = Value(chainIndex),
        blockNumber = Value(blockNumber),
        blockTime = Value(blockTime);
  static Insertable<BlockTimeCache> custom({
    Expression<int>? id,
    Expression<int>? chainIndex,
    Expression<int>? blockNumber,
    Expression<DateTime>? blockTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chainIndex != null) 'chain_index': chainIndex,
      if (blockNumber != null) 'block_number': blockNumber,
      if (blockTime != null) 'block_time': blockTime,
    });
  }

  BlockTimeCachesCompanion copyWith(
      {Value<int>? id,
      Value<ChainType>? chainIndex,
      Value<int>? blockNumber,
      Value<DateTime>? blockTime}) {
    return BlockTimeCachesCompanion(
      id: id ?? this.id,
      chainIndex: chainIndex ?? this.chainIndex,
      blockNumber: blockNumber ?? this.blockNumber,
      blockTime: blockTime ?? this.blockTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chainIndex.present) {
      map['chain_index'] = Variable<int>(
          $BlockTimeCachesTable.$converterchainIndex.toSql(chainIndex.value));
    }
    if (blockNumber.present) {
      map['block_number'] = Variable<int>(blockNumber.value);
    }
    if (blockTime.present) {
      map['block_time'] = Variable<DateTime>(blockTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlockTimeCachesCompanion(')
          ..write('id: $id, ')
          ..write('chainIndex: $chainIndex, ')
          ..write('blockNumber: $blockNumber, ')
          ..write('blockTime: $blockTime')
          ..write(')'))
        .toString();
  }
}

class $UploadedObjectCachesTable extends UploadedObjectCaches
    with TableInfo<$UploadedObjectCachesTable, UploadedObjectCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UploadedObjectCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ss58Meta = const VerificationMeta('ss58');
  @override
  late final GeneratedColumn<int> ss58 = GeneratedColumn<int>(
      'ss58', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stateNameMeta =
      const VerificationMeta('stateName');
  @override
  late final GeneratedColumn<String> stateName = GeneratedColumn<String>(
      'state_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateBlockJsonMeta =
      const VerificationMeta('stateBlockJson');
  @override
  late final GeneratedColumn<String> stateBlockJson = GeneratedColumn<String>(
      'state_block_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _compressedWithMeta =
      const VerificationMeta('compressedWith');
  @override
  late final GeneratedColumn<String> compressedWith = GeneratedColumn<String>(
      'compressed_with', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryJsonMeta =
      const VerificationMeta('categoryJson');
  @override
  late final GeneratedColumn<String> categoryJson = GeneratedColumn<String>(
      'category_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _whenCreatedMeta =
      const VerificationMeta('whenCreated');
  @override
  late final GeneratedColumn<int> whenCreated = GeneratedColumn<int>(
      'when_created', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _whenApprovedMeta =
      const VerificationMeta('whenApproved');
  @override
  late final GeneratedColumn<int> whenApproved = GeneratedColumn<int>(
      'when_approved', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<String> owner = GeneratedColumn<String>(
      'owner', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _propsJsonMeta =
      const VerificationMeta('propsJson');
  @override
  late final GeneratedColumn<String> propsJson = GeneratedColumn<String>(
      'props_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _joinedHashesMeta =
      const VerificationMeta('joinedHashes');
  @override
  late final GeneratedColumn<String> joinedHashes = GeneratedColumn<String>(
      'joined_hashes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ss58,
        stateName,
        stateBlockJson,
        compressedWith,
        categoryJson,
        whenCreated,
        whenApproved,
        owner,
        propsJson,
        joinedHashes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'uploaded_object_caches';
  @override
  VerificationContext validateIntegrity(
      Insertable<UploadedObjectCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ss58')) {
      context.handle(
          _ss58Meta, ss58.isAcceptableOrUnknown(data['ss58']!, _ss58Meta));
    } else if (isInserting) {
      context.missing(_ss58Meta);
    }
    if (data.containsKey('state_name')) {
      context.handle(_stateNameMeta,
          stateName.isAcceptableOrUnknown(data['state_name']!, _stateNameMeta));
    } else if (isInserting) {
      context.missing(_stateNameMeta);
    }
    if (data.containsKey('state_block_json')) {
      context.handle(
          _stateBlockJsonMeta,
          stateBlockJson.isAcceptableOrUnknown(
              data['state_block_json']!, _stateBlockJsonMeta));
    } else if (isInserting) {
      context.missing(_stateBlockJsonMeta);
    }
    if (data.containsKey('compressed_with')) {
      context.handle(
          _compressedWithMeta,
          compressedWith.isAcceptableOrUnknown(
              data['compressed_with']!, _compressedWithMeta));
    } else if (isInserting) {
      context.missing(_compressedWithMeta);
    }
    if (data.containsKey('category_json')) {
      context.handle(
          _categoryJsonMeta,
          categoryJson.isAcceptableOrUnknown(
              data['category_json']!, _categoryJsonMeta));
    } else if (isInserting) {
      context.missing(_categoryJsonMeta);
    }
    if (data.containsKey('when_created')) {
      context.handle(
          _whenCreatedMeta,
          whenCreated.isAcceptableOrUnknown(
              data['when_created']!, _whenCreatedMeta));
    } else if (isInserting) {
      context.missing(_whenCreatedMeta);
    }
    if (data.containsKey('when_approved')) {
      context.handle(
          _whenApprovedMeta,
          whenApproved.isAcceptableOrUnknown(
              data['when_approved']!, _whenApprovedMeta));
    }
    if (data.containsKey('owner')) {
      context.handle(
          _ownerMeta, owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta));
    } else if (isInserting) {
      context.missing(_ownerMeta);
    }
    if (data.containsKey('props_json')) {
      context.handle(_propsJsonMeta,
          propsJson.isAcceptableOrUnknown(data['props_json']!, _propsJsonMeta));
    } else if (isInserting) {
      context.missing(_propsJsonMeta);
    }
    if (data.containsKey('joined_hashes')) {
      context.handle(
          _joinedHashesMeta,
          joinedHashes.isAcceptableOrUnknown(
              data['joined_hashes']!, _joinedHashesMeta));
    } else if (isInserting) {
      context.missing(_joinedHashesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UploadedObjectCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UploadedObjectCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ss58: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ss58'])!,
      stateName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state_name'])!,
      stateBlockJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}state_block_json'])!,
      compressedWith: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}compressed_with'])!,
      categoryJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_json'])!,
      whenCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}when_created'])!,
      whenApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}when_approved']),
      owner: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner'])!,
      propsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}props_json'])!,
      joinedHashes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}joined_hashes'])!,
    );
  }

  @override
  $UploadedObjectCachesTable createAlias(String alias) {
    return $UploadedObjectCachesTable(attachedDatabase, alias);
  }
}

class UploadedObjectCache extends DataClass
    implements Insertable<UploadedObjectCache> {
  final int id;
  final int ss58;
  final String stateName;
  final String stateBlockJson;
  final String compressedWith;
  final String categoryJson;
  final int whenCreated;
  final int? whenApproved;
  final String owner;
  final String propsJson;
  final String joinedHashes;
  const UploadedObjectCache(
      {required this.id,
      required this.ss58,
      required this.stateName,
      required this.stateBlockJson,
      required this.compressedWith,
      required this.categoryJson,
      required this.whenCreated,
      this.whenApproved,
      required this.owner,
      required this.propsJson,
      required this.joinedHashes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ss58'] = Variable<int>(ss58);
    map['state_name'] = Variable<String>(stateName);
    map['state_block_json'] = Variable<String>(stateBlockJson);
    map['compressed_with'] = Variable<String>(compressedWith);
    map['category_json'] = Variable<String>(categoryJson);
    map['when_created'] = Variable<int>(whenCreated);
    if (!nullToAbsent || whenApproved != null) {
      map['when_approved'] = Variable<int>(whenApproved);
    }
    map['owner'] = Variable<String>(owner);
    map['props_json'] = Variable<String>(propsJson);
    map['joined_hashes'] = Variable<String>(joinedHashes);
    return map;
  }

  UploadedObjectCachesCompanion toCompanion(bool nullToAbsent) {
    return UploadedObjectCachesCompanion(
      id: Value(id),
      ss58: Value(ss58),
      stateName: Value(stateName),
      stateBlockJson: Value(stateBlockJson),
      compressedWith: Value(compressedWith),
      categoryJson: Value(categoryJson),
      whenCreated: Value(whenCreated),
      whenApproved: whenApproved == null && nullToAbsent
          ? const Value.absent()
          : Value(whenApproved),
      owner: Value(owner),
      propsJson: Value(propsJson),
      joinedHashes: Value(joinedHashes),
    );
  }

  factory UploadedObjectCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UploadedObjectCache(
      id: serializer.fromJson<int>(json['id']),
      ss58: serializer.fromJson<int>(json['ss58']),
      stateName: serializer.fromJson<String>(json['stateName']),
      stateBlockJson: serializer.fromJson<String>(json['stateBlockJson']),
      compressedWith: serializer.fromJson<String>(json['compressedWith']),
      categoryJson: serializer.fromJson<String>(json['categoryJson']),
      whenCreated: serializer.fromJson<int>(json['whenCreated']),
      whenApproved: serializer.fromJson<int?>(json['whenApproved']),
      owner: serializer.fromJson<String>(json['owner']),
      propsJson: serializer.fromJson<String>(json['propsJson']),
      joinedHashes: serializer.fromJson<String>(json['joinedHashes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ss58': serializer.toJson<int>(ss58),
      'stateName': serializer.toJson<String>(stateName),
      'stateBlockJson': serializer.toJson<String>(stateBlockJson),
      'compressedWith': serializer.toJson<String>(compressedWith),
      'categoryJson': serializer.toJson<String>(categoryJson),
      'whenCreated': serializer.toJson<int>(whenCreated),
      'whenApproved': serializer.toJson<int?>(whenApproved),
      'owner': serializer.toJson<String>(owner),
      'propsJson': serializer.toJson<String>(propsJson),
      'joinedHashes': serializer.toJson<String>(joinedHashes),
    };
  }

  UploadedObjectCache copyWith(
          {int? id,
          int? ss58,
          String? stateName,
          String? stateBlockJson,
          String? compressedWith,
          String? categoryJson,
          int? whenCreated,
          Value<int?> whenApproved = const Value.absent(),
          String? owner,
          String? propsJson,
          String? joinedHashes}) =>
      UploadedObjectCache(
        id: id ?? this.id,
        ss58: ss58 ?? this.ss58,
        stateName: stateName ?? this.stateName,
        stateBlockJson: stateBlockJson ?? this.stateBlockJson,
        compressedWith: compressedWith ?? this.compressedWith,
        categoryJson: categoryJson ?? this.categoryJson,
        whenCreated: whenCreated ?? this.whenCreated,
        whenApproved:
            whenApproved.present ? whenApproved.value : this.whenApproved,
        owner: owner ?? this.owner,
        propsJson: propsJson ?? this.propsJson,
        joinedHashes: joinedHashes ?? this.joinedHashes,
      );
  UploadedObjectCache copyWithCompanion(UploadedObjectCachesCompanion data) {
    return UploadedObjectCache(
      id: data.id.present ? data.id.value : this.id,
      ss58: data.ss58.present ? data.ss58.value : this.ss58,
      stateName: data.stateName.present ? data.stateName.value : this.stateName,
      stateBlockJson: data.stateBlockJson.present
          ? data.stateBlockJson.value
          : this.stateBlockJson,
      compressedWith: data.compressedWith.present
          ? data.compressedWith.value
          : this.compressedWith,
      categoryJson: data.categoryJson.present
          ? data.categoryJson.value
          : this.categoryJson,
      whenCreated:
          data.whenCreated.present ? data.whenCreated.value : this.whenCreated,
      whenApproved: data.whenApproved.present
          ? data.whenApproved.value
          : this.whenApproved,
      owner: data.owner.present ? data.owner.value : this.owner,
      propsJson: data.propsJson.present ? data.propsJson.value : this.propsJson,
      joinedHashes: data.joinedHashes.present
          ? data.joinedHashes.value
          : this.joinedHashes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UploadedObjectCache(')
          ..write('id: $id, ')
          ..write('ss58: $ss58, ')
          ..write('stateName: $stateName, ')
          ..write('stateBlockJson: $stateBlockJson, ')
          ..write('compressedWith: $compressedWith, ')
          ..write('categoryJson: $categoryJson, ')
          ..write('whenCreated: $whenCreated, ')
          ..write('whenApproved: $whenApproved, ')
          ..write('owner: $owner, ')
          ..write('propsJson: $propsJson, ')
          ..write('joinedHashes: $joinedHashes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      ss58,
      stateName,
      stateBlockJson,
      compressedWith,
      categoryJson,
      whenCreated,
      whenApproved,
      owner,
      propsJson,
      joinedHashes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UploadedObjectCache &&
          other.id == this.id &&
          other.ss58 == this.ss58 &&
          other.stateName == this.stateName &&
          other.stateBlockJson == this.stateBlockJson &&
          other.compressedWith == this.compressedWith &&
          other.categoryJson == this.categoryJson &&
          other.whenCreated == this.whenCreated &&
          other.whenApproved == this.whenApproved &&
          other.owner == this.owner &&
          other.propsJson == this.propsJson &&
          other.joinedHashes == this.joinedHashes);
}

class UploadedObjectCachesCompanion
    extends UpdateCompanion<UploadedObjectCache> {
  final Value<int> id;
  final Value<int> ss58;
  final Value<String> stateName;
  final Value<String> stateBlockJson;
  final Value<String> compressedWith;
  final Value<String> categoryJson;
  final Value<int> whenCreated;
  final Value<int?> whenApproved;
  final Value<String> owner;
  final Value<String> propsJson;
  final Value<String> joinedHashes;
  const UploadedObjectCachesCompanion({
    this.id = const Value.absent(),
    this.ss58 = const Value.absent(),
    this.stateName = const Value.absent(),
    this.stateBlockJson = const Value.absent(),
    this.compressedWith = const Value.absent(),
    this.categoryJson = const Value.absent(),
    this.whenCreated = const Value.absent(),
    this.whenApproved = const Value.absent(),
    this.owner = const Value.absent(),
    this.propsJson = const Value.absent(),
    this.joinedHashes = const Value.absent(),
  });
  UploadedObjectCachesCompanion.insert({
    this.id = const Value.absent(),
    required int ss58,
    required String stateName,
    required String stateBlockJson,
    required String compressedWith,
    required String categoryJson,
    required int whenCreated,
    this.whenApproved = const Value.absent(),
    required String owner,
    required String propsJson,
    required String joinedHashes,
  })  : ss58 = Value(ss58),
        stateName = Value(stateName),
        stateBlockJson = Value(stateBlockJson),
        compressedWith = Value(compressedWith),
        categoryJson = Value(categoryJson),
        whenCreated = Value(whenCreated),
        owner = Value(owner),
        propsJson = Value(propsJson),
        joinedHashes = Value(joinedHashes);
  static Insertable<UploadedObjectCache> custom({
    Expression<int>? id,
    Expression<int>? ss58,
    Expression<String>? stateName,
    Expression<String>? stateBlockJson,
    Expression<String>? compressedWith,
    Expression<String>? categoryJson,
    Expression<int>? whenCreated,
    Expression<int>? whenApproved,
    Expression<String>? owner,
    Expression<String>? propsJson,
    Expression<String>? joinedHashes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ss58 != null) 'ss58': ss58,
      if (stateName != null) 'state_name': stateName,
      if (stateBlockJson != null) 'state_block_json': stateBlockJson,
      if (compressedWith != null) 'compressed_with': compressedWith,
      if (categoryJson != null) 'category_json': categoryJson,
      if (whenCreated != null) 'when_created': whenCreated,
      if (whenApproved != null) 'when_approved': whenApproved,
      if (owner != null) 'owner': owner,
      if (propsJson != null) 'props_json': propsJson,
      if (joinedHashes != null) 'joined_hashes': joinedHashes,
    });
  }

  UploadedObjectCachesCompanion copyWith(
      {Value<int>? id,
      Value<int>? ss58,
      Value<String>? stateName,
      Value<String>? stateBlockJson,
      Value<String>? compressedWith,
      Value<String>? categoryJson,
      Value<int>? whenCreated,
      Value<int?>? whenApproved,
      Value<String>? owner,
      Value<String>? propsJson,
      Value<String>? joinedHashes}) {
    return UploadedObjectCachesCompanion(
      id: id ?? this.id,
      ss58: ss58 ?? this.ss58,
      stateName: stateName ?? this.stateName,
      stateBlockJson: stateBlockJson ?? this.stateBlockJson,
      compressedWith: compressedWith ?? this.compressedWith,
      categoryJson: categoryJson ?? this.categoryJson,
      whenCreated: whenCreated ?? this.whenCreated,
      whenApproved: whenApproved ?? this.whenApproved,
      owner: owner ?? this.owner,
      propsJson: propsJson ?? this.propsJson,
      joinedHashes: joinedHashes ?? this.joinedHashes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ss58.present) {
      map['ss58'] = Variable<int>(ss58.value);
    }
    if (stateName.present) {
      map['state_name'] = Variable<String>(stateName.value);
    }
    if (stateBlockJson.present) {
      map['state_block_json'] = Variable<String>(stateBlockJson.value);
    }
    if (compressedWith.present) {
      map['compressed_with'] = Variable<String>(compressedWith.value);
    }
    if (categoryJson.present) {
      map['category_json'] = Variable<String>(categoryJson.value);
    }
    if (whenCreated.present) {
      map['when_created'] = Variable<int>(whenCreated.value);
    }
    if (whenApproved.present) {
      map['when_approved'] = Variable<int>(whenApproved.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (propsJson.present) {
      map['props_json'] = Variable<String>(propsJson.value);
    }
    if (joinedHashes.present) {
      map['joined_hashes'] = Variable<String>(joinedHashes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UploadedObjectCachesCompanion(')
          ..write('id: $id, ')
          ..write('ss58: $ss58, ')
          ..write('stateName: $stateName, ')
          ..write('stateBlockJson: $stateBlockJson, ')
          ..write('compressedWith: $compressedWith, ')
          ..write('categoryJson: $categoryJson, ')
          ..write('whenCreated: $whenCreated, ')
          ..write('whenApproved: $whenApproved, ')
          ..write('owner: $owner, ')
          ..write('propsJson: $propsJson, ')
          ..write('joinedHashes: $joinedHashes')
          ..write(')'))
        .toString();
  }
}

class $UploadedObjectContentsTable extends UploadedObjectContents
    with TableInfo<$UploadedObjectContentsTable, UploadedObjectContent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UploadedObjectContentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ss58Meta = const VerificationMeta('ss58');
  @override
  late final GeneratedColumn<int> ss58 = GeneratedColumn<int>(
      'ss58', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _objMeta = const VerificationMeta('obj');
  @override
  late final GeneratedColumn<Uint8List> obj = GeneratedColumn<Uint8List>(
      'obj', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, ss58, obj];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'uploaded_object_contents';
  @override
  VerificationContext validateIntegrity(
      Insertable<UploadedObjectContent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ss58')) {
      context.handle(
          _ss58Meta, ss58.isAcceptableOrUnknown(data['ss58']!, _ss58Meta));
    } else if (isInserting) {
      context.missing(_ss58Meta);
    }
    if (data.containsKey('obj')) {
      context.handle(
          _objMeta, obj.isAcceptableOrUnknown(data['obj']!, _objMeta));
    } else if (isInserting) {
      context.missing(_objMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UploadedObjectContent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UploadedObjectContent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ss58: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ss58'])!,
      obj: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}obj'])!,
    );
  }

  @override
  $UploadedObjectContentsTable createAlias(String alias) {
    return $UploadedObjectContentsTable(attachedDatabase, alias);
  }
}

class UploadedObjectContent extends DataClass
    implements Insertable<UploadedObjectContent> {
  final int id;
  final int ss58;
  final Uint8List obj;
  const UploadedObjectContent(
      {required this.id, required this.ss58, required this.obj});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ss58'] = Variable<int>(ss58);
    map['obj'] = Variable<Uint8List>(obj);
    return map;
  }

  UploadedObjectContentsCompanion toCompanion(bool nullToAbsent) {
    return UploadedObjectContentsCompanion(
      id: Value(id),
      ss58: Value(ss58),
      obj: Value(obj),
    );
  }

  factory UploadedObjectContent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UploadedObjectContent(
      id: serializer.fromJson<int>(json['id']),
      ss58: serializer.fromJson<int>(json['ss58']),
      obj: serializer.fromJson<Uint8List>(json['obj']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ss58': serializer.toJson<int>(ss58),
      'obj': serializer.toJson<Uint8List>(obj),
    };
  }

  UploadedObjectContent copyWith({int? id, int? ss58, Uint8List? obj}) =>
      UploadedObjectContent(
        id: id ?? this.id,
        ss58: ss58 ?? this.ss58,
        obj: obj ?? this.obj,
      );
  UploadedObjectContent copyWithCompanion(
      UploadedObjectContentsCompanion data) {
    return UploadedObjectContent(
      id: data.id.present ? data.id.value : this.id,
      ss58: data.ss58.present ? data.ss58.value : this.ss58,
      obj: data.obj.present ? data.obj.value : this.obj,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UploadedObjectContent(')
          ..write('id: $id, ')
          ..write('ss58: $ss58, ')
          ..write('obj: $obj')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ss58, $driftBlobEquality.hash(obj));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UploadedObjectContent &&
          other.id == this.id &&
          other.ss58 == this.ss58 &&
          $driftBlobEquality.equals(other.obj, this.obj));
}

class UploadedObjectContentsCompanion
    extends UpdateCompanion<UploadedObjectContent> {
  final Value<int> id;
  final Value<int> ss58;
  final Value<Uint8List> obj;
  const UploadedObjectContentsCompanion({
    this.id = const Value.absent(),
    this.ss58 = const Value.absent(),
    this.obj = const Value.absent(),
  });
  UploadedObjectContentsCompanion.insert({
    this.id = const Value.absent(),
    required int ss58,
    required Uint8List obj,
  })  : ss58 = Value(ss58),
        obj = Value(obj);
  static Insertable<UploadedObjectContent> custom({
    Expression<int>? id,
    Expression<int>? ss58,
    Expression<Uint8List>? obj,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ss58 != null) 'ss58': ss58,
      if (obj != null) 'obj': obj,
    });
  }

  UploadedObjectContentsCompanion copyWith(
      {Value<int>? id, Value<int>? ss58, Value<Uint8List>? obj}) {
    return UploadedObjectContentsCompanion(
      id: id ?? this.id,
      ss58: ss58 ?? this.ss58,
      obj: obj ?? this.obj,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ss58.present) {
      map['ss58'] = Variable<int>(ss58.value);
    }
    if (obj.present) {
      map['obj'] = Variable<Uint8List>(obj.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UploadedObjectContentsCompanion(')
          ..write('id: $id, ')
          ..write('ss58: $ss58, ')
          ..write('obj: $obj')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final $BlockTimeCachesTable blockTimeCaches =
      $BlockTimeCachesTable(this);
  late final $UploadedObjectCachesTable uploadedObjectCaches =
      $UploadedObjectCachesTable(this);
  late final $UploadedObjectContentsTable uploadedObjectContents =
      $UploadedObjectContentsTable(this);
  late final Index blockTimeCacheIndex = Index('block_time_cache_index',
      'CREATE INDEX block_time_cache_index ON block_time_caches (chain_index, block_number)');
  late final Index uploadedObjectHashIndex = Index('uploaded_object_hash_index',
      'CREATE INDEX uploaded_object_hash_index ON uploaded_object_caches (joined_hashes)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        blockTimeCaches,
        uploadedObjectCaches,
        uploadedObjectContents,
        blockTimeCacheIndex,
        uploadedObjectHashIndex
      ];
}

typedef $$BlockTimeCachesTableCreateCompanionBuilder = BlockTimeCachesCompanion
    Function({
  Value<int> id,
  required ChainType chainIndex,
  required int blockNumber,
  required DateTime blockTime,
});
typedef $$BlockTimeCachesTableUpdateCompanionBuilder = BlockTimeCachesCompanion
    Function({
  Value<int> id,
  Value<ChainType> chainIndex,
  Value<int> blockNumber,
  Value<DateTime> blockTime,
});

class $$BlockTimeCachesTableFilterComposer
    extends Composer<_$CacheDatabase, $BlockTimeCachesTable> {
  $$BlockTimeCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ChainType, ChainType, int> get chainIndex =>
      $composableBuilder(
          column: $table.chainIndex,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get blockNumber => $composableBuilder(
      column: $table.blockNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get blockTime => $composableBuilder(
      column: $table.blockTime, builder: (column) => ColumnFilters(column));
}

class $$BlockTimeCachesTableOrderingComposer
    extends Composer<_$CacheDatabase, $BlockTimeCachesTable> {
  $$BlockTimeCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get chainIndex => $composableBuilder(
      column: $table.chainIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get blockNumber => $composableBuilder(
      column: $table.blockNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get blockTime => $composableBuilder(
      column: $table.blockTime, builder: (column) => ColumnOrderings(column));
}

class $$BlockTimeCachesTableAnnotationComposer
    extends Composer<_$CacheDatabase, $BlockTimeCachesTable> {
  $$BlockTimeCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ChainType, int> get chainIndex =>
      $composableBuilder(
          column: $table.chainIndex, builder: (column) => column);

  GeneratedColumn<int> get blockNumber => $composableBuilder(
      column: $table.blockNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get blockTime =>
      $composableBuilder(column: $table.blockTime, builder: (column) => column);
}

class $$BlockTimeCachesTableTableManager extends RootTableManager<
    _$CacheDatabase,
    $BlockTimeCachesTable,
    BlockTimeCache,
    $$BlockTimeCachesTableFilterComposer,
    $$BlockTimeCachesTableOrderingComposer,
    $$BlockTimeCachesTableAnnotationComposer,
    $$BlockTimeCachesTableCreateCompanionBuilder,
    $$BlockTimeCachesTableUpdateCompanionBuilder,
    (
      BlockTimeCache,
      BaseReferences<_$CacheDatabase, $BlockTimeCachesTable, BlockTimeCache>
    ),
    BlockTimeCache,
    PrefetchHooks Function()> {
  $$BlockTimeCachesTableTableManager(
      _$CacheDatabase db, $BlockTimeCachesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlockTimeCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlockTimeCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlockTimeCachesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ChainType> chainIndex = const Value.absent(),
            Value<int> blockNumber = const Value.absent(),
            Value<DateTime> blockTime = const Value.absent(),
          }) =>
              BlockTimeCachesCompanion(
            id: id,
            chainIndex: chainIndex,
            blockNumber: blockNumber,
            blockTime: blockTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required ChainType chainIndex,
            required int blockNumber,
            required DateTime blockTime,
          }) =>
              BlockTimeCachesCompanion.insert(
            id: id,
            chainIndex: chainIndex,
            blockNumber: blockNumber,
            blockTime: blockTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BlockTimeCachesTableProcessedTableManager = ProcessedTableManager<
    _$CacheDatabase,
    $BlockTimeCachesTable,
    BlockTimeCache,
    $$BlockTimeCachesTableFilterComposer,
    $$BlockTimeCachesTableOrderingComposer,
    $$BlockTimeCachesTableAnnotationComposer,
    $$BlockTimeCachesTableCreateCompanionBuilder,
    $$BlockTimeCachesTableUpdateCompanionBuilder,
    (
      BlockTimeCache,
      BaseReferences<_$CacheDatabase, $BlockTimeCachesTable, BlockTimeCache>
    ),
    BlockTimeCache,
    PrefetchHooks Function()>;
typedef $$UploadedObjectCachesTableCreateCompanionBuilder
    = UploadedObjectCachesCompanion Function({
  Value<int> id,
  required int ss58,
  required String stateName,
  required String stateBlockJson,
  required String compressedWith,
  required String categoryJson,
  required int whenCreated,
  Value<int?> whenApproved,
  required String owner,
  required String propsJson,
  required String joinedHashes,
});
typedef $$UploadedObjectCachesTableUpdateCompanionBuilder
    = UploadedObjectCachesCompanion Function({
  Value<int> id,
  Value<int> ss58,
  Value<String> stateName,
  Value<String> stateBlockJson,
  Value<String> compressedWith,
  Value<String> categoryJson,
  Value<int> whenCreated,
  Value<int?> whenApproved,
  Value<String> owner,
  Value<String> propsJson,
  Value<String> joinedHashes,
});

class $$UploadedObjectCachesTableFilterComposer
    extends Composer<_$CacheDatabase, $UploadedObjectCachesTable> {
  $$UploadedObjectCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ss58 => $composableBuilder(
      column: $table.ss58, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stateName => $composableBuilder(
      column: $table.stateName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stateBlockJson => $composableBuilder(
      column: $table.stateBlockJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get compressedWith => $composableBuilder(
      column: $table.compressedWith,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryJson => $composableBuilder(
      column: $table.categoryJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get whenCreated => $composableBuilder(
      column: $table.whenCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get whenApproved => $composableBuilder(
      column: $table.whenApproved, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get owner => $composableBuilder(
      column: $table.owner, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get propsJson => $composableBuilder(
      column: $table.propsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get joinedHashes => $composableBuilder(
      column: $table.joinedHashes, builder: (column) => ColumnFilters(column));
}

class $$UploadedObjectCachesTableOrderingComposer
    extends Composer<_$CacheDatabase, $UploadedObjectCachesTable> {
  $$UploadedObjectCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ss58 => $composableBuilder(
      column: $table.ss58, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stateName => $composableBuilder(
      column: $table.stateName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stateBlockJson => $composableBuilder(
      column: $table.stateBlockJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get compressedWith => $composableBuilder(
      column: $table.compressedWith,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryJson => $composableBuilder(
      column: $table.categoryJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get whenCreated => $composableBuilder(
      column: $table.whenCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get whenApproved => $composableBuilder(
      column: $table.whenApproved,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get owner => $composableBuilder(
      column: $table.owner, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get propsJson => $composableBuilder(
      column: $table.propsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get joinedHashes => $composableBuilder(
      column: $table.joinedHashes,
      builder: (column) => ColumnOrderings(column));
}

class $$UploadedObjectCachesTableAnnotationComposer
    extends Composer<_$CacheDatabase, $UploadedObjectCachesTable> {
  $$UploadedObjectCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ss58 =>
      $composableBuilder(column: $table.ss58, builder: (column) => column);

  GeneratedColumn<String> get stateName =>
      $composableBuilder(column: $table.stateName, builder: (column) => column);

  GeneratedColumn<String> get stateBlockJson => $composableBuilder(
      column: $table.stateBlockJson, builder: (column) => column);

  GeneratedColumn<String> get compressedWith => $composableBuilder(
      column: $table.compressedWith, builder: (column) => column);

  GeneratedColumn<String> get categoryJson => $composableBuilder(
      column: $table.categoryJson, builder: (column) => column);

  GeneratedColumn<int> get whenCreated => $composableBuilder(
      column: $table.whenCreated, builder: (column) => column);

  GeneratedColumn<int> get whenApproved => $composableBuilder(
      column: $table.whenApproved, builder: (column) => column);

  GeneratedColumn<String> get owner =>
      $composableBuilder(column: $table.owner, builder: (column) => column);

  GeneratedColumn<String> get propsJson =>
      $composableBuilder(column: $table.propsJson, builder: (column) => column);

  GeneratedColumn<String> get joinedHashes => $composableBuilder(
      column: $table.joinedHashes, builder: (column) => column);
}

class $$UploadedObjectCachesTableTableManager extends RootTableManager<
    _$CacheDatabase,
    $UploadedObjectCachesTable,
    UploadedObjectCache,
    $$UploadedObjectCachesTableFilterComposer,
    $$UploadedObjectCachesTableOrderingComposer,
    $$UploadedObjectCachesTableAnnotationComposer,
    $$UploadedObjectCachesTableCreateCompanionBuilder,
    $$UploadedObjectCachesTableUpdateCompanionBuilder,
    (
      UploadedObjectCache,
      BaseReferences<_$CacheDatabase, $UploadedObjectCachesTable,
          UploadedObjectCache>
    ),
    UploadedObjectCache,
    PrefetchHooks Function()> {
  $$UploadedObjectCachesTableTableManager(
      _$CacheDatabase db, $UploadedObjectCachesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UploadedObjectCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UploadedObjectCachesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UploadedObjectCachesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> ss58 = const Value.absent(),
            Value<String> stateName = const Value.absent(),
            Value<String> stateBlockJson = const Value.absent(),
            Value<String> compressedWith = const Value.absent(),
            Value<String> categoryJson = const Value.absent(),
            Value<int> whenCreated = const Value.absent(),
            Value<int?> whenApproved = const Value.absent(),
            Value<String> owner = const Value.absent(),
            Value<String> propsJson = const Value.absent(),
            Value<String> joinedHashes = const Value.absent(),
          }) =>
              UploadedObjectCachesCompanion(
            id: id,
            ss58: ss58,
            stateName: stateName,
            stateBlockJson: stateBlockJson,
            compressedWith: compressedWith,
            categoryJson: categoryJson,
            whenCreated: whenCreated,
            whenApproved: whenApproved,
            owner: owner,
            propsJson: propsJson,
            joinedHashes: joinedHashes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int ss58,
            required String stateName,
            required String stateBlockJson,
            required String compressedWith,
            required String categoryJson,
            required int whenCreated,
            Value<int?> whenApproved = const Value.absent(),
            required String owner,
            required String propsJson,
            required String joinedHashes,
          }) =>
              UploadedObjectCachesCompanion.insert(
            id: id,
            ss58: ss58,
            stateName: stateName,
            stateBlockJson: stateBlockJson,
            compressedWith: compressedWith,
            categoryJson: categoryJson,
            whenCreated: whenCreated,
            whenApproved: whenApproved,
            owner: owner,
            propsJson: propsJson,
            joinedHashes: joinedHashes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UploadedObjectCachesTableProcessedTableManager
    = ProcessedTableManager<
        _$CacheDatabase,
        $UploadedObjectCachesTable,
        UploadedObjectCache,
        $$UploadedObjectCachesTableFilterComposer,
        $$UploadedObjectCachesTableOrderingComposer,
        $$UploadedObjectCachesTableAnnotationComposer,
        $$UploadedObjectCachesTableCreateCompanionBuilder,
        $$UploadedObjectCachesTableUpdateCompanionBuilder,
        (
          UploadedObjectCache,
          BaseReferences<_$CacheDatabase, $UploadedObjectCachesTable,
              UploadedObjectCache>
        ),
        UploadedObjectCache,
        PrefetchHooks Function()>;
typedef $$UploadedObjectContentsTableCreateCompanionBuilder
    = UploadedObjectContentsCompanion Function({
  Value<int> id,
  required int ss58,
  required Uint8List obj,
});
typedef $$UploadedObjectContentsTableUpdateCompanionBuilder
    = UploadedObjectContentsCompanion Function({
  Value<int> id,
  Value<int> ss58,
  Value<Uint8List> obj,
});

class $$UploadedObjectContentsTableFilterComposer
    extends Composer<_$CacheDatabase, $UploadedObjectContentsTable> {
  $$UploadedObjectContentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ss58 => $composableBuilder(
      column: $table.ss58, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get obj => $composableBuilder(
      column: $table.obj, builder: (column) => ColumnFilters(column));
}

class $$UploadedObjectContentsTableOrderingComposer
    extends Composer<_$CacheDatabase, $UploadedObjectContentsTable> {
  $$UploadedObjectContentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ss58 => $composableBuilder(
      column: $table.ss58, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get obj => $composableBuilder(
      column: $table.obj, builder: (column) => ColumnOrderings(column));
}

class $$UploadedObjectContentsTableAnnotationComposer
    extends Composer<_$CacheDatabase, $UploadedObjectContentsTable> {
  $$UploadedObjectContentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ss58 =>
      $composableBuilder(column: $table.ss58, builder: (column) => column);

  GeneratedColumn<Uint8List> get obj =>
      $composableBuilder(column: $table.obj, builder: (column) => column);
}

class $$UploadedObjectContentsTableTableManager extends RootTableManager<
    _$CacheDatabase,
    $UploadedObjectContentsTable,
    UploadedObjectContent,
    $$UploadedObjectContentsTableFilterComposer,
    $$UploadedObjectContentsTableOrderingComposer,
    $$UploadedObjectContentsTableAnnotationComposer,
    $$UploadedObjectContentsTableCreateCompanionBuilder,
    $$UploadedObjectContentsTableUpdateCompanionBuilder,
    (
      UploadedObjectContent,
      BaseReferences<_$CacheDatabase, $UploadedObjectContentsTable,
          UploadedObjectContent>
    ),
    UploadedObjectContent,
    PrefetchHooks Function()> {
  $$UploadedObjectContentsTableTableManager(
      _$CacheDatabase db, $UploadedObjectContentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UploadedObjectContentsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$UploadedObjectContentsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UploadedObjectContentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> ss58 = const Value.absent(),
            Value<Uint8List> obj = const Value.absent(),
          }) =>
              UploadedObjectContentsCompanion(
            id: id,
            ss58: ss58,
            obj: obj,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int ss58,
            required Uint8List obj,
          }) =>
              UploadedObjectContentsCompanion.insert(
            id: id,
            ss58: ss58,
            obj: obj,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UploadedObjectContentsTableProcessedTableManager
    = ProcessedTableManager<
        _$CacheDatabase,
        $UploadedObjectContentsTable,
        UploadedObjectContent,
        $$UploadedObjectContentsTableFilterComposer,
        $$UploadedObjectContentsTableOrderingComposer,
        $$UploadedObjectContentsTableAnnotationComposer,
        $$UploadedObjectContentsTableCreateCompanionBuilder,
        $$UploadedObjectContentsTableUpdateCompanionBuilder,
        (
          UploadedObjectContent,
          BaseReferences<_$CacheDatabase, $UploadedObjectContentsTable,
              UploadedObjectContent>
        ),
        UploadedObjectContent,
        PrefetchHooks Function()>;

class $CacheDatabaseManager {
  final _$CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  $$BlockTimeCachesTableTableManager get blockTimeCaches =>
      $$BlockTimeCachesTableTableManager(_db, _db.blockTimeCaches);
  $$UploadedObjectCachesTableTableManager get uploadedObjectCaches =>
      $$UploadedObjectCachesTableTableManager(_db, _db.uploadedObjectCaches);
  $$UploadedObjectContentsTableTableManager get uploadedObjectContents =>
      $$UploadedObjectContentsTableTableManager(
          _db, _db.uploadedObjectContents);
}
