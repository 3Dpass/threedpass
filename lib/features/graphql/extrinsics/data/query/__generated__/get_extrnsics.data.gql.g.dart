// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_extrnsics.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetExtrinsicsData> _$gGetExtrinsicsDataSerializer =
    new _$GGetExtrinsicsDataSerializer();
Serializer<GGetExtrinsicsData_getExtrinsics>
    _$gGetExtrinsicsDataGetExtrinsicsSerializer =
    new _$GGetExtrinsicsData_getExtrinsicsSerializer();
Serializer<GGetExtrinsicsData_getExtrinsics_pageInfo>
    _$gGetExtrinsicsDataGetExtrinsicsPageInfoSerializer =
    new _$GGetExtrinsicsData_getExtrinsics_pageInfoSerializer();
Serializer<GGetExtrinsicsData_getExtrinsics_objects>
    _$gGetExtrinsicsDataGetExtrinsicsObjectsSerializer =
    new _$GGetExtrinsicsData_getExtrinsics_objectsSerializer();

class _$GGetExtrinsicsDataSerializer
    implements StructuredSerializer<GGetExtrinsicsData> {
  @override
  final Iterable<Type> types = const [GGetExtrinsicsData, _$GGetExtrinsicsData];
  @override
  final String wireName = 'GGetExtrinsicsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetExtrinsicsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.getExtrinsics;
    if (value != null) {
      result
        ..add('getExtrinsics')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetExtrinsicsData_getExtrinsics)));
    }
    return result;
  }

  @override
  GGetExtrinsicsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetExtrinsicsDataBuilder();

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
        case 'getExtrinsics':
          result.getExtrinsics.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetExtrinsicsData_getExtrinsics))!
              as GGetExtrinsicsData_getExtrinsics);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetExtrinsicsData_getExtrinsicsSerializer
    implements StructuredSerializer<GGetExtrinsicsData_getExtrinsics> {
  @override
  final Iterable<Type> types = const [
    GGetExtrinsicsData_getExtrinsics,
    _$GGetExtrinsicsData_getExtrinsics
  ];
  @override
  final String wireName = 'GGetExtrinsicsData_getExtrinsics';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetExtrinsicsData_getExtrinsics object,
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
                const FullType(GGetExtrinsicsData_getExtrinsics_pageInfo)));
    }
    value = object.objects;
    if (value != null) {
      result
        ..add('objects')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetExtrinsicsData_getExtrinsics_objects)
            ])));
    }
    return result;
  }

  @override
  GGetExtrinsicsData_getExtrinsics deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetExtrinsicsData_getExtrinsicsBuilder();

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
                  specifiedType: const FullType(
                      GGetExtrinsicsData_getExtrinsics_pageInfo))!
              as GGetExtrinsicsData_getExtrinsics_pageInfo);
          break;
        case 'objects':
          result.objects.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetExtrinsicsData_getExtrinsics_objects)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetExtrinsicsData_getExtrinsics_pageInfoSerializer
    implements StructuredSerializer<GGetExtrinsicsData_getExtrinsics_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GGetExtrinsicsData_getExtrinsics_pageInfo,
    _$GGetExtrinsicsData_getExtrinsics_pageInfo
  ];
  @override
  final String wireName = 'GGetExtrinsicsData_getExtrinsics_pageInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetExtrinsicsData_getExtrinsics_pageInfo object,
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
  GGetExtrinsicsData_getExtrinsics_pageInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetExtrinsicsData_getExtrinsics_pageInfoBuilder();

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

