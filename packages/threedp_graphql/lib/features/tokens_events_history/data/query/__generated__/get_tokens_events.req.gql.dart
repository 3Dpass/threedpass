// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:threedp_graphql/core/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:threedp_graphql/features/tokens_events_history/data/query/__generated__/get_tokens_events.ast.gql.dart'
    as _i5;
import 'package:threedp_graphql/features/tokens_events_history/data/query/__generated__/get_tokens_events.data.gql.dart'
    as _i2;
import 'package:threedp_graphql/features/tokens_events_history/data/query/__generated__/get_tokens_events.var.gql.dart'
    as _i3;

part 'get_tokens_events.req.gql.g.dart';

abstract class GGetEventsReq
    implements
        Built<GGetEventsReq, GGetEventsReqBuilder>,
        _i1.OperationRequest<_i2.GGetEventsData, _i3.GGetEventsVars> {
  GGetEventsReq._();

  factory GGetEventsReq([Function(GGetEventsReqBuilder b) updates]) =
      _$GGetEventsReq;

  static void _initializeBuilder(GGetEventsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetEvents',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetEventsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetEventsData? Function(
    _i2.GGetEventsData?,
    _i2.GGetEventsData?,
  )? get updateResult;
  @override
  _i2.GGetEventsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetEventsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetEventsData.fromJson(json);
  static Serializer<GGetEventsReq> get serializer => _$gGetEventsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetEventsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetEventsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetEventsReq.serializer,
        json,
      );
}

abstract class GGetExtrinsicsReq
    implements
        Built<GGetExtrinsicsReq, GGetExtrinsicsReqBuilder>,
        _i1.OperationRequest<_i2.GGetExtrinsicsData, _i3.GGetExtrinsicsVars> {
  GGetExtrinsicsReq._();

  factory GGetExtrinsicsReq([Function(GGetExtrinsicsReqBuilder b) updates]) =
      _$GGetExtrinsicsReq;

  static void _initializeBuilder(GGetExtrinsicsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetExtrinsics',
    )
    ..executeOnListen = true;
  @override
  _i3.GGetExtrinsicsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetExtrinsicsData? Function(
    _i2.GGetExtrinsicsData?,
    _i2.GGetExtrinsicsData?,
  )? get updateResult;
  @override
  _i2.GGetExtrinsicsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetExtrinsicsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetExtrinsicsData.fromJson(json);
  static Serializer<GGetExtrinsicsReq> get serializer =>
      _$gGetExtrinsicsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetExtrinsicsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetExtrinsicsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetExtrinsicsReq.serializer,
        json,
      );
}
