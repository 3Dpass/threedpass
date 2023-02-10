// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;
import 'package:threedp_graphql/core/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'threedpass.schema.schema.gql.g.dart';

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i1.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

abstract class GFilterGetBlock
    implements Built<GFilterGetBlock, GFilterGetBlockBuilder> {
  GFilterGetBlock._();

  factory GFilterGetBlock([Function(GFilterGetBlockBuilder b) updates]) =
      _$GFilterGetBlock;

  String? get number;
  String? get hash;
  GDateTime? get datetime;
  GDateTime? get datetimeGt;
  GDateTime? get datetimeLt;
  GDateTime? get datetimeGte;
  GDateTime? get datetimeLte;
  BuiltList<GFilterGetBlock>? get and;
  BuiltList<GFilterGetBlock>? get or;
  GFilterGetBlock? get not;
  static Serializer<GFilterGetBlock> get serializer =>
      _$gFilterGetBlockSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetBlock.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetBlock? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetBlock.serializer,
        json,
      );
}

abstract class GBlocksFilter
    implements Built<GBlocksFilter, GBlocksFilterBuilder> {
  GBlocksFilter._();

  factory GBlocksFilter([Function(GBlocksFilterBuilder b) updates]) =
      _$GBlocksFilter;

  String? get number;
  String? get numberGt;
  String? get numberLt;
  String? get numberGte;
  String? get numberLte;
  String? get hash;
  GDateTime? get datetime;
  GDateTime? get datetimeGt;
  GDateTime? get datetimeLt;
  GDateTime? get datetimeGte;
  GDateTime? get datetimeLte;
  BuiltList<GBlocksFilter>? get and;
  BuiltList<GBlocksFilter>? get or;
  GBlocksFilter? get not;
  static Serializer<GBlocksFilter> get serializer => _$gBlocksFilterSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GBlocksFilter.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBlocksFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GBlocksFilter.serializer,
        json,
      );
}

abstract class GJSONString implements Built<GJSONString, GJSONStringBuilder> {
  GJSONString._();

  factory GJSONString([String? value]) =>
      _$GJSONString((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GJSONString> get serializer =>
      _i1.DefaultScalarSerializer<GJSONString>(
          (Object serialized) => GJSONString((serialized as String?)));
}

abstract class GExtrinsicFilter
    implements Built<GExtrinsicFilter, GExtrinsicFilterBuilder> {
  GExtrinsicFilter._();

  factory GExtrinsicFilter([Function(GExtrinsicFilterBuilder b) updates]) =
      _$GExtrinsicFilter;

  String? get blockNumber;
  String? get extrinsicIdx;
  String? get callModule;
  String? get callName;
  int? get signed;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeGte;
  GDateTime? get blockDatetimeLte;
  BuiltList<GExtrinsicFilter>? get and;
  BuiltList<GExtrinsicFilter>? get or;
  GExtrinsicFilter? get not;
  String? get multiAddressAccountId;
  static Serializer<GExtrinsicFilter> get serializer =>
      _$gExtrinsicFilterSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GExtrinsicFilter.serializer,
        this,
      ) as Map<String, dynamic>);
  static GExtrinsicFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GExtrinsicFilter.serializer,
        json,
      );
}

abstract class GFilterGetEvent
    implements Built<GFilterGetEvent, GFilterGetEventBuilder> {
  GFilterGetEvent._();

  factory GFilterGetEvent([Function(GFilterGetEventBuilder b) updates]) =
      _$GFilterGetEvent;

  String? get blockNumber;
  String? get eventIdx;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeGte;
  GDateTime? get blockDatetimeLte;
  BuiltList<GFilterGetEvent>? get and;
  BuiltList<GFilterGetEvent>? get or;
  GFilterGetEvent? get not;
  static Serializer<GFilterGetEvent> get serializer =>
      _$gFilterGetEventSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetEvent.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetEvent? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetEvent.serializer,
        json,
      );
}

