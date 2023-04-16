// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_events.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetEventsData> _$gGetEventsDataSerializer =
    new _$GGetEventsDataSerializer();
Serializer<GGetEventsData_getEvents> _$gGetEventsDataGetEventsSerializer =
    new _$GGetEventsData_getEventsSerializer();
Serializer<GGetEventsData_getEvents_pageInfo>
    _$gGetEventsDataGetEventsPageInfoSerializer =
    new _$GGetEventsData_getEvents_pageInfoSerializer();
Serializer<GGetEventsData_getEvents_objects>
    _$gGetEventsDataGetEventsObjectsSerializer =
    new _$GGetEventsData_getEvents_objectsSerializer();

class _$GGetEventsDataSerializer
    implements StructuredSerializer<GGetEventsData> {
  @override
  final Iterable<Type> types = const [GGetEventsData, _$GGetEventsData];
  @override
  final String wireName = 'GGetEventsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetEventsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.getEvents;
    if (value != null) {
      result
        ..add('getEvents')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetEventsData_getEvents)));
    }
    return result;
  }

  @override
  GGetEventsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEventsDataBuilder();

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
        case 'getEvents':
          result.getEvents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetEventsData_getEvents))!
              as GGetEventsData_getEvents);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEventsData_getEventsSerializer
    implements StructuredSerializer<GGetEventsData_getEvents> {
  @override
  final Iterable<Type> types = const [
    GGetEventsData_getEvents,
    _$GGetEventsData_getEvents
  ];
  @override
  final String wireName = 'GGetEventsData_getEvents';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetEventsData_getEvents object,
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
            specifiedType: const FullType(GGetEventsData_getEvents_pageInfo)));
    }
    value = object.objects;
    if (value != null) {
      result
        ..add('objects')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GGetEventsData_getEvents_objects)])));
    }
    return result;
  }

  @override
  GGetEventsData_getEvents deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEventsData_getEventsBuilder();

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
                      const FullType(GGetEventsData_getEvents_pageInfo))!
              as GGetEventsData_getEvents_pageInfo);
          break;
        case 'objects':
          result.objects.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetEventsData_getEvents_objects)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEventsData_getEvents_pageInfoSerializer
    implements StructuredSerializer<GGetEventsData_getEvents_pageInfo> {
  @override
  final Iterable<Type> types = const [
    GGetEventsData_getEvents_pageInfo,
    _$GGetEventsData_getEvents_pageInfo
  ];
  @override
  final String wireName = 'GGetEventsData_getEvents_pageInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetEventsData_getEvents_pageInfo object,
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
  GGetEventsData_getEvents_pageInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEventsData_getEvents_pageInfoBuilder();

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

class _$GGetEventsData_getEvents_objectsSerializer
    implements StructuredSerializer<GGetEventsData_getEvents_objects> {
  @override
  final Iterable<Type> types = const [
    GGetEventsData_getEvents_objects,
    _$GGetEventsData_getEvents_objects
  ];
  @override
  final String wireName = 'GGetEventsData_getEvents_objects';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetEventsData_getEvents_objects object,
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
    value = object.eventIdx;
    if (value != null) {
      result
        ..add('eventIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.event;
    if (value != null) {
      result
        ..add('event')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventModule;
    if (value != null) {
      result
        ..add('eventModule')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventName;
    if (value != null) {
      result
        ..add('eventName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phaseIdx;
    if (value != null) {
      result
        ..add('phaseIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.phaseName;
    if (value != null) {
      result
        ..add('phaseName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attributes;
    if (value != null) {
      result
        ..add('attributes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GJSONString)));
    }
    value = object.topics;
    if (value != null) {
      result
        ..add('topics')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GJSONString)));
    }
    return result;
  }

  @override
  GGetEventsData_getEvents_objects deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEventsData_getEvents_objectsBuilder();

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
        case 'eventIdx':
          result.eventIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'event':
          result.event = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventModule':
          result.eventModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventName':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phaseIdx':
          result.phaseIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'phaseName':
          result.phaseName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'attributes':
          result.attributes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GJSONString))!
              as _i2.GJSONString);
          break;
        case 'topics':
          result.topics.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GJSONString))!
              as _i2.GJSONString);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEventsData extends GGetEventsData {
  @override
  final String G__typename;
  @override
  final GGetEventsData_getEvents? getEvents;

  factory _$GGetEventsData([void Function(GGetEventsDataBuilder)? updates]) =>
      (new GGetEventsDataBuilder()..update(updates))._build();

  _$GGetEventsData._({required this.G__typename, this.getEvents}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetEventsData', 'G__typename');
  }

  @override
  GGetEventsData rebuild(void Function(GGetEventsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEventsDataBuilder toBuilder() =>
      new GGetEventsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEventsData &&
        G__typename == other.G__typename &&
        getEvents == other.getEvents;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, getEvents.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetEventsData')
          ..add('G__typename', G__typename)
          ..add('getEvents', getEvents))
        .toString();
  }
}

class GGetEventsDataBuilder
    implements Builder<GGetEventsData, GGetEventsDataBuilder> {
  _$GGetEventsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetEventsData_getEventsBuilder? _getEvents;
  GGetEventsData_getEventsBuilder get getEvents =>
      _$this._getEvents ??= new GGetEventsData_getEventsBuilder();
  set getEvents(GGetEventsData_getEventsBuilder? getEvents) =>
      _$this._getEvents = getEvents;

  GGetEventsDataBuilder() {
    GGetEventsData._initializeBuilder(this);
  }

  GGetEventsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getEvents = $v.getEvents?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEventsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetEventsData;
  }

  @override
  void update(void Function(GGetEventsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetEventsData build() => _build();

  _$GGetEventsData _build() {
    _$GGetEventsData _$result;
    try {
      _$result = _$v ??
          new _$GGetEventsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetEventsData', 'G__typename'),
              getEvents: _getEvents?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'getEvents';
        _getEvents?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetEventsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetEventsData_getEvents extends GGetEventsData_getEvents {
  @override
  final String G__typename;
  @override
  final GGetEventsData_getEvents_pageInfo? pageInfo;
  @override
  final BuiltList<GGetEventsData_getEvents_objects>? objects;

  factory _$GGetEventsData_getEvents(
          [void Function(GGetEventsData_getEventsBuilder)? updates]) =>
      (new GGetEventsData_getEventsBuilder()..update(updates))._build();

  _$GGetEventsData_getEvents._(
      {required this.G__typename, this.pageInfo, this.objects})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetEventsData_getEvents', 'G__typename');
  }

  @override
  GGetEventsData_getEvents rebuild(
          void Function(GGetEventsData_getEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEventsData_getEventsBuilder toBuilder() =>
      new GGetEventsData_getEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEventsData_getEvents &&
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
    return (newBuiltValueToStringHelper(r'GGetEventsData_getEvents')
          ..add('G__typename', G__typename)
          ..add('pageInfo', pageInfo)
          ..add('objects', objects))
        .toString();
  }
}

class GGetEventsData_getEventsBuilder
    implements
        Builder<GGetEventsData_getEvents, GGetEventsData_getEventsBuilder> {
  _$GGetEventsData_getEvents? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetEventsData_getEvents_pageInfoBuilder? _pageInfo;
  GGetEventsData_getEvents_pageInfoBuilder get pageInfo =>
      _$this._pageInfo ??= new GGetEventsData_getEvents_pageInfoBuilder();
  set pageInfo(GGetEventsData_getEvents_pageInfoBuilder? pageInfo) =>
      _$this._pageInfo = pageInfo;

  ListBuilder<GGetEventsData_getEvents_objects>? _objects;
  ListBuilder<GGetEventsData_getEvents_objects> get objects =>
      _$this._objects ??= new ListBuilder<GGetEventsData_getEvents_objects>();
  set objects(ListBuilder<GGetEventsData_getEvents_objects>? objects) =>
      _$this._objects = objects;

  GGetEventsData_getEventsBuilder() {
    GGetEventsData_getEvents._initializeBuilder(this);
  }

  GGetEventsData_getEventsBuilder get _$this {
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
  void replace(GGetEventsData_getEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetEventsData_getEvents;
  }

  @override
  void update(void Function(GGetEventsData_getEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetEventsData_getEvents build() => _build();

  _$GGetEventsData_getEvents _build() {
    _$GGetEventsData_getEvents _$result;
    try {
      _$result = _$v ??
          new _$GGetEventsData_getEvents._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetEventsData_getEvents', 'G__typename'),
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
            r'GGetEventsData_getEvents', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetEventsData_getEvents_pageInfo
    extends GGetEventsData_getEvents_pageInfo {
  @override
  final String G__typename;
  @override
  final int? pageSize;
  @override
  final String? pageNext;
  @override
  final String? pagePrev;

  factory _$GGetEventsData_getEvents_pageInfo(
          [void Function(GGetEventsData_getEvents_pageInfoBuilder)? updates]) =>
      (new GGetEventsData_getEvents_pageInfoBuilder()..update(updates))
          ._build();

  _$GGetEventsData_getEvents_pageInfo._(
      {required this.G__typename, this.pageSize, this.pageNext, this.pagePrev})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetEventsData_getEvents_pageInfo', 'G__typename');
  }

  @override
  GGetEventsData_getEvents_pageInfo rebuild(
          void Function(GGetEventsData_getEvents_pageInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEventsData_getEvents_pageInfoBuilder toBuilder() =>
      new GGetEventsData_getEvents_pageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEventsData_getEvents_pageInfo &&
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
    return (newBuiltValueToStringHelper(r'GGetEventsData_getEvents_pageInfo')
          ..add('G__typename', G__typename)
          ..add('pageSize', pageSize)
          ..add('pageNext', pageNext)
          ..add('pagePrev', pagePrev))
        .toString();
  }
}

class GGetEventsData_getEvents_pageInfoBuilder
    implements
        Builder<GGetEventsData_getEvents_pageInfo,
            GGetEventsData_getEvents_pageInfoBuilder> {
  _$GGetEventsData_getEvents_pageInfo? _$v;

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

  GGetEventsData_getEvents_pageInfoBuilder() {
    GGetEventsData_getEvents_pageInfo._initializeBuilder(this);
  }

  GGetEventsData_getEvents_pageInfoBuilder get _$this {
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
  void replace(GGetEventsData_getEvents_pageInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetEventsData_getEvents_pageInfo;
  }

  @override
  void update(
      void Function(GGetEventsData_getEvents_pageInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetEventsData_getEvents_pageInfo build() => _build();

  _$GGetEventsData_getEvents_pageInfo _build() {
    final _$result = _$v ??
        new _$GGetEventsData_getEvents_pageInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetEventsData_getEvents_pageInfo', 'G__typename'),
            pageSize: pageSize,
            pageNext: pageNext,
            pagePrev: pagePrev);
    replace(_$result);
    return _$result;
  }
}

class _$GGetEventsData_getEvents_objects
    extends GGetEventsData_getEvents_objects {
  @override
  final String G__typename;
  @override
  final int? blockNumber;
  @override
  final int? eventIdx;
  @override
  final int? extrinsicIdx;
  @override
  final String? event;
  @override
  final String? eventModule;
  @override
  final String? eventName;
  @override
  final int? phaseIdx;
  @override
  final String? phaseName;
  @override
  final _i2.GJSONString? attributes;
  @override
  final _i2.GJSONString? topics;

  factory _$GGetEventsData_getEvents_objects(
          [void Function(GGetEventsData_getEvents_objectsBuilder)? updates]) =>
      (new GGetEventsData_getEvents_objectsBuilder()..update(updates))._build();

  _$GGetEventsData_getEvents_objects._(
      {required this.G__typename,
      this.blockNumber,
      this.eventIdx,
      this.extrinsicIdx,
      this.event,
      this.eventModule,
      this.eventName,
      this.phaseIdx,
      this.phaseName,
      this.attributes,
      this.topics})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetEventsData_getEvents_objects', 'G__typename');
  }

  @override
  GGetEventsData_getEvents_objects rebuild(
          void Function(GGetEventsData_getEvents_objectsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEventsData_getEvents_objectsBuilder toBuilder() =>
      new GGetEventsData_getEvents_objectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEventsData_getEvents_objects &&
        G__typename == other.G__typename &&
        blockNumber == other.blockNumber &&
        eventIdx == other.eventIdx &&
        extrinsicIdx == other.extrinsicIdx &&
        event == other.event &&
        eventModule == other.eventModule &&
        eventName == other.eventName &&
        phaseIdx == other.phaseIdx &&
        phaseName == other.phaseName &&
        attributes == other.attributes &&
        topics == other.topics;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, blockNumber.hashCode);
    _$hash = $jc(_$hash, eventIdx.hashCode);
    _$hash = $jc(_$hash, extrinsicIdx.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, eventModule.hashCode);
    _$hash = $jc(_$hash, eventName.hashCode);
    _$hash = $jc(_$hash, phaseIdx.hashCode);
    _$hash = $jc(_$hash, phaseName.hashCode);
    _$hash = $jc(_$hash, attributes.hashCode);
    _$hash = $jc(_$hash, topics.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetEventsData_getEvents_objects')
          ..add('G__typename', G__typename)
          ..add('blockNumber', blockNumber)
          ..add('eventIdx', eventIdx)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('event', event)
          ..add('eventModule', eventModule)
          ..add('eventName', eventName)
          ..add('phaseIdx', phaseIdx)
          ..add('phaseName', phaseName)
          ..add('attributes', attributes)
          ..add('topics', topics))
        .toString();
  }
}

class GGetEventsData_getEvents_objectsBuilder
    implements
        Builder<GGetEventsData_getEvents_objects,
            GGetEventsData_getEvents_objectsBuilder> {
  _$GGetEventsData_getEvents_objects? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _blockNumber;
  int? get blockNumber => _$this._blockNumber;
  set blockNumber(int? blockNumber) => _$this._blockNumber = blockNumber;

  int? _eventIdx;
  int? get eventIdx => _$this._eventIdx;
  set eventIdx(int? eventIdx) => _$this._eventIdx = eventIdx;

  int? _extrinsicIdx;
  int? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(int? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  String? _event;
  String? get event => _$this._event;
  set event(String? event) => _$this._event = event;

  String? _eventModule;
  String? get eventModule => _$this._eventModule;
  set eventModule(String? eventModule) => _$this._eventModule = eventModule;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  int? _phaseIdx;
  int? get phaseIdx => _$this._phaseIdx;
  set phaseIdx(int? phaseIdx) => _$this._phaseIdx = phaseIdx;

  String? _phaseName;
  String? get phaseName => _$this._phaseName;
  set phaseName(String? phaseName) => _$this._phaseName = phaseName;

  _i2.GJSONStringBuilder? _attributes;
  _i2.GJSONStringBuilder get attributes =>
      _$this._attributes ??= new _i2.GJSONStringBuilder();
  set attributes(_i2.GJSONStringBuilder? attributes) =>
      _$this._attributes = attributes;

  _i2.GJSONStringBuilder? _topics;
  _i2.GJSONStringBuilder get topics =>
      _$this._topics ??= new _i2.GJSONStringBuilder();
  set topics(_i2.GJSONStringBuilder? topics) => _$this._topics = topics;

  GGetEventsData_getEvents_objectsBuilder() {
    GGetEventsData_getEvents_objects._initializeBuilder(this);
  }

  GGetEventsData_getEvents_objectsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _blockNumber = $v.blockNumber;
      _eventIdx = $v.eventIdx;
      _extrinsicIdx = $v.extrinsicIdx;
      _event = $v.event;
      _eventModule = $v.eventModule;
      _eventName = $v.eventName;
      _phaseIdx = $v.phaseIdx;
      _phaseName = $v.phaseName;
      _attributes = $v.attributes?.toBuilder();
      _topics = $v.topics?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEventsData_getEvents_objects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetEventsData_getEvents_objects;
  }

  @override
  void update(void Function(GGetEventsData_getEvents_objectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetEventsData_getEvents_objects build() => _build();

  _$GGetEventsData_getEvents_objects _build() {
    _$GGetEventsData_getEvents_objects _$result;
    try {
      _$result = _$v ??
          new _$GGetEventsData_getEvents_objects._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetEventsData_getEvents_objects', 'G__typename'),
              blockNumber: blockNumber,
              eventIdx: eventIdx,
              extrinsicIdx: extrinsicIdx,
              event: event,
              eventModule: eventModule,
              eventName: eventName,
              phaseIdx: phaseIdx,
              phaseName: phaseName,
              attributes: _attributes?.build(),
              topics: _topics?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attributes';
        _attributes?.build();
        _$failedField = 'topics';
        _topics?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetEventsData_getEvents_objects', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
