// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_extrnsics.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetExtrinsicsVars> _$gGetExtrinsicsVarsSerializer =
    new _$GGetExtrinsicsVarsSerializer();

class _$GGetExtrinsicsVarsSerializer
    implements StructuredSerializer<GGetExtrinsicsVars> {
  @override
  final Iterable<Type> types = const [GGetExtrinsicsVars, _$GGetExtrinsicsVars];
  @override
  final String wireName = 'GGetExtrinsicsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetExtrinsicsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pageKey',
      serializers.serialize(object.pageKey,
          specifiedType: const FullType(String)),
      'pageSize',
      serializers.serialize(object.pageSize,
          specifiedType: const FullType(int)),
      'filters',
      serializers.serialize(object.filters,
          specifiedType: const FullType(_i1.GExtrinsicFilter)),
    ];

    return result;
  }

  @override
  GGetExtrinsicsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetExtrinsicsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pageKey':
          result.pageKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pageSize':
          result.pageSize = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'filters':
          result.filters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GExtrinsicFilter))!
              as _i1.GExtrinsicFilter);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetExtrinsicsVars extends GGetExtrinsicsVars {
  @override
  final String pageKey;
  @override
  final int pageSize;
  @override
  final _i1.GExtrinsicFilter filters;

  factory _$GGetExtrinsicsVars(
          [void Function(GGetExtrinsicsVarsBuilder)? updates]) =>
      (new GGetExtrinsicsVarsBuilder()..update(updates))._build();

  _$GGetExtrinsicsVars._(
      {required this.pageKey, required this.pageSize, required this.filters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pageKey, r'GGetExtrinsicsVars', 'pageKey');
    BuiltValueNullFieldError.checkNotNull(
        pageSize, r'GGetExtrinsicsVars', 'pageSize');
    BuiltValueNullFieldError.checkNotNull(
        filters, r'GGetExtrinsicsVars', 'filters');
  }

  @override
  GGetExtrinsicsVars rebuild(
          void Function(GGetExtrinsicsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetExtrinsicsVarsBuilder toBuilder() =>
      new GGetExtrinsicsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetExtrinsicsVars &&
        pageKey == other.pageKey &&
        pageSize == other.pageSize &&
        filters == other.filters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pageKey.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, filters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetExtrinsicsVars')
          ..add('pageKey', pageKey)
          ..add('pageSize', pageSize)
          ..add('filters', filters))
        .toString();
  }
}

class GGetExtrinsicsVarsBuilder
    implements Builder<GGetExtrinsicsVars, GGetExtrinsicsVarsBuilder> {
  _$GGetExtrinsicsVars? _$v;

  String? _pageKey;
  String? get pageKey => _$this._pageKey;
  set pageKey(String? pageKey) => _$this._pageKey = pageKey;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  _i1.GExtrinsicFilterBuilder? _filters;
  _i1.GExtrinsicFilterBuilder get filters =>
      _$this._filters ??= new _i1.GExtrinsicFilterBuilder();
  set filters(_i1.GExtrinsicFilterBuilder? filters) =>
      _$this._filters = filters;

  GGetExtrinsicsVarsBuilder();

  GGetExtrinsicsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pageKey = $v.pageKey;
      _pageSize = $v.pageSize;
      _filters = $v.filters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetExtrinsicsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetExtrinsicsVars;
  }

  @override
  void update(void Function(GGetExtrinsicsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetExtrinsicsVars build() => _build();

  _$GGetExtrinsicsVars _build() {
    _$GGetExtrinsicsVars _$result;
    try {
      _$result = _$v ??
          new _$GGetExtrinsicsVars._(
              pageKey: BuiltValueNullFieldError.checkNotNull(
                  pageKey, r'GGetExtrinsicsVars', 'pageKey'),
              pageSize: BuiltValueNullFieldError.checkNotNull(
                  pageSize, r'GGetExtrinsicsVars', 'pageSize'),
              filters: filters.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        filters.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetExtrinsicsVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
