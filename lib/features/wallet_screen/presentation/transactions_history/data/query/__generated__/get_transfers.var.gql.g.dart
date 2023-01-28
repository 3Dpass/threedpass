// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transfers.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetTransfersVars> _$gGetTransfersVarsSerializer =
    new _$GGetTransfersVarsSerializer();

class _$GGetTransfersVarsSerializer
    implements StructuredSerializer<GGetTransfersVars> {
  @override
  final Iterable<Type> types = const [GGetTransfersVars, _$GGetTransfersVars];
  @override
  final String wireName = 'GGetTransfersVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetTransfersVars object,
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
          specifiedType: const FullType(_i1.GFilterGetTransfers)),
    ];

    return result;
  }

  @override
  GGetTransfersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetTransfersVarsBuilder();

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
                  specifiedType: const FullType(_i1.GFilterGetTransfers))!
              as _i1.GFilterGetTransfers);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetTransfersVars extends GGetTransfersVars {
  @override
  final String pageKey;
  @override
  final int pageSize;
  @override
  final _i1.GFilterGetTransfers filters;

  factory _$GGetTransfersVars(
          [void Function(GGetTransfersVarsBuilder)? updates]) =>
      (new GGetTransfersVarsBuilder()..update(updates))._build();

  _$GGetTransfersVars._(
      {required this.pageKey, required this.pageSize, required this.filters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pageKey, r'GGetTransfersVars', 'pageKey');
    BuiltValueNullFieldError.checkNotNull(
        pageSize, r'GGetTransfersVars', 'pageSize');
    BuiltValueNullFieldError.checkNotNull(
        filters, r'GGetTransfersVars', 'filters');
  }

  @override
  GGetTransfersVars rebuild(void Function(GGetTransfersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetTransfersVarsBuilder toBuilder() =>
      new GGetTransfersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetTransfersVars &&
        pageKey == other.pageKey &&
        pageSize == other.pageSize &&
        filters == other.filters;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, pageKey.hashCode), pageSize.hashCode), filters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetTransfersVars')
          ..add('pageKey', pageKey)
          ..add('pageSize', pageSize)
          ..add('filters', filters))
        .toString();
  }
}

class GGetTransfersVarsBuilder
    implements Builder<GGetTransfersVars, GGetTransfersVarsBuilder> {
  _$GGetTransfersVars? _$v;

  String? _pageKey;
  String? get pageKey => _$this._pageKey;
  set pageKey(String? pageKey) => _$this._pageKey = pageKey;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  _i1.GFilterGetTransfersBuilder? _filters;
  _i1.GFilterGetTransfersBuilder get filters =>
      _$this._filters ??= new _i1.GFilterGetTransfersBuilder();
  set filters(_i1.GFilterGetTransfersBuilder? filters) =>
      _$this._filters = filters;

  GGetTransfersVarsBuilder();

  GGetTransfersVarsBuilder get _$this {
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
  void replace(GGetTransfersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetTransfersVars;
  }

  @override
  void update(void Function(GGetTransfersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetTransfersVars build() => _build();

  _$GGetTransfersVars _build() {
    _$GGetTransfersVars _$result;
    try {
      _$result = _$v ??
          new _$GGetTransfersVars._(
              pageKey: BuiltValueNullFieldError.checkNotNull(
                  pageKey, r'GGetTransfersVars', 'pageKey'),
              pageSize: BuiltValueNullFieldError.checkNotNull(
                  pageSize, r'GGetTransfersVars', 'pageSize'),
              filters: filters.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        filters.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetTransfersVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