class _$GGetExtrinsicsData_getExtrinsics_objectsSerializer
    implements StructuredSerializer<GGetExtrinsicsData_getExtrinsics_objects> {
  @override
  final Iterable<Type> types = const [
    GGetExtrinsicsData_getExtrinsics_objects,
    _$GGetExtrinsicsData_getExtrinsics_objects
  ];
  @override
  final String wireName = 'GGetExtrinsicsData_getExtrinsics_objects';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetExtrinsicsData_getExtrinsics_objects object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'complete',
      serializers.serialize(object.complete,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.multiAddressAccountId;
    if (value != null) {
      result
        ..add('multiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.callModule;
    if (value != null) {
      result
        ..add('callModule')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.callName;
    if (value != null) {
      result
        ..add('callName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.callArguments;
    if (value != null) {
      result
        ..add('callArguments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GJSONString)));
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
  GGetExtrinsicsData_getExtrinsics_objects deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetExtrinsicsData_getExtrinsics_objectsBuilder();

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
        case 'multiAddressAccountId':
          result.multiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'callModule':
          result.callModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'callName':
          result.callName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'callArguments':
          result.callArguments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GJSONString))!
              as _i2.GJSONString);
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime))! as _i2.GDateTime);
          break;
        case 'complete':
          result.complete = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetExtrinsicsData extends GGetExtrinsicsData {
  @override
  final String G__typename;
  @override
  final GGetExtrinsicsData_getExtrinsics? getExtrinsics;

  factory _$GGetExtrinsicsData(
          [void Function(GGetExtrinsicsDataBuilder)? updates]) =>
      (new GGetExtrinsicsDataBuilder()..update(updates))._build();

  _$GGetExtrinsicsData._({required this.G__typename, this.getExtrinsics})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetExtrinsicsData', 'G__typename');
  }

  @override
  GGetExtrinsicsData rebuild(
          void Function(GGetExtrinsicsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetExtrinsicsDataBuilder toBuilder() =>
      new GGetExtrinsicsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetExtrinsicsData &&
        G__typename == other.G__typename &&
        getExtrinsics == other.getExtrinsics;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, getExtrinsics.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetExtrinsicsData')
          ..add('G__typename', G__typename)
          ..add('getExtrinsics', getExtrinsics))
        .toString();
  }
}

class GGetExtrinsicsDataBuilder
    implements Builder<GGetExtrinsicsData, GGetExtrinsicsDataBuilder> {
  _$GGetExtrinsicsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetExtrinsicsData_getExtrinsicsBuilder? _getExtrinsics;
  GGetExtrinsicsData_getExtrinsicsBuilder get getExtrinsics =>
      _$this._getExtrinsics ??= new GGetExtrinsicsData_getExtrinsicsBuilder();
  set getExtrinsics(GGetExtrinsicsData_getExtrinsicsBuilder? getExtrinsics) =>
      _$this._getExtrinsics = getExtrinsics;

  GGetExtrinsicsDataBuilder() {
    GGetExtrinsicsData._initializeBuilder(this);
  }

  GGetExtrinsicsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getExtrinsics = $v.getExtrinsics?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetExtrinsicsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetExtrinsicsData;
  }

  @override
  void update(void Function(GGetExtrinsicsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetExtrinsicsData build() => _build();

  _$GGetExtrinsicsData _build() {
    _$GGetExtrinsicsData _$result;
    try {
      _$result = _$v ??
          new _$GGetExtrinsicsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetExtrinsicsData', 'G__typename'),
              getExtrinsics: _getExtrinsics?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'getExtrinsics';
        _getExtrinsics?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetExtrinsicsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetExtrinsicsData_getExtrinsics
    extends GGetExtrinsicsData_getExtrinsics {
  @override
  final String G__typename;
  @override
  final GGetExtrinsicsData_getExtrinsics_pageInfo? pageInfo;
  @override
  final BuiltList<GGetExtrinsicsData_getExtrinsics_objects?>? objects;

  factory _$GGetExtrinsicsData_getExtrinsics(
          [void Function(GGetExtrinsicsData_getExtrinsicsBuilder)? updates]) =>
      (new GGetExtrinsicsData_getExtrinsicsBuilder()..update(updates))._build();

  _$GGetExtrinsicsData_getExtrinsics._(
      {required this.G__typename, this.pageInfo, this.objects})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetExtrinsicsData_getExtrinsics', 'G__typename');
  }

  @override
  GGetExtrinsicsData_getExtrinsics rebuild(
          void Function(GGetExtrinsicsData_getExtrinsicsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetExtrinsicsData_getExtrinsicsBuilder toBuilder() =>
      new GGetExtrinsicsData_getExtrinsicsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetExtrinsicsData_getExtrinsics &&
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
    return (newBuiltValueToStringHelper(r'GGetExtrinsicsData_getExtrinsics')
          ..add('G__typename', G__typename)
          ..add('pageInfo', pageInfo)
          ..add('objects', objects))
        .toString();
  }
}

class GGetExtrinsicsData_getExtrinsicsBuilder
    implements
        Builder<GGetExtrinsicsData_getExtrinsics,
            GGetExtrinsicsData_getExtrinsicsBuilder> {
  _$GGetExtrinsicsData_getExtrinsics? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetExtrinsicsData_getExtrinsics_pageInfoBuilder? _pageInfo;
  GGetExtrinsicsData_getExtrinsics_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??=
          new GGetExtrinsicsData_getExtrinsics_pageInfoBuilder();
  set pageInfo(GGetExtrinsicsData_getExtrinsics_pageInfoBuilder? pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GGetExtrinsicsData_getExtrinsics_objects?>? _objects;
  ListBuilder<GGetExtrinsicsData_getExtrinsics_objects?> get objects =>
      _$this._objects ??=
          new ListBuilder<GGetExtrinsicsData_getExtrinsics_objects?>();
  set objects(
          ListBuilder<GGetExtrinsicsData_getExtrinsics_objects?>? objects) =>
      _$this._objects = objects;

  GGetExtrinsicsData_getExtrinsicsBuilder() {
    GGetExtrinsicsData_getExtrinsics._initializeBuilder(this);
  }

  GGetExtrinsicsData_getExtrinsicsBuilder get _$this {
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
  void replace(GGetExtrinsicsData_getExtrinsics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetExtrinsicsData_getExtrinsics;
  }

  @override
  void update(void Function(GGetExtrinsicsData_getExtrinsicsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetExtrinsicsData_getExtrinsics build() => _build();

  _$GGetExtrinsicsData_getExtrinsics _build() {
    _$GGetExtrinsicsData_getExtrinsics _$result;
    try {
      _$result = _$v ??
          new _$GGetExtrinsicsData_getExtrinsics._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetExtrinsicsData_getExtrinsics', 'G__typename'),
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
            r'GGetExtrinsicsData_getExtrinsics', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetExtrinsicsData_getExtrinsics_pageInfo
    extends GGetExtrinsicsData_getExtrinsics_pageInfo {
  @override
  final String G__typename;
  @override
  final int? pageSize;
  @override
  final String? pageNext;
  @override
  final String? pagePrev;

  factory _$GGetExtrinsicsData_getExtrinsics_pageInfo(
          [void Function(GGetExtrinsicsData_getExtrinsics_pageInfoBuilder)?
              updates]) =>
      (new GGetExtrinsicsData_getExtrinsics_pageInfoBuilder()..update(updates))
          ._build();

  _$GGetExtrinsicsData_getExtrinsics_pageInfo._(
      {required this.G__typename, this.pageSize, this.pageNext, this.pagePrev})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetExtrinsicsData_getExtrinsics_pageInfo', 'G__typename');
  }

  @override
  GGetExtrinsicsData_getExtrinsics_pageInfo rebuild(
          void Function(GGetExtrinsicsData_getExtrinsics_pageInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetExtrinsicsData_getExtrinsics_pageInfoBuilder toBuilder() =>
      new GGetExtrinsicsData_getExtrinsics_pageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetExtrinsicsData_getExtrinsics_pageInfo &&
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
            r'GGetExtrinsicsData_getExtrinsics_pageInfo')
          ..add('G__typename', G__typename)
          ..add('pageSize', pageSize)
          ..add('pageNext', pageNext)
          ..add('pagePrev', pagePrev))
        .toString();
  }
}

class GGetExtrinsicsData_getExtrinsics_pageInfoBuilder
    implements
        Builder<GGetExtrinsicsData_getExtrinsics_pageInfo,
            GGetExtrinsicsData_getExtrinsics_pageInfoBuilder> {
  _$GGetExtrinsicsData_getExtrinsics_pageInfo? _$v;

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

  GGetExtrinsicsData_getExtrinsics_pageInfoBuilder() {
    GGetExtrinsicsData_getExtrinsics_pageInfo._initializeBuilder(this);
  }

  GGetExtrinsicsData_getExtrinsics_pageInfoBuilder get _$this {
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
  void replace(GGetExtrinsicsData_getExtrinsics_pageInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetExtrinsicsData_getExtrinsics_pageInfo;
  }

  @override
  void update(
      void Function(GGetExtrinsicsData_getExtrinsics_pageInfoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetExtrinsicsData_getExtrinsics_pageInfo build() => _build();

  _$GGetExtrinsicsData_getExtrinsics_pageInfo _build() {
    final _$result = _$v ??
        new _$GGetExtrinsicsData_getExtrinsics_pageInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetExtrinsicsData_getExtrinsics_pageInfo', 'G__typename'),
            pageSize: pageSize,
            pageNext: pageNext,
            pagePrev: pagePrev);
    replace(_$result);
    return _$result;
  }
}

class _$GGetExtrinsicsData_getExtrinsics_objects
    extends GGetExtrinsicsData_getExtrinsics_objects {
  @override
  final String G__typename;
  @override
  final String? multiAddressAccountId;
  @override
  final int? extrinsicIdx;
  @override
  final int? blockNumber;
  @override
  final String? callModule;
  @override
  final String? callName;
  @override
  final _i2.GJSONString? callArguments;
  @override
  final _i2.GDateTime? blockDatetime;
  @override
  final int complete;

  factory _$GGetExtrinsicsData_getExtrinsics_objects(
          [void Function(GGetExtrinsicsData_getExtrinsics_objectsBuilder)?
              updates]) =>
      (new GGetExtrinsicsData_getExtrinsics_objectsBuilder()..update(updates))
          ._build();

  _$GGetExtrinsicsData_getExtrinsics_objects._(
      {required this.G__typename,
      this.multiAddressAccountId,
      this.extrinsicIdx,
      this.blockNumber,
      this.callModule,
      this.callName,
      this.callArguments,
      this.blockDatetime,
      required this.complete})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetExtrinsicsData_getExtrinsics_objects', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        complete, r'GGetExtrinsicsData_getExtrinsics_objects', 'complete');
  }

  @override
  GGetExtrinsicsData_getExtrinsics_objects rebuild(
          void Function(GGetExtrinsicsData_getExtrinsics_objectsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetExtrinsicsData_getExtrinsics_objectsBuilder toBuilder() =>
      new GGetExtrinsicsData_getExtrinsics_objectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetExtrinsicsData_getExtrinsics_objects &&
        G__typename == other.G__typename &&
        multiAddressAccountId == other.multiAddressAccountId &&
        extrinsicIdx == other.extrinsicIdx &&
        blockNumber == other.blockNumber &&
        callModule == other.callModule &&
        callName == other.callName &&
        callArguments == other.callArguments &&
        blockDatetime == other.blockDatetime &&
        complete == other.complete;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, multiAddressAccountId.hashCode);
    _$hash = $jc(_$hash, extrinsicIdx.hashCode);
    _$hash = $jc(_$hash, blockNumber.hashCode);
    _$hash = $jc(_$hash, callModule.hashCode);
    _$hash = $jc(_$hash, callName.hashCode);
    _$hash = $jc(_$hash, callArguments.hashCode);
    _$hash = $jc(_$hash, blockDatetime.hashCode);
    _$hash = $jc(_$hash, complete.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetExtrinsicsData_getExtrinsics_objects')
          ..add('G__typename', G__typename)
          ..add('multiAddressAccountId', multiAddressAccountId)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('blockNumber', blockNumber)
          ..add('callModule', callModule)
          ..add('callName', callName)
          ..add('callArguments', callArguments)
          ..add('blockDatetime', blockDatetime)
          ..add('complete', complete))
        .toString();
  }
}

class GGetExtrinsicsData_getExtrinsics_objectsBuilder
    implements
        Builder<GGetExtrinsicsData_getExtrinsics_objects,
            GGetExtrinsicsData_getExtrinsics_objectsBuilder> {
  _$GGetExtrinsicsData_getExtrinsics_objects? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _multiAddressAccountId;
  String? get multiAddressAccountId => _$this._multiAddressAccountId;
  set multiAddressAccountId(String? multiAddressAccountId) =>
      _$this._multiAddressAccountId = multiAddressAccountId;

  int? _extrinsicIdx;
  int? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(int? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  int? _blockNumber;
  int? get blockNumber => _$this._blockNumber;
  set blockNumber(int? blockNumber) => _$this._blockNumber = blockNumber;

  String? _callModule;
  String? get callModule => _$this._callModule;
  set callModule(String? callModule) => _$this._callModule = callModule;

  String? _callName;
  String? get callName => _$this._callName;
  set callName(String? callName) => _$this._callName = callName;

  _i2.GJSONStringBuilder? _callArguments;
  _i2.GJSONStringBuilder get callArguments =>
      _$this._callArguments ??= new _i2.GJSONStringBuilder();
  set callArguments(_i2.GJSONStringBuilder? callArguments) =>
      _$this._callArguments = callArguments;

  _i2.GDateTimeBuilder? _blockDatetime;
  _i2.GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new _i2.GDateTimeBuilder();
  set blockDatetime(_i2.GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  int? _complete;
  int? get complete => _$this._complete;
  set complete(int? complete) => _$this._complete = complete;

  GGetExtrinsicsData_getExtrinsics_objectsBuilder() {
    GGetExtrinsicsData_getExtrinsics_objects._initializeBuilder(this);
  }

  GGetExtrinsicsData_getExtrinsics_objectsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _multiAddressAccountId = $v.multiAddressAccountId;
      _extrinsicIdx = $v.extrinsicIdx;
      _blockNumber = $v.blockNumber;
      _callModule = $v.callModule;
      _callName = $v.callName;
      _callArguments = $v.callArguments?.toBuilder();
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _complete = $v.complete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetExtrinsicsData_getExtrinsics_objects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetExtrinsicsData_getExtrinsics_objects;
  }

  @override
  void update(
      void Function(GGetExtrinsicsData_getExtrinsics_objectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetExtrinsicsData_getExtrinsics_objects build() => _build();

  _$GGetExtrinsicsData_getExtrinsics_objects _build() {
    _$GGetExtrinsicsData_getExtrinsics_objects _$result;
    try {
      _$result = _$v ??
          new _$GGetExtrinsicsData_getExtrinsics_objects._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetExtrinsicsData_getExtrinsics_objects', 'G__typename'),
              multiAddressAccountId: multiAddressAccountId,
              extrinsicIdx: extrinsicIdx,
              blockNumber: blockNumber,
              callModule: callModule,
              callName: callName,
              callArguments: _callArguments?.build(),
              blockDatetime: _blockDatetime?.build(),
              complete: BuiltValueNullFieldError.checkNotNull(complete,
                  r'GGetExtrinsicsData_getExtrinsics_objects', 'complete'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'callArguments';
        _callArguments?.build();
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetExtrinsicsData_getExtrinsics_objects',
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
