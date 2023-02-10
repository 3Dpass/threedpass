// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transfers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetTransfersData> _$gGetTransfersDataSerializer =
    new _$GGetTransfersDataSerializer();
Serializer<GGetTransfersData_getTransfers>
    _$gGetTransfersDataGetTransfersSerializer =
    new _$GGetTransfersData_getTransfersSerializer();
Serializer<GGetTransfersData_getTransfers_pageInfo>
    _$gGetTransfersDataGetTransfersPageInfoSerializer =
    new _$GGetTransfersData_getTransfers_pageInfoSerializer();
Serializer<GGetTransfersData_getTransfers_objects>
    _$gGetTransfersDataGetTransfersObjectsSerializer =
    new _$GGetTransfersData_getTransfers_objectsSerializer();

class _$GGetTransfersDataSerializer
    implements StructuredSerializer<GGetTransfersData> {
  @override
  final Iterable<Type> types = const [GGetTransfersData, _$GGetTransfersData];
  @override
  final String wireName = 'GGetTransfersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetTransfersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.getTransfers;
    if (value != null) {
      result
        ..add('getTransfers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetTransfersData_getTransfers)));
    }
    return result;
  }

  @override
  GGetTransfersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetTransfersDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'getTransfers':
          result.getTransfers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetTransfersData_getTransfers))!
              as GGetTransfersData_getTransfers);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetTransfersData_getTransfersSerializer
    implements StructuredSerializer<GGetTransfersData_getTransfers> {
  @override
  final Iterable<Type> types = const [
    GGetTransfersData_getTransfers,
    _$GGetTransfersData_getTransfers
  ];
  @override
  final String wireName = 'GGetTransfersData_getTransfers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetTransfersData_getTransfers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pageInfo;
    if (value != null) {
      result
        ..add('pageInfo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetTransfersData_getTransfers_pageInfo)));
    }
    value = object.objects;
    if (value != null) {
      result
        ..add('objects')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GGetTransfersData_getTransfers_objects)
            ])));
    }
    return result;
  }

  @override
  GGetTransfersData_getTransfers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetTransfersData_getTransfersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetTransfersData_getTransfers_pageInfo))!
              as GGetTransfersData_getTransfers_pageInfo);
          break;
        case 'objects':
          result.objects.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetTransfersData_getTransfers_objects)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetTransfersData_getTransfers_pageInfoSerializer
    implements StructuredSerializer<GGetTransfersData_getTransfers_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GGetTransfersData_getTransfers_pageInfo,
    _$GGetTransfersData_getTransfers_pageInfo
  ];
  @override
  final String wireName = 'GGetTransfersData_getTransfers_pageInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetTransfersData_getTransfers_pageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.pageSize;
    if (value != null) {
      result
        ..add('pageSize')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pageNext;
    if (value != null) {
      result
        ..add('pageNext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pagePrev;
    if (value != null) {
      result
        ..add('pagePrev')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetTransfersData_getTransfers_pageInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetTransfersData_getTransfers_pageInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pageSize':
          result.pageSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pageNext':
          result.pageNext = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pagePrev':
          result.pagePrev = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetTransfersData_getTransfers_objectsSerializer
    implements StructuredSerializer<GGetTransfersData_getTransfers_objects> {
  @override
  final Iterable<Type> types = const [
    GGetTransfersData_getTransfers_objects,
    _$GGetTransfersData_getTransfers_objects
  ];
  @override
  final String wireName = 'GGetTransfersData_getTransfers_objects';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetTransfersData_getTransfers_objects object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eventIdx;
    if (value != null) {
      result
        ..add('eventIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fromMultiAddressAccountId;
    if (value != null) {
      result
        ..add('fromMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAccountId;
    if (value != null) {
      result
        ..add('toMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GDateTime)));
    }
    return result;
  }

  @override
  GGetTransfersData_getTransfers_objects deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetTransfersData_getTransfers_objectsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'eventIdx':
          result.eventIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fromMultiAddressAccountId':
          result.fromMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAccountId':
          result.toMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime))! as _i2.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetTransfersData extends GGetTransfersData {
  @override
  final String G__typename;
  @override
  final GGetTransfersData_getTransfers? getTransfers;

  factory _$GGetTransfersData(
          [void Function(GGetTransfersDataBuilder)? updates]) =>
      (new GGetTransfersDataBuilder()..update(updates))._build();

  _$GGetTransfersData._({required this.G__typename, this.getTransfers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetTransfersData', 'G__typename');
  }

  @override
  GGetTransfersData rebuild(void Function(GGetTransfersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetTransfersDataBuilder toBuilder() =>
      new GGetTransfersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetTransfersData &&
        G__typename == other.G__typename &&
        getTransfers == other.getTransfers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, getTransfers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetTransfersData')
          ..add('G__typename', G__typename)
          ..add('getTransfers', getTransfers))
        .toString();
  }
}

class GGetTransfersDataBuilder
    implements Builder<GGetTransfersData, GGetTransfersDataBuilder> {
  _$GGetTransfersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetTransfersData_getTransfersBuilder? _getTransfers;
  GGetTransfersData_getTransfersBuilder get getTransfers =>
      _$this._getTransfers ??= new GGetTransfersData_getTransfersBuilder();
  set getTransfers(GGetTransfersData_getTransfersBuilder? getTransfers) =>
      _$this._getTransfers = getTransfers;

  GGetTransfersDataBuilder() {
    GGetTransfersData._initializeBuilder(this);
  }

  GGetTransfersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getTransfers = $v.getTransfers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetTransfersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetTransfersData;
  }

  @override
  void update(void Function(GGetTransfersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetTransfersData build() => _build();

  _$GGetTransfersData _build() {
    _$GGetTransfersData _$result;
    try {
      _$result = _$v ??
          new _$GGetTransfersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetTransfersData', 'G__typename'),
              getTransfers: _getTransfers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'getTransfers';
        _getTransfers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetTransfersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetTransfersData_getTransfers extends GGetTransfersData_getTransfers {
  @override
  final String G__typename;
  @override
  final GGetTransfersData_getTransfers_pageInfo? pageInfo;
  @override
  final BuiltList<GGetTransfersData_getTransfers_objects>? objects;

  factory _$GGetTransfersData_getTransfers(
          [void Function(GGetTransfersData_getTransfersBuilder)? updates]) =>
      (new GGetTransfersData_getTransfersBuilder()..update(updates))._build();

  _$GGetTransfersData_getTransfers._(
      {required this.G__typename, this.pageInfo, this.objects})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetTransfersData_getTransfers', 'G__typename');
  }

  @override
  GGetTransfersData_getTransfers rebuild(
          void Function(GGetTransfersData_getTransfersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetTransfersData_getTransfersBuilder toBuilder() =>
      new GGetTransfersData_getTransfersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetTransfersData_getTransfers &&
        G__typename == other.G__typename &&
        pageInfo == other.pageInfo &&
        objects == other.objects;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pageInfo.hashCode);
    _$hash = $jc(_$hash, objects.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetTransfersData_getTransfers')
          ..add('G__typename', G__typename)
          ..add('pageInfo', pageInfo)
          ..add('objects', objects))
        .toString();
  }
}

class GGetTransfersData_getTransfersBuilder
    implements
        Builder<GGetTransfersData_getTransfers,
            GGetTransfersData_getTransfersBuilder> {
  _$GGetTransfersData_getTransfers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetTransfersData_getTransfers_pageInfoBuilder? _pageInfo;
  GGetTransfersData_getTransfers_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??= new GGetTransfersData_getTransfers_pageInfoBuilder();
  set pageInfo(GGetTransfersData_getTransfers_pageInfoBuilder? pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GGetTransfersData_getTransfers_objects>? _objects;
  ListBuilder<GGetTransfersData_getTransfers_objects> get objects =>
      _$this._objects ??=
          new ListBuilder<GGetTransfersData_getTransfers_objects>();
  set objects(ListBuilder<GGetTransfersData_getTransfers_objects>? objects) =>
      _$this._objects = objects;

  GGetTransfersData_getTransfersBuilder() {
    GGetTransfersData_getTransfers._initializeBuilder(this);
  }

  GGetTransfersData_getTransfersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pageInfo = $v.pageInfo?.toBuilder();
      _objects = $v.objects?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetTransfersData_getTransfers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetTransfersData_getTransfers;
  }

  @override
  void update(void Function(GGetTransfersData_getTransfersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetTransfersData_getTransfers build() => _build();

  _$GGetTransfersData_getTransfers _build() {
    _$GGetTransfersData_getTransfers _$result;
    try {
      _$result = _$v ??
          new _$GGetTransfersData_getTransfers._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetTransfersData_getTransfers', 'G__typename'),
              pageInfo: _pageInfo?.build(),
              objects: _objects?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pageInfo';
        _pageInfo?.build();
        _$failedField = 'objects';
        _objects?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetTransfersData_getTransfers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetTransfersData_getTransfers_pageInfo
    extends GGetTransfersData_getTransfers_pageInfo {
  @override
  final String G__typename;
  @override
  final int? pageSize;
  @override
  final String? pageNext;
  @override
  final String? pagePrev;

  factory _$GGetTransfersData_getTransfers_pageInfo(
          [void Function(GGetTransfersData_getTransfers_pageInfoBuilder)?
              updates]) =>
      (new GGetTransfersData_getTransfers_pageInfoBuilder()..update(updates))
          ._build();

  _$GGetTransfersData_getTransfers_pageInfo._(
      {required this.G__typename, this.pageSize, this.pageNext, this.pagePrev})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetTransfersData_getTransfers_pageInfo', 'G__typename');
  }

  @override
  GGetTransfersData_getTransfers_pageInfo rebuild(
          void Function(GGetTransfersData_getTransfers_pageInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetTransfersData_getTransfers_pageInfoBuilder toBuilder() =>
      new GGetTransfersData_getTransfers_pageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetTransfersData_getTransfers_pageInfo &&
        G__typename == other.G__typename &&
        pageSize == other.pageSize &&
        pageNext == other.pageNext &&
        pagePrev == other.pagePrev;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, pageNext.hashCode);
    _$hash = $jc(_$hash, pagePrev.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetTransfersData_getTransfers_pageInfo')
          ..add('G__typename', G__typename)
          ..add('pageSize', pageSize)
          ..add('pageNext', pageNext)
          ..add('pagePrev', pagePrev))
        .toString();
  }
}

class GGetTransfersData_getTransfers_pageInfoBuilder
    implements
        Builder<GGetTransfersData_getTransfers_pageInfo,
            GGetTransfersData_getTransfers_pageInfoBuilder> {
  _$GGetTransfersData_getTransfers_pageInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  String? _pageNext;
  String? get pageNext => _$this._pageNext;
  set pageNext(String? pageNext) => _$this._pageNext = pageNext;

  String? _pagePrev;
  String? get pagePrev => _$this._pagePrev;
  set pagePrev(String? pagePrev) => _$this._pagePrev = pagePrev;

  GGetTransfersData_getTransfers_pageInfoBuilder() {
    GGetTransfersData_getTransfers_pageInfo._initializeBuilder(this);
  }

  GGetTransfersData_getTransfers_pageInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pageSize = $v.pageSize;
      _pageNext = $v.pageNext;
      _pagePrev = $v.pagePrev;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetTransfersData_getTransfers_pageInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetTransfersData_getTransfers_pageInfo;
  }

  @override
  void update(
      void Function(GGetTransfersData_getTransfers_pageInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetTransfersData_getTransfers_pageInfo build() => _build();

  _$GGetTransfersData_getTransfers_pageInfo _build() {
    final _$result = _$v ??
        new _$GGetTransfersData_getTransfers_pageInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetTransfersData_getTransfers_pageInfo', 'G__typename'),
            pageSize: pageSize,
            pageNext: pageNext,
            pagePrev: pagePrev);
    replace(_$result);
    return _$result;
  }
}

class _$GGetTransfersData_getTransfers_objects
    extends GGetTransfersData_getTransfers_objects {
  @override
  final String G__typename;
  @override
  final int? blockNumber;
  @override
  final int? extrinsicIdx;
  @override
  final int? eventIdx;
  @override
  final String? fromMultiAddressAccountId;
  @override
  final String? toMultiAddressAccountId;
  @override
  final double? value;
  @override
  final _i2.GDateTime? blockDatetime;

  factory _$GGetTransfersData_getTransfers_objects(
          [void Function(GGetTransfersData_getTransfers_objectsBuilder)?
              updates]) =>
      (new GGetTransfersData_getTransfers_objectsBuilder()..update(updates))
          ._build();

  _$GGetTransfersData_getTransfers_objects._(
      {required this.G__typename,
      this.blockNumber,
      this.extrinsicIdx,
      this.eventIdx,
      this.fromMultiAddressAccountId,
      this.toMultiAddressAccountId,
      this.value,
      this.blockDatetime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetTransfersData_getTransfers_objects', 'G__typename');
  }

  @override
  GGetTransfersData_getTransfers_objects rebuild(
          void Function(GGetTransfersData_getTransfers_objectsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetTransfersData_getTransfers_objectsBuilder toBuilder() =>
      new GGetTransfersData_getTransfers_objectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetTransfersData_getTransfers_objects &&
        G__typename == other.G__typename &&
        blockNumber == other.blockNumber &&
        extrinsicIdx == other.extrinsicIdx &&
        eventIdx == other.eventIdx &&
        fromMultiAddressAccountId == other.fromMultiAddressAccountId &&
        toMultiAddressAccountId == other.toMultiAddressAccountId &&
        value == other.value &&
        blockDatetime == other.blockDatetime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, blockNumber.hashCode);
    _$hash = $jc(_$hash, extrinsicIdx.hashCode);
    _$hash = $jc(_$hash, eventIdx.hashCode);
    _$hash = $jc(_$hash, fromMultiAddressAccountId.hashCode);
    _$hash = $jc(_$hash, toMultiAddressAccountId.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, blockDatetime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetTransfersData_getTransfers_objects')
          ..add('G__typename', G__typename)
          ..add('blockNumber', blockNumber)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('eventIdx', eventIdx)
          ..add('fromMultiAddressAccountId', fromMultiAddressAccountId)
          ..add('toMultiAddressAccountId', toMultiAddressAccountId)
          ..add('value', value)
          ..add('blockDatetime', blockDatetime))
        .toString();
  }
}

class GGetTransfersData_getTransfers_objectsBuilder
    implements
        Builder<GGetTransfersData_getTransfers_objects,
            GGetTransfersData_getTransfers_objectsBuilder> {
  _$GGetTransfersData_getTransfers_objects? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _blockNumber;
  int? get blockNumber => _$this._blockNumber;
  set blockNumber(int? blockNumber) => _$this._blockNumber = blockNumber;

  int? _extrinsicIdx;
  int? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(int? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  int? _eventIdx;
  int? get eventIdx => _$this._eventIdx;
  set eventIdx(int? eventIdx) => _$this._eventIdx = eventIdx;

  String? _fromMultiAddressAccountId;
  String? get fromMultiAddressAccountId => _$this._fromMultiAddressAccountId;
  set fromMultiAddressAccountId(String? fromMultiAddressAccountId) =>
      _$this._fromMultiAddressAccountId = fromMultiAddressAccountId;

  String? _toMultiAddressAccountId;
  String? get toMultiAddressAccountId => _$this._toMultiAddressAccountId;
  set toMultiAddressAccountId(String? toMultiAddressAccountId) =>
      _$this._toMultiAddressAccountId = toMultiAddressAccountId;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  _i2.GDateTimeBuilder? _blockDatetime;
  _i2.GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new _i2.GDateTimeBuilder();
  set blockDatetime(_i2.GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GGetTransfersData_getTransfers_objectsBuilder() {
    GGetTransfersData_getTransfers_objects._initializeBuilder(this);
  }

  GGetTransfersData_getTransfers_objectsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _blockNumber = $v.blockNumber;
      _extrinsicIdx = $v.extrinsicIdx;
      _eventIdx = $v.eventIdx;
      _fromMultiAddressAccountId = $v.fromMultiAddressAccountId;
      _toMultiAddressAccountId = $v.toMultiAddressAccountId;
      _value = $v.value;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetTransfersData_getTransfers_objects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetTransfersData_getTransfers_objects;
  }

  @override
  void update(
      void Function(GGetTransfersData_getTransfers_objectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetTransfersData_getTransfers_objects build() => _build();

  _$GGetTransfersData_getTransfers_objects _build() {
    _$GGetTransfersData_getTransfers_objects _$result;
    try {
      _$result = _$v ??
          new _$GGetTransfersData_getTransfers_objects._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetTransfersData_getTransfers_objects', 'G__typename'),
              blockNumber: blockNumber,
              extrinsicIdx: extrinsicIdx,
              eventIdx: eventIdx,
              fromMultiAddressAccountId: fromMultiAddressAccountId,
              toMultiAddressAccountId: toMultiAddressAccountId,
              value: value,
              blockDatetime: _blockDatetime?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetTransfersData_getTransfers_objects',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