abstract class GFilterGetEvents
    implements Built<GFilterGetEvents, GFilterGetEventsBuilder> {
  GFilterGetEvents._();

  factory GFilterGetEvents([Function(GFilterGetEventsBuilder b) updates]) =
      _$GFilterGetEvents;

  String? get blockNumber;
  int? get extrinsicIdx;
  String? get eventModule;
  String? get eventName;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeGte;
  GDateTime? get blockDatetimeLte;
  BuiltList<GFilterGetEvents>? get and;
  BuiltList<GFilterGetEvents>? get or;
  GFilterGetEvents? get not;
  static Serializer<GFilterGetEvents> get serializer =>
      _$gFilterGetEventsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetEvents.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetEvents? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetEvents.serializer,
        json,
      );
}

abstract class GFilterGetRuntime
    implements Built<GFilterGetRuntime, GFilterGetRuntimeBuilder> {
  GFilterGetRuntime._();

  factory GFilterGetRuntime([Function(GFilterGetRuntimeBuilder b) updates]) =
      _$GFilterGetRuntime;

  String? get specName;
  String? get specVersion;
  BuiltList<GFilterGetRuntime>? get and;
  BuiltList<GFilterGetRuntime>? get or;
  GFilterGetRuntime? get not;
  static Serializer<GFilterGetRuntime> get serializer =>
      _$gFilterGetRuntimeSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntime.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntime? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntime.serializer,
        json,
      );
}

