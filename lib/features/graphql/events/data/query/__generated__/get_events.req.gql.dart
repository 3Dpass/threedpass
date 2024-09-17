// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:threedpass/core/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.ast.gql.dart'
    as _i5;
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.data.gql.dart'
    as _i2;
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.var.gql.dart'
    as _i3;

part 'get_events.req.gql.g.dart';

abstract class GGetEventsReq
    implements
        Built<GGetEventsReq, GGetEventsReqBuilder>,
        _i1.OperationRequest<_i2.GGetEventsData, _i3.GGetEventsVars> {
  GGetEventsReq._();

  factory GGetEventsReq([void Function(GGetEventsReqBuilder b) updates]) =
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
        context: context ?? const _i4.Context(),
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
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GGetEventsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetEventsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GGetEventsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetEventsData, _i3.GGetEventsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

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
