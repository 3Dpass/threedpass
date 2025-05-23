// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    show OperationSerializer;
import 'package:threedpass/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
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
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.data.gql.dart'
    show
        GGetEventsData,
        GGetEventsData_getEvents,
        GGetEventsData_getEvents_objects,
        GGetEventsData_getEvents_pageInfo;
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.req.gql.dart'
    show GGetEventsReq;
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.var.gql.dart'
    show GGetEventsVars;
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart'
    show
        GGetExtrinsicsData,
        GGetExtrinsicsData_getExtrinsics,
        GGetExtrinsicsData_getExtrinsics_objects,
        GGetExtrinsicsData_getExtrinsics_pageInfo;
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.req.gql.dart'
    show GGetExtrinsicsReq;
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.var.gql.dart'
    show GGetExtrinsicsVars;

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
  GGetEventsData,
  GGetEventsData_getEvents,
  GGetEventsData_getEvents_objects,
  GGetEventsData_getEvents_pageInfo,
  GGetEventsReq,
  GGetEventsVars,
  GGetExtrinsicsData,
  GGetExtrinsicsData_getExtrinsics,
  GGetExtrinsicsData_getExtrinsics_objects,
  GGetExtrinsicsData_getExtrinsics_pageInfo,
  GGetExtrinsicsReq,
  GGetExtrinsicsVars,
  GJSONString,
  GLogFilter,
  GTransferFilter,
])
final Serializers serializers = _serializersBuilder.build();
