// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:threedp_graphql/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
    show
        GBlocksFilter,
        GDateTime,
        GEventsFilter,
        GExtrinsicFilter,
        GFilterGetBlock,
        GFilterGetEvent,
        GFilterGetEvents,
        GFilterGetLog,
        GFilterGetLogs,
        GFilterGetRuntime,
        GFilterGetRuntimeCall,
        GFilterGetRuntimeCallArguments,
        GFilterGetRuntimeCalls,
        GFilterGetRuntimeConstant,
        GFilterGetRuntimeConstants,
        GFilterGetRuntimeErrorMessage,
        GFilterGetRuntimeErrorMessages,
        GFilterGetRuntimeEvent,
        GFilterGetRuntimeEventAttributes,
        GFilterGetRuntimeEvents,
        GFilterGetRuntimePallet,
        GFilterGetRuntimePallets,
        GFilterGetRuntimeStorage,
        GFilterGetRuntimeStorages,
        GFilterGetRuntimeType,
        GFilterGetRuntimeTypes,
        GFilterGetRuntimes,
        GFilterGetTaggedAccount,
        GFilterGetTransfer,
        GFilterGetTransfers,
        GJSONString,
        GLogFilter,
        GTransferFilter;
import 'package:threedp_graphql/features/transfers_history/data/query/__generated__/get_transfers.data.gql.dart'
    show
        GGetTransfersData,
        GGetTransfersData_getTransfers,
        GGetTransfersData_getTransfers_objects,
        GGetTransfersData_getTransfers_pageInfo;
import 'package:threedp_graphql/features/transfers_history/data/query/__generated__/get_transfers.req.gql.dart'
    show GGetTransfersReq;
import 'package:threedp_graphql/features/transfers_history/data/query/__generated__/get_transfers.var.gql.dart'
    show GGetTransfersVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GBlocksFilter,
  GDateTime,
  GEventsFilter,
  GExtrinsicFilter,
  GFilterGetBlock,
  GFilterGetEvent,
  GFilterGetEvents,
  GFilterGetLog,
  GFilterGetLogs,
  GFilterGetRuntime,
  GFilterGetRuntimeCall,
  GFilterGetRuntimeCallArguments,
  GFilterGetRuntimeCalls,
  GFilterGetRuntimeConstant,
  GFilterGetRuntimeConstants,
  GFilterGetRuntimeErrorMessage,
  GFilterGetRuntimeErrorMessages,
  GFilterGetRuntimeEvent,
  GFilterGetRuntimeEventAttributes,
  GFilterGetRuntimeEvents,
  GFilterGetRuntimePallet,
  GFilterGetRuntimePallets,
  GFilterGetRuntimeStorage,
  GFilterGetRuntimeStorages,
  GFilterGetRuntimeType,
  GFilterGetRuntimeTypes,
  GFilterGetRuntimes,
  GFilterGetTaggedAccount,
  GFilterGetTransfer,
  GFilterGetTransfers,
  GGetTransfersData,
  GGetTransfersData_getTransfers,
  GGetTransfersData_getTransfers_objects,
  GGetTransfersData_getTransfers_pageInfo,
  GGetTransfersReq,
  GGetTransfersVars,
  GJSONString,
  GLogFilter,
  GTransferFilter,
])
final Serializers serializers = _serializersBuilder.build();
