// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:threedpass/core/graphql/__generated__/serializers.gql.dart'
    as _i6;
import 'package:threedpass/features/graphql/transfers_history/data/query/__generated__/get_transfers.ast.gql.dart'
    as _i5;
import 'package:threedpass/features/graphql/transfers_history/data/query/__generated__/get_transfers.data.gql.dart'
    as _i2;
import 'package:threedpass/features/graphql/transfers_history/data/query/__generated__/get_transfers.var.gql.dart'
    as _i3;

part 'get_transfers.req.gql.g.dart';

abstract class GGetTransfersReq
    implements
        Built<GGetTransfersReq, GGetTransfersReqBuilder>,
        _i1.OperationRequest<_i2.GGetTransfersData, _i3.GGetTransfersVars> {
  GGetTransfersReq._();

  factory GGetTransfersReq([void Function(GGetTransfersReqBuilder b) updates]) =
      _$GGetTransfersReq;

  static void _initializeBuilder(GGetTransfersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetTransfers',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetTransfersVars get vars;
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
  _i2.GGetTransfersData? Function(
    _i2.GGetTransfersData?,
    _i2.GGetTransfersData?,
  )? get updateResult;
  @override
  _i2.GGetTransfersData? get optimisticResponse;
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
  _i2.GGetTransfersData? parseData(Map<String, dynamic> json) =>
      _i2.GGetTransfersData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GGetTransfersData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetTransfersData, _i3.GGetTransfersVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GGetTransfersReq> get serializer =>
      _$gGetTransfersReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetTransfersReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetTransfersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetTransfersReq.serializer,
        json,
      );
}