abstract class GFilterGetRuntimes
    implements Built<GFilterGetRuntimes, GFilterGetRuntimesBuilder> {
  GFilterGetRuntimes._();

  factory GFilterGetRuntimes([Function(GFilterGetRuntimesBuilder b) updates]) =
      _$GFilterGetRuntimes;

  String? get specName;
  String? get specVersion;
  BuiltList<GFilterGetRuntimes>? get and;
  BuiltList<GFilterGetRuntimes>? get or;
  GFilterGetRuntimes? get not;
  static Serializer<GFilterGetRuntimes> get serializer =>
      _$gFilterGetRuntimesSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimes.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimes? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimes.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeCall
    implements Built<GFilterGetRuntimeCall, GFilterGetRuntimeCallBuilder> {
  GFilterGetRuntimeCall._();

  factory GFilterGetRuntimeCall(
          [Function(GFilterGetRuntimeCallBuilder b) updates]) =
      _$GFilterGetRuntimeCall;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  BuiltList<GFilterGetRuntimeCall>? get and;
  BuiltList<GFilterGetRuntimeCall>? get or;
  GFilterGetRuntimeCall? get not;
  static Serializer<GFilterGetRuntimeCall> get serializer =>
      _$gFilterGetRuntimeCallSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeCall.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeCall? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeCall.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeCalls
    implements Built<GFilterGetRuntimeCalls, GFilterGetRuntimeCallsBuilder> {
  GFilterGetRuntimeCalls._();

  factory GFilterGetRuntimeCalls(
          [Function(GFilterGetRuntimeCallsBuilder b) updates]) =
      _$GFilterGetRuntimeCalls;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  BuiltList<GFilterGetRuntimeCalls>? get and;
  BuiltList<GFilterGetRuntimeCalls>? get or;
  GFilterGetRuntimeCalls? get not;
  static Serializer<GFilterGetRuntimeCalls> get serializer =>
      _$gFilterGetRuntimeCallsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeCalls.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeCalls? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeCalls.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeCallArguments
    implements
        Built<GFilterGetRuntimeCallArguments,
            GFilterGetRuntimeCallArgumentsBuilder> {
  GFilterGetRuntimeCallArguments._();

  factory GFilterGetRuntimeCallArguments(
          [Function(GFilterGetRuntimeCallArgumentsBuilder b) updates]) =
      _$GFilterGetRuntimeCallArguments;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get callName;
  BuiltList<GFilterGetRuntimeCallArguments>? get and;
  BuiltList<GFilterGetRuntimeCallArguments>? get or;
  GFilterGetRuntimeCallArguments? get not;
  static Serializer<GFilterGetRuntimeCallArguments> get serializer =>
      _$gFilterGetRuntimeCallArgumentsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeCallArguments.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeCallArguments? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeCallArguments.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeConstant
    implements
        Built<GFilterGetRuntimeConstant, GFilterGetRuntimeConstantBuilder> {
  GFilterGetRuntimeConstant._();

  factory GFilterGetRuntimeConstant(
          [Function(GFilterGetRuntimeConstantBuilder b) updates]) =
      _$GFilterGetRuntimeConstant;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get constantName;
  BuiltList<GFilterGetRuntimeConstant>? get and;
  BuiltList<GFilterGetRuntimeConstant>? get or;
  GFilterGetRuntimeConstant? get not;
  static Serializer<GFilterGetRuntimeConstant> get serializer =>
      _$gFilterGetRuntimeConstantSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeConstant.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeConstant? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeConstant.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeConstants
    implements
        Built<GFilterGetRuntimeConstants, GFilterGetRuntimeConstantsBuilder> {
  GFilterGetRuntimeConstants._();

  factory GFilterGetRuntimeConstants(
          [Function(GFilterGetRuntimeConstantsBuilder b) updates]) =
      _$GFilterGetRuntimeConstants;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get constantName;
  BuiltList<GFilterGetRuntimeConstants>? get and;
  BuiltList<GFilterGetRuntimeConstants>? get or;
  GFilterGetRuntimeConstants? get not;
  static Serializer<GFilterGetRuntimeConstants> get serializer =>
      _$gFilterGetRuntimeConstantsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeConstants.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeConstants? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeConstants.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeErrorMessage
    implements
        Built<GFilterGetRuntimeErrorMessage,
            GFilterGetRuntimeErrorMessageBuilder> {
  GFilterGetRuntimeErrorMessage._();

  factory GFilterGetRuntimeErrorMessage(
          [Function(GFilterGetRuntimeErrorMessageBuilder b) updates]) =
      _$GFilterGetRuntimeErrorMessage;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get errorName;
  BuiltList<GFilterGetRuntimeErrorMessage>? get and;
  BuiltList<GFilterGetRuntimeErrorMessage>? get or;
  GFilterGetRuntimeErrorMessage? get not;
  static Serializer<GFilterGetRuntimeErrorMessage> get serializer =>
      _$gFilterGetRuntimeErrorMessageSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeErrorMessage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeErrorMessage? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeErrorMessage.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeErrorMessages
    implements
        Built<GFilterGetRuntimeErrorMessages,
            GFilterGetRuntimeErrorMessagesBuilder> {
  GFilterGetRuntimeErrorMessages._();

  factory GFilterGetRuntimeErrorMessages(
          [Function(GFilterGetRuntimeErrorMessagesBuilder b) updates]) =
      _$GFilterGetRuntimeErrorMessages;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get errorName;
  BuiltList<GFilterGetRuntimeErrorMessages>? get and;
  BuiltList<GFilterGetRuntimeErrorMessages>? get or;
  GFilterGetRuntimeErrorMessages? get not;
  static Serializer<GFilterGetRuntimeErrorMessages> get serializer =>
      _$gFilterGetRuntimeErrorMessagesSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeErrorMessages.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeErrorMessages? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeErrorMessages.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeEvent
    implements Built<GFilterGetRuntimeEvent, GFilterGetRuntimeEventBuilder> {
  GFilterGetRuntimeEvent._();

  factory GFilterGetRuntimeEvent(
          [Function(GFilterGetRuntimeEventBuilder b) updates]) =
      _$GFilterGetRuntimeEvent;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get eventName;
  BuiltList<GFilterGetRuntimeEvent>? get and;
  BuiltList<GFilterGetRuntimeEvent>? get or;
  GFilterGetRuntimeEvent? get not;
  static Serializer<GFilterGetRuntimeEvent> get serializer =>
      _$gFilterGetRuntimeEventSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeEvent.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeEvent? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeEvent.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeEvents
    implements Built<GFilterGetRuntimeEvents, GFilterGetRuntimeEventsBuilder> {
  GFilterGetRuntimeEvents._();

  factory GFilterGetRuntimeEvents(
          [Function(GFilterGetRuntimeEventsBuilder b) updates]) =
      _$GFilterGetRuntimeEvents;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get eventName;
  BuiltList<GFilterGetRuntimeEvents>? get and;
  BuiltList<GFilterGetRuntimeEvents>? get or;
  GFilterGetRuntimeEvents? get not;
  static Serializer<GFilterGetRuntimeEvents> get serializer =>
      _$gFilterGetRuntimeEventsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeEvents.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeEvents? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeEvents.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeEventAttributes
    implements
        Built<GFilterGetRuntimeEventAttributes,
            GFilterGetRuntimeEventAttributesBuilder> {
  GFilterGetRuntimeEventAttributes._();

  factory GFilterGetRuntimeEventAttributes(
          [Function(GFilterGetRuntimeEventAttributesBuilder b) updates]) =
      _$GFilterGetRuntimeEventAttributes;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get eventName;
  BuiltList<GFilterGetRuntimeEventAttributes>? get and;
  BuiltList<GFilterGetRuntimeEventAttributes>? get or;
  GFilterGetRuntimeEventAttributes? get not;
  static Serializer<GFilterGetRuntimeEventAttributes> get serializer =>
      _$gFilterGetRuntimeEventAttributesSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeEventAttributes.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeEventAttributes? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeEventAttributes.serializer,
        json,
      );
}

abstract class GFilterGetRuntimePallet
    implements Built<GFilterGetRuntimePallet, GFilterGetRuntimePalletBuilder> {
  GFilterGetRuntimePallet._();

  factory GFilterGetRuntimePallet(
          [Function(GFilterGetRuntimePalletBuilder b) updates]) =
      _$GFilterGetRuntimePallet;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  BuiltList<GFilterGetRuntimePallet>? get and;
  BuiltList<GFilterGetRuntimePallet>? get or;
  GFilterGetRuntimePallet? get not;
  static Serializer<GFilterGetRuntimePallet> get serializer =>
      _$gFilterGetRuntimePalletSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimePallet.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimePallet? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimePallet.serializer,
        json,
      );
}

abstract class GFilterGetRuntimePallets
    implements
        Built<GFilterGetRuntimePallets, GFilterGetRuntimePalletsBuilder> {
  GFilterGetRuntimePallets._();

  factory GFilterGetRuntimePallets(
          [Function(GFilterGetRuntimePalletsBuilder b) updates]) =
      _$GFilterGetRuntimePallets;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  BuiltList<GFilterGetRuntimePallets>? get and;
  BuiltList<GFilterGetRuntimePallets>? get or;
  GFilterGetRuntimePallets? get not;
  static Serializer<GFilterGetRuntimePallets> get serializer =>
      _$gFilterGetRuntimePalletsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimePallets.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimePallets? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimePallets.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeStorage
    implements
        Built<GFilterGetRuntimeStorage, GFilterGetRuntimeStorageBuilder> {
  GFilterGetRuntimeStorage._();

  factory GFilterGetRuntimeStorage(
          [Function(GFilterGetRuntimeStorageBuilder b) updates]) =
      _$GFilterGetRuntimeStorage;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get storageName;
  BuiltList<GFilterGetRuntimeStorage>? get and;
  BuiltList<GFilterGetRuntimeStorage>? get or;
  GFilterGetRuntimeStorage? get not;
  static Serializer<GFilterGetRuntimeStorage> get serializer =>
      _$gFilterGetRuntimeStorageSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeStorage.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeStorage? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeStorage.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeStorages
    implements
        Built<GFilterGetRuntimeStorages, GFilterGetRuntimeStoragesBuilder> {
  GFilterGetRuntimeStorages._();

  factory GFilterGetRuntimeStorages(
          [Function(GFilterGetRuntimeStoragesBuilder b) updates]) =
      _$GFilterGetRuntimeStorages;

  String? get specName;
  String? get specVersion;
  String? get pallet;
  String? get storageName;
  BuiltList<GFilterGetRuntimeStorages>? get and;
  BuiltList<GFilterGetRuntimeStorages>? get or;
  GFilterGetRuntimeStorages? get not;
  static Serializer<GFilterGetRuntimeStorages> get serializer =>
      _$gFilterGetRuntimeStoragesSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeStorages.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeStorages? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeStorages.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeType
    implements Built<GFilterGetRuntimeType, GFilterGetRuntimeTypeBuilder> {
  GFilterGetRuntimeType._();

  factory GFilterGetRuntimeType(
          [Function(GFilterGetRuntimeTypeBuilder b) updates]) =
      _$GFilterGetRuntimeType;

  String? get specName;
  String? get specVersion;
  String? get scaleType;
  BuiltList<GFilterGetRuntimeType>? get and;
  BuiltList<GFilterGetRuntimeType>? get or;
  GFilterGetRuntimeType? get not;
  static Serializer<GFilterGetRuntimeType> get serializer =>
      _$gFilterGetRuntimeTypeSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeType? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeType.serializer,
        json,
      );
}

abstract class GFilterGetRuntimeTypes
    implements Built<GFilterGetRuntimeTypes, GFilterGetRuntimeTypesBuilder> {
  GFilterGetRuntimeTypes._();

  factory GFilterGetRuntimeTypes(
          [Function(GFilterGetRuntimeTypesBuilder b) updates]) =
      _$GFilterGetRuntimeTypes;

  String? get specName;
  String? get specVersion;
  String? get scaleType;
  BuiltList<GFilterGetRuntimeTypes>? get and;
  BuiltList<GFilterGetRuntimeTypes>? get or;
  GFilterGetRuntimeTypes? get not;
  static Serializer<GFilterGetRuntimeTypes> get serializer =>
      _$gFilterGetRuntimeTypesSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetRuntimeTypes.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetRuntimeTypes? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetRuntimeTypes.serializer,
        json,
      );
}

abstract class GFilterGetLog
    implements Built<GFilterGetLog, GFilterGetLogBuilder> {
  GFilterGetLog._();

  factory GFilterGetLog([Function(GFilterGetLogBuilder b) updates]) =
      _$GFilterGetLog;

  String? get blockNumber;
  String? get logIdx;
  int? get typeId;
  String? get typeName;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeLte;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeGte;
  String? get blockHash;
  String? get specName;
  int? get specVersion;
  bool? get complete;
  BuiltList<GFilterGetLog>? get and;
  BuiltList<GFilterGetLog>? get or;
  GFilterGetLog? get not;
  static Serializer<GFilterGetLog> get serializer => _$gFilterGetLogSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetLog.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetLog? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetLog.serializer,
        json,
      );
}

abstract class GFilterGetLogs
    implements Built<GFilterGetLogs, GFilterGetLogsBuilder> {
  GFilterGetLogs._();

  factory GFilterGetLogs([Function(GFilterGetLogsBuilder b) updates]) =
      _$GFilterGetLogs;

  String? get blockNumber;
  int? get typeId;
  String? get typeName;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeLte;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeGte;
  String? get blockHash;
  String? get specName;
  int? get specVersion;
  bool? get complete;
  BuiltList<GFilterGetLogs>? get and;
  BuiltList<GFilterGetLogs>? get or;
  GFilterGetLogs? get not;
  static Serializer<GFilterGetLogs> get serializer =>
      _$gFilterGetLogsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetLogs.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetLogs? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetLogs.serializer,
        json,
      );
}

abstract class GFilterGetTransfer
    implements Built<GFilterGetTransfer, GFilterGetTransferBuilder> {
  GFilterGetTransfer._();

  factory GFilterGetTransfer([Function(GFilterGetTransferBuilder b) updates]) =
      _$GFilterGetTransfer;

  String? get blockNumber;
  String? get eventIdx;
  int? get extrinsicIdx;
  String? get fromMultiAddressType;
  String? get fromMultiAddressAccountId;
  String? get fromMultiAddressAddress32;
  String? get fromMultiAddressAddress20;
  String? get toMultiAddressType;
  String? get toMultiAddressAccountId;
  String? get toMultiAddressAddress32;
  String? get toMultiAddressAddress20;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeLte;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeGte;
  BuiltList<GFilterGetTransfer>? get and;
  BuiltList<GFilterGetTransfer>? get or;
  GFilterGetTransfer? get not;
  static Serializer<GFilterGetTransfer> get serializer =>
      _$gFilterGetTransferSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetTransfer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetTransfer? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetTransfer.serializer,
        json,
      );
}

abstract class GFilterGetTransfers
    implements Built<GFilterGetTransfers, GFilterGetTransfersBuilder> {
  GFilterGetTransfers._();

  factory GFilterGetTransfers(
      [Function(GFilterGetTransfersBuilder b) updates]) = _$GFilterGetTransfers;

  String? get blockNumber;
  String? get eventIdx;
  int? get extrinsicIdx;
  String? get fromMultiAddressType;
  String? get fromMultiAddressAccountId;
  String? get fromMultiAddressAddress32;
  String? get fromMultiAddressAddress20;
  String? get toMultiAddressType;
  String? get toMultiAddressAccountId;
  String? get toMultiAddressAddress32;
  String? get toMultiAddressAddress20;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeLte;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeGte;
  BuiltList<GFilterGetTransfers>? get and;
  BuiltList<GFilterGetTransfers>? get or;
  GFilterGetTransfers? get not;
  static Serializer<GFilterGetTransfers> get serializer =>
      _$gFilterGetTransfersSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetTransfers.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetTransfers? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetTransfers.serializer,
        json,
      );
}

abstract class GFilterGetTaggedAccount
    implements Built<GFilterGetTaggedAccount, GFilterGetTaggedAccountBuilder> {
  GFilterGetTaggedAccount._();

  factory GFilterGetTaggedAccount(
          [Function(GFilterGetTaggedAccountBuilder b) updates]) =
      _$GFilterGetTaggedAccount;

  String? get accountId;
  BuiltList<GFilterGetTaggedAccount>? get and;
  BuiltList<GFilterGetTaggedAccount>? get or;
  GFilterGetTaggedAccount? get not;
  static Serializer<GFilterGetTaggedAccount> get serializer =>
      _$gFilterGetTaggedAccountSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GFilterGetTaggedAccount.serializer,
        this,
      ) as Map<String, dynamic>);
  static GFilterGetTaggedAccount? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GFilterGetTaggedAccount.serializer,
        json,
      );
}

abstract class GEventsFilter
    implements Built<GEventsFilter, GEventsFilterBuilder> {
  GEventsFilter._();

  factory GEventsFilter([Function(GEventsFilterBuilder b) updates]) =
      _$GEventsFilter;

  String? get blockNumber;
  String? get eventModule;
  String? get eventName;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeGte;
  GDateTime? get blockDatetimeLte;
  BuiltList<GEventsFilter>? get and;
  BuiltList<GEventsFilter>? get or;
  GEventsFilter? get not;
  static Serializer<GEventsFilter> get serializer => _$gEventsFilterSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GEventsFilter.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEventsFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GEventsFilter.serializer,
        json,
      );
}

abstract class GTransferFilter
    implements Built<GTransferFilter, GTransferFilterBuilder> {
  GTransferFilter._();

  factory GTransferFilter([Function(GTransferFilterBuilder b) updates]) =
      _$GTransferFilter;

  String? get blockNumber;
  String? get eventIdx;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeGte;
  GDateTime? get blockDatetimeLte;
  BuiltList<GTransferFilter>? get and;
  BuiltList<GTransferFilter>? get or;
  GTransferFilter? get not;
  String? get fromMultiAddressAccountId;
  String? get toMultiAddressAccountId;
  static Serializer<GTransferFilter> get serializer =>
      _$gTransferFilterSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GTransferFilter.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransferFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GTransferFilter.serializer,
        json,
      );
}

abstract class GLogFilter implements Built<GLogFilter, GLogFilterBuilder> {
  GLogFilter._();

  factory GLogFilter([Function(GLogFilterBuilder b) updates]) = _$GLogFilter;

  String? get blockNumber;
  String? get logIdx;
  int? get typeId;
  GDateTime? get blockDatetime;
  GDateTime? get blockDatetimeGt;
  GDateTime? get blockDatetimeLt;
  GDateTime? get blockDatetimeGte;
  GDateTime? get blockDatetimeLte;
  BuiltList<GLogFilter>? get and;
  BuiltList<GLogFilter>? get or;
  GLogFilter? get not;
  static Serializer<GLogFilter> get serializer => _$gLogFilterSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GLogFilter.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLogFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GLogFilter.serializer,
        json,
      );
}

const possibleTypesMap = {};
