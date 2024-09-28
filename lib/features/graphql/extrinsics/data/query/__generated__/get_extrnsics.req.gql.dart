// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:threedpass/core/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.ast.gql.dart'
    as _i5;
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart'
    as _i2;
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.var.gql.dart'
    as _i3;

part 'get_extrnsics.req.gql.g.dart';

abstract class GGetExtrinsicsReq
    implements
        Built<GGetExtrinsicsReq, GGetExtrinsicsReqBuilder>,
        _i1.OperationRequest<_i2.GGetExtrinsicsData, _i3.GGetExtrinsicsVars> {
  GGetExtrinsicsReq._();

  factory GGetExtrinsicsReq(
          [void Function(GGetExtrinsicsReqBuilder b) updates]) =
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
        context: context ?? const _i4.Context(),
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
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GGetExtrinsicsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetExtrinsicsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GGetExtrinsicsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetExtrinsicsData, _i3.GGetExtrinsicsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

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
