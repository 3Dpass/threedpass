// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threedpass.schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFilterGetBlock> _$gFilterGetBlockSerializer =
    new _$GFilterGetBlockSerializer();
Serializer<GBlocksFilter> _$gBlocksFilterSerializer =
    new _$GBlocksFilterSerializer();
Serializer<GExtrinsicFilter> _$gExtrinsicFilterSerializer =
    new _$GExtrinsicFilterSerializer();
Serializer<GFilterGetEvent> _$gFilterGetEventSerializer =
    new _$GFilterGetEventSerializer();
Serializer<GFilterGetEvents> _$gFilterGetEventsSerializer =
    new _$GFilterGetEventsSerializer();
Serializer<GFilterGetRuntime> _$gFilterGetRuntimeSerializer =
    new _$GFilterGetRuntimeSerializer();
Serializer<GFilterGetRuntimes> _$gFilterGetRuntimesSerializer =
    new _$GFilterGetRuntimesSerializer();
Serializer<GFilterGetRuntimeCall> _$gFilterGetRuntimeCallSerializer =
    new _$GFilterGetRuntimeCallSerializer();
Serializer<GFilterGetRuntimeCalls> _$gFilterGetRuntimeCallsSerializer =
    new _$GFilterGetRuntimeCallsSerializer();
Serializer<GFilterGetRuntimeCallArguments>
    _$gFilterGetRuntimeCallArgumentsSerializer =
    new _$GFilterGetRuntimeCallArgumentsSerializer();
Serializer<GFilterGetRuntimeConstant> _$gFilterGetRuntimeConstantSerializer =
    new _$GFilterGetRuntimeConstantSerializer();
Serializer<GFilterGetRuntimeConstants> _$gFilterGetRuntimeConstantsSerializer =
    new _$GFilterGetRuntimeConstantsSerializer();
Serializer<GFilterGetRuntimeErrorMessage>
    _$gFilterGetRuntimeErrorMessageSerializer =
    new _$GFilterGetRuntimeErrorMessageSerializer();
Serializer<GFilterGetRuntimeErrorMessages>
    _$gFilterGetRuntimeErrorMessagesSerializer =
    new _$GFilterGetRuntimeErrorMessagesSerializer();
Serializer<GFilterGetRuntimeEvent> _$gFilterGetRuntimeEventSerializer =
    new _$GFilterGetRuntimeEventSerializer();
Serializer<GFilterGetRuntimeEvents> _$gFilterGetRuntimeEventsSerializer =
    new _$GFilterGetRuntimeEventsSerializer();
Serializer<GFilterGetRuntimeEventAttributes>
    _$gFilterGetRuntimeEventAttributesSerializer =
    new _$GFilterGetRuntimeEventAttributesSerializer();
Serializer<GFilterGetRuntimePallet> _$gFilterGetRuntimePalletSerializer =
    new _$GFilterGetRuntimePalletSerializer();
Serializer<GFilterGetRuntimePallets> _$gFilterGetRuntimePalletsSerializer =
    new _$GFilterGetRuntimePalletsSerializer();
Serializer<GFilterGetRuntimeStorage> _$gFilterGetRuntimeStorageSerializer =
    new _$GFilterGetRuntimeStorageSerializer();
Serializer<GFilterGetRuntimeStorages> _$gFilterGetRuntimeStoragesSerializer =
    new _$GFilterGetRuntimeStoragesSerializer();
Serializer<GFilterGetRuntimeType> _$gFilterGetRuntimeTypeSerializer =
    new _$GFilterGetRuntimeTypeSerializer();
Serializer<GFilterGetRuntimeTypes> _$gFilterGetRuntimeTypesSerializer =
    new _$GFilterGetRuntimeTypesSerializer();
Serializer<GFilterGetLog> _$gFilterGetLogSerializer =
    new _$GFilterGetLogSerializer();
Serializer<GFilterGetLogs> _$gFilterGetLogsSerializer =
    new _$GFilterGetLogsSerializer();
Serializer<GFilterGetTransfer> _$gFilterGetTransferSerializer =
    new _$GFilterGetTransferSerializer();
Serializer<GFilterGetTransfers> _$gFilterGetTransfersSerializer =
    new _$GFilterGetTransfersSerializer();
Serializer<GFilterGetTaggedAccount> _$gFilterGetTaggedAccountSerializer =
    new _$GFilterGetTaggedAccountSerializer();
Serializer<GEventsFilter> _$gEventsFilterSerializer =
    new _$GEventsFilterSerializer();
Serializer<GTransferFilter> _$gTransferFilterSerializer =
    new _$GTransferFilterSerializer();
Serializer<GLogFilter> _$gLogFilterSerializer = new _$GLogFilterSerializer();

class _$GFilterGetBlockSerializer
    implements StructuredSerializer<GFilterGetBlock> {
  @override
  final Iterable<Type> types = const [GFilterGetBlock, _$GFilterGetBlock];
  @override
  final String wireName = 'GFilterGetBlock';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFilterGetBlock object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hash;
    if (value != null) {
      result
        ..add('hash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeGt;
    if (value != null) {
      result
        ..add('datetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeLt;
    if (value != null) {
      result
        ..add('datetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeGte;
    if (value != null) {
      result
        ..add('datetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeLte;
    if (value != null) {
      result
        ..add('datetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetBlock)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetBlock)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetBlock)));
    }
    return result;
  }

  @override
  GFilterGetBlock deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetBlockBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'datetime':
          result.datetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeGt':
          result.datetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeLt':
          result.datetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeGte':
          result.datetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeLte':
          result.datetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetBlock)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetBlock)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetBlock))!
              as GFilterGetBlock);
          break;
      }
    }

    return result.build();
  }
}

class _$GBlocksFilterSerializer implements StructuredSerializer<GBlocksFilter> {
  @override
  final Iterable<Type> types = const [GBlocksFilter, _$GBlocksFilter];
  @override
  final String wireName = 'GBlocksFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers, GBlocksFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberGt;
    if (value != null) {
      result
        ..add('numberGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberLt;
    if (value != null) {
      result
        ..add('numberLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberGte;
    if (value != null) {
      result
        ..add('numberGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numberLte;
    if (value != null) {
      result
        ..add('numberLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hash;
    if (value != null) {
      result
        ..add('hash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeGt;
    if (value != null) {
      result
        ..add('datetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeLt;
    if (value != null) {
      result
        ..add('datetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeGte;
    if (value != null) {
      result
        ..add('datetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.datetimeLte;
    if (value != null) {
      result
        ..add('datetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GBlocksFilter)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GBlocksFilter)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GBlocksFilter)));
    }
    return result;
  }

  @override
  GBlocksFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GBlocksFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numberGt':
          result.numberGt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numberLt':
          result.numberLt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numberGte':
          result.numberGte = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numberLte':
          result.numberLte = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'datetime':
          result.datetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeGt':
          result.datetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeLt':
          result.datetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeGte':
          result.datetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'datetimeLte':
          result.datetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GBlocksFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GBlocksFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
              specifiedType: const FullType(GBlocksFilter))! as GBlocksFilter);
          break;
      }
    }

    return result.build();
  }
}

class _$GExtrinsicFilterSerializer
    implements StructuredSerializer<GExtrinsicFilter> {
  @override
  final Iterable<Type> types = const [GExtrinsicFilter, _$GExtrinsicFilter];
  @override
  final String wireName = 'GExtrinsicFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers, GExtrinsicFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.callModule;
    if (value != null) {
      result
        ..add('callModule')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.callName;
    if (value != null) {
      result
        ..add('callName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signed;
    if (value != null) {
      result
        ..add('signed')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GExtrinsicFilter)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GExtrinsicFilter)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GExtrinsicFilter)));
    }
    value = object.multiAddressAccountId;
    if (value != null) {
      result
        ..add('multiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GExtrinsicFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GExtrinsicFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'callModule':
          result.callModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'callName':
          result.callName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'signed':
          result.signed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GExtrinsicFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GExtrinsicFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GExtrinsicFilter))!
              as GExtrinsicFilter);
          break;
        case 'multiAddressAccountId':
          result.multiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetEventSerializer
    implements StructuredSerializer<GFilterGetEvent> {
  @override
  final Iterable<Type> types = const [GFilterGetEvent, _$GFilterGetEvent];
  @override
  final String wireName = 'GFilterGetEvent';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFilterGetEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventIdx;
    if (value != null) {
      result
        ..add('eventIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetEvent)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetEvent)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetEvent)));
    }
    return result;
  }

  @override
  GFilterGetEvent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventIdx':
          result.eventIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetEvent)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetEvent)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetEvent))!
              as GFilterGetEvent);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetEventsSerializer
    implements StructuredSerializer<GFilterGetEvents> {
  @override
  final Iterable<Type> types = const [GFilterGetEvents, _$GFilterGetEvents];
  @override
  final String wireName = 'GFilterGetEvents';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFilterGetEvents object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetEvents)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetEvents)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetEvents)));
    }
    return result;
  }

  @override
  GFilterGetEvents deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetEventsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'eventModule':
          result.eventModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventName':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetEvents)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetEvents)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetEvents))!
              as GFilterGetEvents);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeSerializer
    implements StructuredSerializer<GFilterGetRuntime> {
  @override
  final Iterable<Type> types = const [GFilterGetRuntime, _$GFilterGetRuntime];
  @override
  final String wireName = 'GFilterGetRuntime';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFilterGetRuntime object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntime)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntime)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntime)));
    }
    return result;
  }

  @override
  GFilterGetRuntime deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetRuntime)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetRuntime)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntime))!
              as GFilterGetRuntime);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimesSerializer
    implements StructuredSerializer<GFilterGetRuntimes> {
  @override
  final Iterable<Type> types = const [GFilterGetRuntimes, _$GFilterGetRuntimes];
  @override
  final String wireName = 'GFilterGetRuntimes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimes)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimes)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimes)));
    }
    return result;
  }

  @override
  GFilterGetRuntimes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetRuntimes)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetRuntimes)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimes))!
              as GFilterGetRuntimes);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeCallSerializer
    implements StructuredSerializer<GFilterGetRuntimeCall> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeCall,
    _$GFilterGetRuntimeCall
  ];
  @override
  final String wireName = 'GFilterGetRuntimeCall';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeCall object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeCall)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeCall)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeCall)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeCall deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeCallBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeCall)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeCall)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeCall))!
              as GFilterGetRuntimeCall);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeCallsSerializer
    implements StructuredSerializer<GFilterGetRuntimeCalls> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeCalls,
    _$GFilterGetRuntimeCalls
  ];
  @override
  final String wireName = 'GFilterGetRuntimeCalls';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeCalls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeCalls)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeCalls)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeCalls)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeCalls deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeCallsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeCalls)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeCalls)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeCalls))!
              as GFilterGetRuntimeCalls);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeCallArgumentsSerializer
    implements StructuredSerializer<GFilterGetRuntimeCallArguments> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeCallArguments,
    _$GFilterGetRuntimeCallArguments
  ];
  @override
  final String wireName = 'GFilterGetRuntimeCallArguments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeCallArguments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.callName;
    if (value != null) {
      result
        ..add('callName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeCallArguments)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeCallArguments)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeCallArguments)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeCallArguments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeCallArgumentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'callName':
          result.callName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeCallArguments)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeCallArguments)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFilterGetRuntimeCallArguments))!
              as GFilterGetRuntimeCallArguments);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeConstantSerializer
    implements StructuredSerializer<GFilterGetRuntimeConstant> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeConstant,
    _$GFilterGetRuntimeConstant
  ];
  @override
  final String wireName = 'GFilterGetRuntimeConstant';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeConstant object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.constantName;
    if (value != null) {
      result
        ..add('constantName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeConstant)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeConstant)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeConstant)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeConstant deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeConstantBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'constantName':
          result.constantName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeConstant)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeConstant)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeConstant))!
              as GFilterGetRuntimeConstant);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeConstantsSerializer
    implements StructuredSerializer<GFilterGetRuntimeConstants> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeConstants,
    _$GFilterGetRuntimeConstants
  ];
  @override
  final String wireName = 'GFilterGetRuntimeConstants';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeConstants object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.constantName;
    if (value != null) {
      result
        ..add('constantName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeConstants)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeConstants)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeConstants)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeConstants deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeConstantsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'constantName':
          result.constantName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeConstants)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeConstants)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeConstants))!
              as GFilterGetRuntimeConstants);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeErrorMessageSerializer
    implements StructuredSerializer<GFilterGetRuntimeErrorMessage> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeErrorMessage,
    _$GFilterGetRuntimeErrorMessage
  ];
  @override
  final String wireName = 'GFilterGetRuntimeErrorMessage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeErrorMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.errorName;
    if (value != null) {
      result
        ..add('errorName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeErrorMessage)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeErrorMessage)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeErrorMessage)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeErrorMessage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeErrorMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'errorName':
          result.errorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeErrorMessage)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeErrorMessage)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeErrorMessage))!
              as GFilterGetRuntimeErrorMessage);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeErrorMessagesSerializer
    implements StructuredSerializer<GFilterGetRuntimeErrorMessages> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeErrorMessages,
    _$GFilterGetRuntimeErrorMessages
  ];
  @override
  final String wireName = 'GFilterGetRuntimeErrorMessages';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeErrorMessages object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.errorName;
    if (value != null) {
      result
        ..add('errorName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeErrorMessages)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeErrorMessages)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeErrorMessages)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeErrorMessages deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeErrorMessagesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'errorName':
          result.errorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeErrorMessages)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeErrorMessages)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFilterGetRuntimeErrorMessages))!
              as GFilterGetRuntimeErrorMessages);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeEventSerializer
    implements StructuredSerializer<GFilterGetRuntimeEvent> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeEvent,
    _$GFilterGetRuntimeEvent
  ];
  @override
  final String wireName = 'GFilterGetRuntimeEvent';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
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
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeEvent)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeEvent)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeEvent)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeEvent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventName':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeEvent)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeEvent)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeEvent))!
              as GFilterGetRuntimeEvent);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeEventsSerializer
    implements StructuredSerializer<GFilterGetRuntimeEvents> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeEvents,
    _$GFilterGetRuntimeEvents
  ];
  @override
  final String wireName = 'GFilterGetRuntimeEvents';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeEvents object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
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
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeEvents)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeEvents)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeEvents)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeEvents deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeEventsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventName':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeEvents)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeEvents)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeEvents))!
              as GFilterGetRuntimeEvents);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeEventAttributesSerializer
    implements StructuredSerializer<GFilterGetRuntimeEventAttributes> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeEventAttributes,
    _$GFilterGetRuntimeEventAttributes
  ];
  @override
  final String wireName = 'GFilterGetRuntimeEventAttributes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeEventAttributes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
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
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeEventAttributes)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(GFilterGetRuntimeEventAttributes)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeEventAttributes)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeEventAttributes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeEventAttributesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventName':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeEventAttributes)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeEventAttributes)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFilterGetRuntimeEventAttributes))!
              as GFilterGetRuntimeEventAttributes);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimePalletSerializer
    implements StructuredSerializer<GFilterGetRuntimePallet> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimePallet,
    _$GFilterGetRuntimePallet
  ];
  @override
  final String wireName = 'GFilterGetRuntimePallet';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimePallet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimePallet)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimePallet)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimePallet)));
    }
    return result;
  }

  @override
  GFilterGetRuntimePallet deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimePalletBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimePallet)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimePallet)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimePallet))!
              as GFilterGetRuntimePallet);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimePalletsSerializer
    implements StructuredSerializer<GFilterGetRuntimePallets> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimePallets,
    _$GFilterGetRuntimePallets
  ];
  @override
  final String wireName = 'GFilterGetRuntimePallets';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimePallets object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimePallets)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimePallets)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimePallets)));
    }
    return result;
  }

  @override
  GFilterGetRuntimePallets deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimePalletsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimePallets)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimePallets)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimePallets))!
              as GFilterGetRuntimePallets);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeStorageSerializer
    implements StructuredSerializer<GFilterGetRuntimeStorage> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeStorage,
    _$GFilterGetRuntimeStorage
  ];
  @override
  final String wireName = 'GFilterGetRuntimeStorage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeStorage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storageName;
    if (value != null) {
      result
        ..add('storageName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeStorage)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeStorage)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeStorage)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeStorage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeStorageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'storageName':
          result.storageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeStorage)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeStorage)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeStorage))!
              as GFilterGetRuntimeStorage);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeStoragesSerializer
    implements StructuredSerializer<GFilterGetRuntimeStorages> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeStorages,
    _$GFilterGetRuntimeStorages
  ];
  @override
  final String wireName = 'GFilterGetRuntimeStorages';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeStorages object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pallet;
    if (value != null) {
      result
        ..add('pallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storageName;
    if (value != null) {
      result
        ..add('storageName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeStorages)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeStorages)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeStorages)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeStorages deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeStoragesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pallet':
          result.pallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'storageName':
          result.storageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeStorages)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeStorages)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeStorages))!
              as GFilterGetRuntimeStorages);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeTypeSerializer
    implements StructuredSerializer<GFilterGetRuntimeType> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeType,
    _$GFilterGetRuntimeType
  ];
  @override
  final String wireName = 'GFilterGetRuntimeType';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scaleType;
    if (value != null) {
      result
        ..add('scaleType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeType)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeType)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeType)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeType deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'scaleType':
          result.scaleType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeType)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeType)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeType))!
              as GFilterGetRuntimeType);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetRuntimeTypesSerializer
    implements StructuredSerializer<GFilterGetRuntimeTypes> {
  @override
  final Iterable<Type> types = const [
    GFilterGetRuntimeTypes,
    _$GFilterGetRuntimeTypes
  ];
  @override
  final String wireName = 'GFilterGetRuntimeTypes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetRuntimeTypes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scaleType;
    if (value != null) {
      result
        ..add('scaleType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeTypes)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetRuntimeTypes)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetRuntimeTypes)));
    }
    return result;
  }

  @override
  GFilterGetRuntimeTypes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetRuntimeTypesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'scaleType':
          result.scaleType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeTypes)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetRuntimeTypes)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetRuntimeTypes))!
              as GFilterGetRuntimeTypes);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetLogSerializer implements StructuredSerializer<GFilterGetLog> {
  @override
  final Iterable<Type> types = const [GFilterGetLog, _$GFilterGetLog];
  @override
  final String wireName = 'GFilterGetLog';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFilterGetLog object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logIdx;
    if (value != null) {
      result
        ..add('logIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeId;
    if (value != null) {
      result
        ..add('typeId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.typeName;
    if (value != null) {
      result
        ..add('typeName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockHash;
    if (value != null) {
      result
        ..add('blockHash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.complete;
    if (value != null) {
      result
        ..add('complete')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetLog)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetLog)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetLog)));
    }
    return result;
  }

  @override
  GFilterGetLog deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetLogBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logIdx':
          result.logIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'typeId':
          result.typeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'typeName':
          result.typeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockHash':
          result.blockHash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'complete':
          result.complete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetLog)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetLog)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
              specifiedType: const FullType(GFilterGetLog))! as GFilterGetLog);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetLogsSerializer
    implements StructuredSerializer<GFilterGetLogs> {
  @override
  final Iterable<Type> types = const [GFilterGetLogs, _$GFilterGetLogs];
  @override
  final String wireName = 'GFilterGetLogs';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFilterGetLogs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeId;
    if (value != null) {
      result
        ..add('typeId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.typeName;
    if (value != null) {
      result
        ..add('typeName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockHash;
    if (value != null) {
      result
        ..add('blockHash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specName;
    if (value != null) {
      result
        ..add('specName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specVersion;
    if (value != null) {
      result
        ..add('specVersion')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.complete;
    if (value != null) {
      result
        ..add('complete')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetLogs)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetLogs)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetLogs)));
    }
    return result;
  }

  @override
  GFilterGetLogs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetLogsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'typeId':
          result.typeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'typeName':
          result.typeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockHash':
          result.blockHash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specName':
          result.specName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specVersion':
          result.specVersion = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'complete':
          result.complete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetLogs)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetLogs)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetLogs))!
              as GFilterGetLogs);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetTransferSerializer
    implements StructuredSerializer<GFilterGetTransfer> {
  @override
  final Iterable<Type> types = const [GFilterGetTransfer, _$GFilterGetTransfer];
  @override
  final String wireName = 'GFilterGetTransfer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetTransfer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventIdx;
    if (value != null) {
      result
        ..add('eventIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fromMultiAddressType;
    if (value != null) {
      result
        ..add('fromMultiAddressType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromMultiAddressAccountId;
    if (value != null) {
      result
        ..add('fromMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromMultiAddressAddress32;
    if (value != null) {
      result
        ..add('fromMultiAddressAddress32')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromMultiAddressAddress20;
    if (value != null) {
      result
        ..add('fromMultiAddressAddress20')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressType;
    if (value != null) {
      result
        ..add('toMultiAddressType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAccountId;
    if (value != null) {
      result
        ..add('toMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAddress32;
    if (value != null) {
      result
        ..add('toMultiAddressAddress32')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAddress20;
    if (value != null) {
      result
        ..add('toMultiAddressAddress20')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetTransfer)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetTransfer)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetTransfer)));
    }
    return result;
  }

  @override
  GFilterGetTransfer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetTransferBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventIdx':
          result.eventIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fromMultiAddressType':
          result.fromMultiAddressType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fromMultiAddressAccountId':
          result.fromMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fromMultiAddressAddress32':
          result.fromMultiAddressAddress32 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fromMultiAddressAddress20':
          result.fromMultiAddressAddress20 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressType':
          result.toMultiAddressType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAccountId':
          result.toMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAddress32':
          result.toMultiAddressAddress32 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAddress20':
          result.toMultiAddressAddress20 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetTransfer)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetTransfer)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetTransfer))!
              as GFilterGetTransfer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetTransfersSerializer
    implements StructuredSerializer<GFilterGetTransfers> {
  @override
  final Iterable<Type> types = const [
    GFilterGetTransfers,
    _$GFilterGetTransfers
  ];
  @override
  final String wireName = 'GFilterGetTransfers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetTransfers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventIdx;
    if (value != null) {
      result
        ..add('eventIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.extrinsicIdx;
    if (value != null) {
      result
        ..add('extrinsicIdx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fromMultiAddressType;
    if (value != null) {
      result
        ..add('fromMultiAddressType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromMultiAddressAccountId;
    if (value != null) {
      result
        ..add('fromMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromMultiAddressAddress32;
    if (value != null) {
      result
        ..add('fromMultiAddressAddress32')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromMultiAddressAddress20;
    if (value != null) {
      result
        ..add('fromMultiAddressAddress20')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressType;
    if (value != null) {
      result
        ..add('toMultiAddressType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAccountId;
    if (value != null) {
      result
        ..add('toMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAddress32;
    if (value != null) {
      result
        ..add('toMultiAddressAddress32')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAddress20;
    if (value != null) {
      result
        ..add('toMultiAddressAddress20')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetTransfers)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetTransfers)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetTransfers)));
    }
    return result;
  }

  @override
  GFilterGetTransfers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetTransfersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventIdx':
          result.eventIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'extrinsicIdx':
          result.extrinsicIdx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fromMultiAddressType':
          result.fromMultiAddressType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fromMultiAddressAccountId':
          result.fromMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fromMultiAddressAddress32':
          result.fromMultiAddressAddress32 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fromMultiAddressAddress20':
          result.fromMultiAddressAddress20 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressType':
          result.toMultiAddressType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAccountId':
          result.toMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAddress32':
          result.toMultiAddressAddress32 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAddress20':
          result.toMultiAddressAddress20 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetTransfers)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GFilterGetTransfers)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetTransfers))!
              as GFilterGetTransfers);
          break;
      }
    }

    return result.build();
  }
}

class _$GFilterGetTaggedAccountSerializer
    implements StructuredSerializer<GFilterGetTaggedAccount> {
  @override
  final Iterable<Type> types = const [
    GFilterGetTaggedAccount,
    _$GFilterGetTaggedAccount
  ];
  @override
  final String wireName = 'GFilterGetTaggedAccount';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFilterGetTaggedAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accountId;
    if (value != null) {
      result
        ..add('accountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetTaggedAccount)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GFilterGetTaggedAccount)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFilterGetTaggedAccount)));
    }
    return result;
  }

  @override
  GFilterGetTaggedAccount deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFilterGetTaggedAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accountId':
          result.accountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetTaggedAccount)
              ]))! as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFilterGetTaggedAccount)
              ]))! as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFilterGetTaggedAccount))!
              as GFilterGetTaggedAccount);
          break;
      }
    }

    return result.build();
  }
}

class _$GEventsFilterSerializer implements StructuredSerializer<GEventsFilter> {
  @override
  final Iterable<Type> types = const [GEventsFilter, _$GEventsFilter];
  @override
  final String wireName = 'GEventsFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers, GEventsFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
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
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GEventsFilter)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GEventsFilter)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GEventsFilter)));
    }
    return result;
  }

  @override
  GEventsFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GEventsFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
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
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GEventsFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GEventsFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
              specifiedType: const FullType(GEventsFilter))! as GEventsFilter);
          break;
      }
    }

    return result.build();
  }
}

class _$GTransferFilterSerializer
    implements StructuredSerializer<GTransferFilter> {
  @override
  final Iterable<Type> types = const [GTransferFilter, _$GTransferFilter];
  @override
  final String wireName = 'GTransferFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTransferFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventIdx;
    if (value != null) {
      result
        ..add('eventIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GTransferFilter)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GTransferFilter)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GTransferFilter)));
    }
    value = object.fromMultiAddressAccountId;
    if (value != null) {
      result
        ..add('fromMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toMultiAddressAccountId;
    if (value != null) {
      result
        ..add('toMultiAddressAccountId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTransferFilter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTransferFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eventIdx':
          result.eventIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GTransferFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GTransferFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GTransferFilter))!
              as GTransferFilter);
          break;
        case 'fromMultiAddressAccountId':
          result.fromMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'toMultiAddressAccountId':
          result.toMultiAddressAccountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GLogFilterSerializer implements StructuredSerializer<GLogFilter> {
  @override
  final Iterable<Type> types = const [GLogFilter, _$GLogFilter];
  @override
  final String wireName = 'GLogFilter';

  @override
  Iterable<Object?> serialize(Serializers serializers, GLogFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.blockNumber;
    if (value != null) {
      result
        ..add('blockNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logIdx;
    if (value != null) {
      result
        ..add('logIdx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeId;
    if (value != null) {
      result
        ..add('typeId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.blockDatetime;
    if (value != null) {
      result
        ..add('blockDatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGt;
    if (value != null) {
      result
        ..add('blockDatetimeGt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLt;
    if (value != null) {
      result
        ..add('blockDatetimeLt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeGte;
    if (value != null) {
      result
        ..add('blockDatetimeGte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.blockDatetimeLte;
    if (value != null) {
      result
        ..add('blockDatetimeLte')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTime)));
    }
    value = object.and;
    if (value != null) {
      result
        ..add('and')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(GLogFilter)])));
    }
    value = object.or;
    if (value != null) {
      result
        ..add('or')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(GLogFilter)])));
    }
    value = object.not;
    if (value != null) {
      result
        ..add('not')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GLogFilter)));
    }
    return result;
  }

  @override
  GLogFilter deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLogFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'blockNumber':
          result.blockNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logIdx':
          result.logIdx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'typeId':
          result.typeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'blockDatetime':
          result.blockDatetime.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGt':
          result.blockDatetimeGt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLt':
          result.blockDatetimeLt.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeGte':
          result.blockDatetimeGte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'blockDatetimeLte':
          result.blockDatetimeLte.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTime))! as GDateTime);
          break;
        case 'and':
          result.and.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GLogFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'or':
          result.or.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GLogFilter)]))!
              as BuiltList<Object?>);
          break;
        case 'not':
          result.not.replace(serializers.deserialize(value,
              specifiedType: const FullType(GLogFilter))! as GLogFilter);
          break;
      }
    }

    return result.build();
  }
}

class _$GDateTime extends GDateTime {
  @override
  final String value;

  factory _$GDateTime([void Function(GDateTimeBuilder)? updates]) =>
      (new GDateTimeBuilder()..update(updates))._build();

  _$GDateTime._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GDateTime', 'value');
  }

  @override
  GDateTime rebuild(void Function(GDateTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateTimeBuilder toBuilder() => new GDateTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDateTime && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDateTime')..add('value', value))
        .toString();
  }
}

class GDateTimeBuilder implements Builder<GDateTime, GDateTimeBuilder> {
  _$GDateTime? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GDateTimeBuilder();

  GDateTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDateTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDateTime;
  }

  @override
  void update(void Function(GDateTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDateTime build() => _build();

  _$GDateTime _build() {
    final _$result = _$v ??
        new _$GDateTime._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GDateTime', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetBlock extends GFilterGetBlock {
  @override
  final String? number;
  @override
  final String? hash;
  @override
  final GDateTime? datetime;
  @override
  final GDateTime? datetimeGt;
  @override
  final GDateTime? datetimeLt;
  @override
  final GDateTime? datetimeGte;
  @override
  final GDateTime? datetimeLte;
  @override
  final BuiltList<GFilterGetBlock>? and;
  @override
  final BuiltList<GFilterGetBlock>? or;
  @override
  final GFilterGetBlock? not;

  factory _$GFilterGetBlock([void Function(GFilterGetBlockBuilder)? updates]) =>
      (new GFilterGetBlockBuilder()..update(updates))._build();

  _$GFilterGetBlock._(
      {this.number,
      this.hash,
      this.datetime,
      this.datetimeGt,
      this.datetimeLt,
      this.datetimeGte,
      this.datetimeLte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetBlock rebuild(void Function(GFilterGetBlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetBlockBuilder toBuilder() =>
      new GFilterGetBlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetBlock &&
        number == other.number &&
        hash == other.hash &&
        datetime == other.datetime &&
        datetimeGt == other.datetimeGt &&
        datetimeLt == other.datetimeLt &&
        datetimeGte == other.datetimeGte &&
        datetimeLte == other.datetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, number.hashCode), hash.hashCode),
                                    datetime.hashCode),
                                datetimeGt.hashCode),
                            datetimeLt.hashCode),
                        datetimeGte.hashCode),
                    datetimeLte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetBlock')
          ..add('number', number)
          ..add('hash', hash)
          ..add('datetime', datetime)
          ..add('datetimeGt', datetimeGt)
          ..add('datetimeLt', datetimeLt)
          ..add('datetimeGte', datetimeGte)
          ..add('datetimeLte', datetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetBlockBuilder
    implements Builder<GFilterGetBlock, GFilterGetBlockBuilder> {
  _$GFilterGetBlock? _$v;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  String? _hash;
  String? get hash => _$this._hash;
  set hash(String? hash) => _$this._hash = hash;

  GDateTimeBuilder? _datetime;
  GDateTimeBuilder get datetime => _$this._datetime ??= new GDateTimeBuilder();
  set datetime(GDateTimeBuilder? datetime) => _$this._datetime = datetime;

  GDateTimeBuilder? _datetimeGt;
  GDateTimeBuilder get datetimeGt =>
      _$this._datetimeGt ??= new GDateTimeBuilder();
  set datetimeGt(GDateTimeBuilder? datetimeGt) =>
      _$this._datetimeGt = datetimeGt;

  GDateTimeBuilder? _datetimeLt;
  GDateTimeBuilder get datetimeLt =>
      _$this._datetimeLt ??= new GDateTimeBuilder();
  set datetimeLt(GDateTimeBuilder? datetimeLt) =>
      _$this._datetimeLt = datetimeLt;

  GDateTimeBuilder? _datetimeGte;
  GDateTimeBuilder get datetimeGte =>
      _$this._datetimeGte ??= new GDateTimeBuilder();
  set datetimeGte(GDateTimeBuilder? datetimeGte) =>
      _$this._datetimeGte = datetimeGte;

  GDateTimeBuilder? _datetimeLte;
  GDateTimeBuilder get datetimeLte =>
      _$this._datetimeLte ??= new GDateTimeBuilder();
  set datetimeLte(GDateTimeBuilder? datetimeLte) =>
      _$this._datetimeLte = datetimeLte;

  ListBuilder<GFilterGetBlock>? _and;
  ListBuilder<GFilterGetBlock> get and =>
      _$this._and ??= new ListBuilder<GFilterGetBlock>();
  set and(ListBuilder<GFilterGetBlock>? and) => _$this._and = and;

  ListBuilder<GFilterGetBlock>? _or;
  ListBuilder<GFilterGetBlock> get or =>
      _$this._or ??= new ListBuilder<GFilterGetBlock>();
  set or(ListBuilder<GFilterGetBlock>? or) => _$this._or = or;

  GFilterGetBlockBuilder? _not;
  GFilterGetBlockBuilder get not =>
      _$this._not ??= new GFilterGetBlockBuilder();
  set not(GFilterGetBlockBuilder? not) => _$this._not = not;

  GFilterGetBlockBuilder();

  GFilterGetBlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _number = $v.number;
      _hash = $v.hash;
      _datetime = $v.datetime?.toBuilder();
      _datetimeGt = $v.datetimeGt?.toBuilder();
      _datetimeLt = $v.datetimeLt?.toBuilder();
      _datetimeGte = $v.datetimeGte?.toBuilder();
      _datetimeLte = $v.datetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetBlock other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetBlock;
  }

  @override
  void update(void Function(GFilterGetBlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetBlock build() => _build();

  _$GFilterGetBlock _build() {
    _$GFilterGetBlock _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetBlock._(
              number: number,
              hash: hash,
              datetime: _datetime?.build(),
              datetimeGt: _datetimeGt?.build(),
              datetimeLt: _datetimeLt?.build(),
              datetimeGte: _datetimeGte?.build(),
              datetimeLte: _datetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'datetime';
        _datetime?.build();
        _$failedField = 'datetimeGt';
        _datetimeGt?.build();
        _$failedField = 'datetimeLt';
        _datetimeLt?.build();
        _$failedField = 'datetimeGte';
        _datetimeGte?.build();
        _$failedField = 'datetimeLte';
        _datetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetBlock', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GBlocksFilter extends GBlocksFilter {
  @override
  final String? number;
  @override
  final String? numberGt;
  @override
  final String? numberLt;
  @override
  final String? numberGte;
  @override
  final String? numberLte;
  @override
  final String? hash;
  @override
  final GDateTime? datetime;
  @override
  final GDateTime? datetimeGt;
  @override
  final GDateTime? datetimeLt;
  @override
  final GDateTime? datetimeGte;
  @override
  final GDateTime? datetimeLte;
  @override
  final BuiltList<GBlocksFilter>? and;
  @override
  final BuiltList<GBlocksFilter>? or;
  @override
  final GBlocksFilter? not;

  factory _$GBlocksFilter([void Function(GBlocksFilterBuilder)? updates]) =>
      (new GBlocksFilterBuilder()..update(updates))._build();

  _$GBlocksFilter._(
      {this.number,
      this.numberGt,
      this.numberLt,
      this.numberGte,
      this.numberLte,
      this.hash,
      this.datetime,
      this.datetimeGt,
      this.datetimeLt,
      this.datetimeGte,
      this.datetimeLte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GBlocksFilter rebuild(void Function(GBlocksFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBlocksFilterBuilder toBuilder() => new GBlocksFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBlocksFilter &&
        number == other.number &&
        numberGt == other.numberGt &&
        numberLt == other.numberLt &&
        numberGte == other.numberGte &&
        numberLte == other.numberLte &&
        hash == other.hash &&
        datetime == other.datetime &&
        datetimeGt == other.datetimeGt &&
        datetimeLt == other.datetimeLt &&
        datetimeGte == other.datetimeGte &&
        datetimeLte == other.datetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, number.hashCode),
                                                        numberGt.hashCode),
                                                    numberLt.hashCode),
                                                numberGte.hashCode),
                                            numberLte.hashCode),
                                        hash.hashCode),
                                    datetime.hashCode),
                                datetimeGt.hashCode),
                            datetimeLt.hashCode),
                        datetimeGte.hashCode),
                    datetimeLte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GBlocksFilter')
          ..add('number', number)
          ..add('numberGt', numberGt)
          ..add('numberLt', numberLt)
          ..add('numberGte', numberGte)
          ..add('numberLte', numberLte)
          ..add('hash', hash)
          ..add('datetime', datetime)
          ..add('datetimeGt', datetimeGt)
          ..add('datetimeLt', datetimeLt)
          ..add('datetimeGte', datetimeGte)
          ..add('datetimeLte', datetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GBlocksFilterBuilder
    implements Builder<GBlocksFilter, GBlocksFilterBuilder> {
  _$GBlocksFilter? _$v;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  String? _numberGt;
  String? get numberGt => _$this._numberGt;
  set numberGt(String? numberGt) => _$this._numberGt = numberGt;

  String? _numberLt;
  String? get numberLt => _$this._numberLt;
  set numberLt(String? numberLt) => _$this._numberLt = numberLt;

  String? _numberGte;
  String? get numberGte => _$this._numberGte;
  set numberGte(String? numberGte) => _$this._numberGte = numberGte;

  String? _numberLte;
  String? get numberLte => _$this._numberLte;
  set numberLte(String? numberLte) => _$this._numberLte = numberLte;

  String? _hash;
  String? get hash => _$this._hash;
  set hash(String? hash) => _$this._hash = hash;

  GDateTimeBuilder? _datetime;
  GDateTimeBuilder get datetime => _$this._datetime ??= new GDateTimeBuilder();
  set datetime(GDateTimeBuilder? datetime) => _$this._datetime = datetime;

  GDateTimeBuilder? _datetimeGt;
  GDateTimeBuilder get datetimeGt =>
      _$this._datetimeGt ??= new GDateTimeBuilder();
  set datetimeGt(GDateTimeBuilder? datetimeGt) =>
      _$this._datetimeGt = datetimeGt;

  GDateTimeBuilder? _datetimeLt;
  GDateTimeBuilder get datetimeLt =>
      _$this._datetimeLt ??= new GDateTimeBuilder();
  set datetimeLt(GDateTimeBuilder? datetimeLt) =>
      _$this._datetimeLt = datetimeLt;

  GDateTimeBuilder? _datetimeGte;
  GDateTimeBuilder get datetimeGte =>
      _$this._datetimeGte ??= new GDateTimeBuilder();
  set datetimeGte(GDateTimeBuilder? datetimeGte) =>
      _$this._datetimeGte = datetimeGte;

  GDateTimeBuilder? _datetimeLte;
  GDateTimeBuilder get datetimeLte =>
      _$this._datetimeLte ??= new GDateTimeBuilder();
  set datetimeLte(GDateTimeBuilder? datetimeLte) =>
      _$this._datetimeLte = datetimeLte;

  ListBuilder<GBlocksFilter>? _and;
  ListBuilder<GBlocksFilter> get and =>
      _$this._and ??= new ListBuilder<GBlocksFilter>();
  set and(ListBuilder<GBlocksFilter>? and) => _$this._and = and;

  ListBuilder<GBlocksFilter>? _or;
  ListBuilder<GBlocksFilter> get or =>
      _$this._or ??= new ListBuilder<GBlocksFilter>();
  set or(ListBuilder<GBlocksFilter>? or) => _$this._or = or;

  GBlocksFilterBuilder? _not;
  GBlocksFilterBuilder get not => _$this._not ??= new GBlocksFilterBuilder();
  set not(GBlocksFilterBuilder? not) => _$this._not = not;

  GBlocksFilterBuilder();

  GBlocksFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _number = $v.number;
      _numberGt = $v.numberGt;
      _numberLt = $v.numberLt;
      _numberGte = $v.numberGte;
      _numberLte = $v.numberLte;
      _hash = $v.hash;
      _datetime = $v.datetime?.toBuilder();
      _datetimeGt = $v.datetimeGt?.toBuilder();
      _datetimeLt = $v.datetimeLt?.toBuilder();
      _datetimeGte = $v.datetimeGte?.toBuilder();
      _datetimeLte = $v.datetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBlocksFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBlocksFilter;
  }

  @override
  void update(void Function(GBlocksFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBlocksFilter build() => _build();

  _$GBlocksFilter _build() {
    _$GBlocksFilter _$result;
    try {
      _$result = _$v ??
          new _$GBlocksFilter._(
              number: number,
              numberGt: numberGt,
              numberLt: numberLt,
              numberGte: numberGte,
              numberLte: numberLte,
              hash: hash,
              datetime: _datetime?.build(),
              datetimeGt: _datetimeGt?.build(),
              datetimeLt: _datetimeLt?.build(),
              datetimeGte: _datetimeGte?.build(),
              datetimeLte: _datetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'datetime';
        _datetime?.build();
        _$failedField = 'datetimeGt';
        _datetimeGt?.build();
        _$failedField = 'datetimeLt';
        _datetimeLt?.build();
        _$failedField = 'datetimeGte';
        _datetimeGte?.build();
        _$failedField = 'datetimeLte';
        _datetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GBlocksFilter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GJSONString extends GJSONString {
  @override
  final String value;

  factory _$GJSONString([void Function(GJSONStringBuilder)? updates]) =>
      (new GJSONStringBuilder()..update(updates))._build();

  _$GJSONString._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GJSONString', 'value');
  }

  @override
  GJSONString rebuild(void Function(GJSONStringBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GJSONStringBuilder toBuilder() => new GJSONStringBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GJSONString && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GJSONString')..add('value', value))
        .toString();
  }
}

class GJSONStringBuilder implements Builder<GJSONString, GJSONStringBuilder> {
  _$GJSONString? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GJSONStringBuilder();

  GJSONStringBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GJSONString other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GJSONString;
  }

  @override
  void update(void Function(GJSONStringBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GJSONString build() => _build();

  _$GJSONString _build() {
    final _$result = _$v ??
        new _$GJSONString._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GJSONString', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GExtrinsicFilter extends GExtrinsicFilter {
  @override
  final String? blockNumber;
  @override
  final String? extrinsicIdx;
  @override
  final String? callModule;
  @override
  final String? callName;
  @override
  final int? signed;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final BuiltList<GExtrinsicFilter>? and;
  @override
  final BuiltList<GExtrinsicFilter>? or;
  @override
  final GExtrinsicFilter? not;
  @override
  final String? multiAddressAccountId;

  factory _$GExtrinsicFilter(
          [void Function(GExtrinsicFilterBuilder)? updates]) =>
      (new GExtrinsicFilterBuilder()..update(updates))._build();

  _$GExtrinsicFilter._(
      {this.blockNumber,
      this.extrinsicIdx,
      this.callModule,
      this.callName,
      this.signed,
      this.blockDatetime,
      this.blockDatetimeGt,
      this.blockDatetimeLt,
      this.blockDatetimeGte,
      this.blockDatetimeLte,
      this.and,
      this.or,
      this.not,
      this.multiAddressAccountId})
      : super._();

  @override
  GExtrinsicFilter rebuild(void Function(GExtrinsicFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GExtrinsicFilterBuilder toBuilder() =>
      new GExtrinsicFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GExtrinsicFilter &&
        blockNumber == other.blockNumber &&
        extrinsicIdx == other.extrinsicIdx &&
        callModule == other.callModule &&
        callName == other.callName &&
        signed == other.signed &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockDatetimeLte == other.blockDatetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not &&
        multiAddressAccountId == other.multiAddressAccountId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            blockNumber
                                                                .hashCode),
                                                        extrinsicIdx.hashCode),
                                                    callModule.hashCode),
                                                callName.hashCode),
                                            signed.hashCode),
                                        blockDatetime.hashCode),
                                    blockDatetimeGt.hashCode),
                                blockDatetimeLt.hashCode),
                            blockDatetimeGte.hashCode),
                        blockDatetimeLte.hashCode),
                    and.hashCode),
                or.hashCode),
            not.hashCode),
        multiAddressAccountId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GExtrinsicFilter')
          ..add('blockNumber', blockNumber)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('callModule', callModule)
          ..add('callName', callName)
          ..add('signed', signed)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not)
          ..add('multiAddressAccountId', multiAddressAccountId))
        .toString();
  }
}

class GExtrinsicFilterBuilder
    implements Builder<GExtrinsicFilter, GExtrinsicFilterBuilder> {
  _$GExtrinsicFilter? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _extrinsicIdx;
  String? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(String? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  String? _callModule;
  String? get callModule => _$this._callModule;
  set callModule(String? callModule) => _$this._callModule = callModule;

  String? _callName;
  String? get callName => _$this._callName;
  set callName(String? callName) => _$this._callName = callName;

  int? _signed;
  int? get signed => _$this._signed;
  set signed(int? signed) => _$this._signed = signed;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  ListBuilder<GExtrinsicFilter>? _and;
  ListBuilder<GExtrinsicFilter> get and =>
      _$this._and ??= new ListBuilder<GExtrinsicFilter>();
  set and(ListBuilder<GExtrinsicFilter>? and) => _$this._and = and;

  ListBuilder<GExtrinsicFilter>? _or;
  ListBuilder<GExtrinsicFilter> get or =>
      _$this._or ??= new ListBuilder<GExtrinsicFilter>();
  set or(ListBuilder<GExtrinsicFilter>? or) => _$this._or = or;

  GExtrinsicFilterBuilder? _not;
  GExtrinsicFilterBuilder get not =>
      _$this._not ??= new GExtrinsicFilterBuilder();
  set not(GExtrinsicFilterBuilder? not) => _$this._not = not;

  String? _multiAddressAccountId;
  String? get multiAddressAccountId => _$this._multiAddressAccountId;
  set multiAddressAccountId(String? multiAddressAccountId) =>
      _$this._multiAddressAccountId = multiAddressAccountId;

  GExtrinsicFilterBuilder();

  GExtrinsicFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _extrinsicIdx = $v.extrinsicIdx;
      _callModule = $v.callModule;
      _callName = $v.callName;
      _signed = $v.signed;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _multiAddressAccountId = $v.multiAddressAccountId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GExtrinsicFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GExtrinsicFilter;
  }

  @override
  void update(void Function(GExtrinsicFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GExtrinsicFilter build() => _build();

  _$GExtrinsicFilter _build() {
    _$GExtrinsicFilter _$result;
    try {
      _$result = _$v ??
          new _$GExtrinsicFilter._(
              blockNumber: blockNumber,
              extrinsicIdx: extrinsicIdx,
              callModule: callModule,
              callName: callName,
              signed: signed,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build(),
              multiAddressAccountId: multiAddressAccountId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GExtrinsicFilter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetEvent extends GFilterGetEvent {
  @override
  final String? blockNumber;
  @override
  final String? eventIdx;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final BuiltList<GFilterGetEvent>? and;
  @override
  final BuiltList<GFilterGetEvent>? or;
  @override
  final GFilterGetEvent? not;

  factory _$GFilterGetEvent([void Function(GFilterGetEventBuilder)? updates]) =>
      (new GFilterGetEventBuilder()..update(updates))._build();

  _$GFilterGetEvent._(
      {this.blockNumber,
      this.eventIdx,
      this.blockDatetime,
      this.blockDatetimeGt,
      this.blockDatetimeLt,
      this.blockDatetimeGte,
      this.blockDatetimeLte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetEvent rebuild(void Function(GFilterGetEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetEventBuilder toBuilder() =>
      new GFilterGetEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetEvent &&
        blockNumber == other.blockNumber &&
        eventIdx == other.eventIdx &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockDatetimeLte == other.blockDatetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, blockNumber.hashCode),
                                        eventIdx.hashCode),
                                    blockDatetime.hashCode),
                                blockDatetimeGt.hashCode),
                            blockDatetimeLt.hashCode),
                        blockDatetimeGte.hashCode),
                    blockDatetimeLte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetEvent')
          ..add('blockNumber', blockNumber)
          ..add('eventIdx', eventIdx)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetEventBuilder
    implements Builder<GFilterGetEvent, GFilterGetEventBuilder> {
  _$GFilterGetEvent? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _eventIdx;
  String? get eventIdx => _$this._eventIdx;
  set eventIdx(String? eventIdx) => _$this._eventIdx = eventIdx;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  ListBuilder<GFilterGetEvent>? _and;
  ListBuilder<GFilterGetEvent> get and =>
      _$this._and ??= new ListBuilder<GFilterGetEvent>();
  set and(ListBuilder<GFilterGetEvent>? and) => _$this._and = and;

  ListBuilder<GFilterGetEvent>? _or;
  ListBuilder<GFilterGetEvent> get or =>
      _$this._or ??= new ListBuilder<GFilterGetEvent>();
  set or(ListBuilder<GFilterGetEvent>? or) => _$this._or = or;

  GFilterGetEventBuilder? _not;
  GFilterGetEventBuilder get not =>
      _$this._not ??= new GFilterGetEventBuilder();
  set not(GFilterGetEventBuilder? not) => _$this._not = not;

  GFilterGetEventBuilder();

  GFilterGetEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _eventIdx = $v.eventIdx;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetEvent;
  }

  @override
  void update(void Function(GFilterGetEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetEvent build() => _build();

  _$GFilterGetEvent _build() {
    _$GFilterGetEvent _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetEvent._(
              blockNumber: blockNumber,
              eventIdx: eventIdx,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetEvents extends GFilterGetEvents {
  @override
  final String? blockNumber;
  @override
  final int? extrinsicIdx;
  @override
  final String? eventModule;
  @override
  final String? eventName;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final BuiltList<GFilterGetEvents>? and;
  @override
  final BuiltList<GFilterGetEvents>? or;
  @override
  final GFilterGetEvents? not;

  factory _$GFilterGetEvents(
          [void Function(GFilterGetEventsBuilder)? updates]) =>
      (new GFilterGetEventsBuilder()..update(updates))._build();

  _$GFilterGetEvents._(
      {this.blockNumber,
      this.extrinsicIdx,
      this.eventModule,
      this.eventName,
      this.blockDatetime,
      this.blockDatetimeGt,
      this.blockDatetimeLt,
      this.blockDatetimeGte,
      this.blockDatetimeLte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetEvents rebuild(void Function(GFilterGetEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetEventsBuilder toBuilder() =>
      new GFilterGetEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetEvents &&
        blockNumber == other.blockNumber &&
        extrinsicIdx == other.extrinsicIdx &&
        eventModule == other.eventModule &&
        eventName == other.eventName &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockDatetimeLte == other.blockDatetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, blockNumber.hashCode),
                                                extrinsicIdx.hashCode),
                                            eventModule.hashCode),
                                        eventName.hashCode),
                                    blockDatetime.hashCode),
                                blockDatetimeGt.hashCode),
                            blockDatetimeLt.hashCode),
                        blockDatetimeGte.hashCode),
                    blockDatetimeLte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetEvents')
          ..add('blockNumber', blockNumber)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('eventModule', eventModule)
          ..add('eventName', eventName)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetEventsBuilder
    implements Builder<GFilterGetEvents, GFilterGetEventsBuilder> {
  _$GFilterGetEvents? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  int? _extrinsicIdx;
  int? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(int? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  String? _eventModule;
  String? get eventModule => _$this._eventModule;
  set eventModule(String? eventModule) => _$this._eventModule = eventModule;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  ListBuilder<GFilterGetEvents>? _and;
  ListBuilder<GFilterGetEvents> get and =>
      _$this._and ??= new ListBuilder<GFilterGetEvents>();
  set and(ListBuilder<GFilterGetEvents>? and) => _$this._and = and;

  ListBuilder<GFilterGetEvents>? _or;
  ListBuilder<GFilterGetEvents> get or =>
      _$this._or ??= new ListBuilder<GFilterGetEvents>();
  set or(ListBuilder<GFilterGetEvents>? or) => _$this._or = or;

  GFilterGetEventsBuilder? _not;
  GFilterGetEventsBuilder get not =>
      _$this._not ??= new GFilterGetEventsBuilder();
  set not(GFilterGetEventsBuilder? not) => _$this._not = not;

  GFilterGetEventsBuilder();

  GFilterGetEventsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _extrinsicIdx = $v.extrinsicIdx;
      _eventModule = $v.eventModule;
      _eventName = $v.eventName;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetEvents;
  }

  @override
  void update(void Function(GFilterGetEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetEvents build() => _build();

  _$GFilterGetEvents _build() {
    _$GFilterGetEvents _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetEvents._(
              blockNumber: blockNumber,
              extrinsicIdx: extrinsicIdx,
              eventModule: eventModule,
              eventName: eventName,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetEvents', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntime extends GFilterGetRuntime {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final BuiltList<GFilterGetRuntime>? and;
  @override
  final BuiltList<GFilterGetRuntime>? or;
  @override
  final GFilterGetRuntime? not;

  factory _$GFilterGetRuntime(
          [void Function(GFilterGetRuntimeBuilder)? updates]) =>
      (new GFilterGetRuntimeBuilder()..update(updates))._build();

  _$GFilterGetRuntime._(
      {this.specName, this.specVersion, this.and, this.or, this.not})
      : super._();

  @override
  GFilterGetRuntime rebuild(void Function(GFilterGetRuntimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeBuilder toBuilder() =>
      new GFilterGetRuntimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntime &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntime')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeBuilder
    implements Builder<GFilterGetRuntime, GFilterGetRuntimeBuilder> {
  _$GFilterGetRuntime? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  ListBuilder<GFilterGetRuntime>? _and;
  ListBuilder<GFilterGetRuntime> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntime>();
  set and(ListBuilder<GFilterGetRuntime>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntime>? _or;
  ListBuilder<GFilterGetRuntime> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntime>();
  set or(ListBuilder<GFilterGetRuntime>? or) => _$this._or = or;

  GFilterGetRuntimeBuilder? _not;
  GFilterGetRuntimeBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeBuilder();
  set not(GFilterGetRuntimeBuilder? not) => _$this._not = not;

  GFilterGetRuntimeBuilder();

  GFilterGetRuntimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntime;
  }

  @override
  void update(void Function(GFilterGetRuntimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntime build() => _build();

  _$GFilterGetRuntime _build() {
    _$GFilterGetRuntime _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntime._(
              specName: specName,
              specVersion: specVersion,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntime', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimes extends GFilterGetRuntimes {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final BuiltList<GFilterGetRuntimes>? and;
  @override
  final BuiltList<GFilterGetRuntimes>? or;
  @override
  final GFilterGetRuntimes? not;

  factory _$GFilterGetRuntimes(
          [void Function(GFilterGetRuntimesBuilder)? updates]) =>
      (new GFilterGetRuntimesBuilder()..update(updates))._build();

  _$GFilterGetRuntimes._(
      {this.specName, this.specVersion, this.and, this.or, this.not})
      : super._();

  @override
  GFilterGetRuntimes rebuild(
          void Function(GFilterGetRuntimesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimesBuilder toBuilder() =>
      new GFilterGetRuntimesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimes &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimes')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimesBuilder
    implements Builder<GFilterGetRuntimes, GFilterGetRuntimesBuilder> {
  _$GFilterGetRuntimes? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  ListBuilder<GFilterGetRuntimes>? _and;
  ListBuilder<GFilterGetRuntimes> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimes>();
  set and(ListBuilder<GFilterGetRuntimes>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimes>? _or;
  ListBuilder<GFilterGetRuntimes> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimes>();
  set or(ListBuilder<GFilterGetRuntimes>? or) => _$this._or = or;

  GFilterGetRuntimesBuilder? _not;
  GFilterGetRuntimesBuilder get not =>
      _$this._not ??= new GFilterGetRuntimesBuilder();
  set not(GFilterGetRuntimesBuilder? not) => _$this._not = not;

  GFilterGetRuntimesBuilder();

  GFilterGetRuntimesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimes;
  }

  @override
  void update(void Function(GFilterGetRuntimesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimes build() => _build();

  _$GFilterGetRuntimes _build() {
    _$GFilterGetRuntimes _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimes._(
              specName: specName,
              specVersion: specVersion,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeCall extends GFilterGetRuntimeCall {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final BuiltList<GFilterGetRuntimeCall>? and;
  @override
  final BuiltList<GFilterGetRuntimeCall>? or;
  @override
  final GFilterGetRuntimeCall? not;

  factory _$GFilterGetRuntimeCall(
          [void Function(GFilterGetRuntimeCallBuilder)? updates]) =>
      (new GFilterGetRuntimeCallBuilder()..update(updates))._build();

  _$GFilterGetRuntimeCall._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeCall rebuild(
          void Function(GFilterGetRuntimeCallBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeCallBuilder toBuilder() =>
      new GFilterGetRuntimeCallBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeCall &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                    pallet.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeCall')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeCallBuilder
    implements Builder<GFilterGetRuntimeCall, GFilterGetRuntimeCallBuilder> {
  _$GFilterGetRuntimeCall? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  ListBuilder<GFilterGetRuntimeCall>? _and;
  ListBuilder<GFilterGetRuntimeCall> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeCall>();
  set and(ListBuilder<GFilterGetRuntimeCall>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeCall>? _or;
  ListBuilder<GFilterGetRuntimeCall> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeCall>();
  set or(ListBuilder<GFilterGetRuntimeCall>? or) => _$this._or = or;

  GFilterGetRuntimeCallBuilder? _not;
  GFilterGetRuntimeCallBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeCallBuilder();
  set not(GFilterGetRuntimeCallBuilder? not) => _$this._not = not;

  GFilterGetRuntimeCallBuilder();

  GFilterGetRuntimeCallBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeCall other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeCall;
  }

  @override
  void update(void Function(GFilterGetRuntimeCallBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeCall build() => _build();

  _$GFilterGetRuntimeCall _build() {
    _$GFilterGetRuntimeCall _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeCall._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeCall', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeCalls extends GFilterGetRuntimeCalls {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final BuiltList<GFilterGetRuntimeCalls>? and;
  @override
  final BuiltList<GFilterGetRuntimeCalls>? or;
  @override
  final GFilterGetRuntimeCalls? not;

  factory _$GFilterGetRuntimeCalls(
          [void Function(GFilterGetRuntimeCallsBuilder)? updates]) =>
      (new GFilterGetRuntimeCallsBuilder()..update(updates))._build();

  _$GFilterGetRuntimeCalls._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeCalls rebuild(
          void Function(GFilterGetRuntimeCallsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeCallsBuilder toBuilder() =>
      new GFilterGetRuntimeCallsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeCalls &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                    pallet.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeCalls')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeCallsBuilder
    implements Builder<GFilterGetRuntimeCalls, GFilterGetRuntimeCallsBuilder> {
  _$GFilterGetRuntimeCalls? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  ListBuilder<GFilterGetRuntimeCalls>? _and;
  ListBuilder<GFilterGetRuntimeCalls> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeCalls>();
  set and(ListBuilder<GFilterGetRuntimeCalls>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeCalls>? _or;
  ListBuilder<GFilterGetRuntimeCalls> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeCalls>();
  set or(ListBuilder<GFilterGetRuntimeCalls>? or) => _$this._or = or;

  GFilterGetRuntimeCallsBuilder? _not;
  GFilterGetRuntimeCallsBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeCallsBuilder();
  set not(GFilterGetRuntimeCallsBuilder? not) => _$this._not = not;

  GFilterGetRuntimeCallsBuilder();

  GFilterGetRuntimeCallsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeCalls other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeCalls;
  }

  @override
  void update(void Function(GFilterGetRuntimeCallsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeCalls build() => _build();

  _$GFilterGetRuntimeCalls _build() {
    _$GFilterGetRuntimeCalls _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeCalls._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeCalls', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeCallArguments extends GFilterGetRuntimeCallArguments {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? callName;
  @override
  final BuiltList<GFilterGetRuntimeCallArguments>? and;
  @override
  final BuiltList<GFilterGetRuntimeCallArguments>? or;
  @override
  final GFilterGetRuntimeCallArguments? not;

  factory _$GFilterGetRuntimeCallArguments(
          [void Function(GFilterGetRuntimeCallArgumentsBuilder)? updates]) =>
      (new GFilterGetRuntimeCallArgumentsBuilder()..update(updates))._build();

  _$GFilterGetRuntimeCallArguments._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.callName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeCallArguments rebuild(
          void Function(GFilterGetRuntimeCallArgumentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeCallArgumentsBuilder toBuilder() =>
      new GFilterGetRuntimeCallArgumentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeCallArguments &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        callName == other.callName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    callName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeCallArguments')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('callName', callName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeCallArgumentsBuilder
    implements
        Builder<GFilterGetRuntimeCallArguments,
            GFilterGetRuntimeCallArgumentsBuilder> {
  _$GFilterGetRuntimeCallArguments? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _callName;
  String? get callName => _$this._callName;
  set callName(String? callName) => _$this._callName = callName;

  ListBuilder<GFilterGetRuntimeCallArguments>? _and;
  ListBuilder<GFilterGetRuntimeCallArguments> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeCallArguments>();
  set and(ListBuilder<GFilterGetRuntimeCallArguments>? and) =>
      _$this._and = and;

  ListBuilder<GFilterGetRuntimeCallArguments>? _or;
  ListBuilder<GFilterGetRuntimeCallArguments> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeCallArguments>();
  set or(ListBuilder<GFilterGetRuntimeCallArguments>? or) => _$this._or = or;

  GFilterGetRuntimeCallArgumentsBuilder? _not;
  GFilterGetRuntimeCallArgumentsBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeCallArgumentsBuilder();
  set not(GFilterGetRuntimeCallArgumentsBuilder? not) => _$this._not = not;

  GFilterGetRuntimeCallArgumentsBuilder();

  GFilterGetRuntimeCallArgumentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _callName = $v.callName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeCallArguments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeCallArguments;
  }

  @override
  void update(void Function(GFilterGetRuntimeCallArgumentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeCallArguments build() => _build();

  _$GFilterGetRuntimeCallArguments _build() {
    _$GFilterGetRuntimeCallArguments _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeCallArguments._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              callName: callName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeCallArguments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeConstant extends GFilterGetRuntimeConstant {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? constantName;
  @override
  final BuiltList<GFilterGetRuntimeConstant>? and;
  @override
  final BuiltList<GFilterGetRuntimeConstant>? or;
  @override
  final GFilterGetRuntimeConstant? not;

  factory _$GFilterGetRuntimeConstant(
          [void Function(GFilterGetRuntimeConstantBuilder)? updates]) =>
      (new GFilterGetRuntimeConstantBuilder()..update(updates))._build();

  _$GFilterGetRuntimeConstant._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.constantName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeConstant rebuild(
          void Function(GFilterGetRuntimeConstantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeConstantBuilder toBuilder() =>
      new GFilterGetRuntimeConstantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeConstant &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        constantName == other.constantName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    constantName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeConstant')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('constantName', constantName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeConstantBuilder
    implements
        Builder<GFilterGetRuntimeConstant, GFilterGetRuntimeConstantBuilder> {
  _$GFilterGetRuntimeConstant? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _constantName;
  String? get constantName => _$this._constantName;
  set constantName(String? constantName) => _$this._constantName = constantName;

  ListBuilder<GFilterGetRuntimeConstant>? _and;
  ListBuilder<GFilterGetRuntimeConstant> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeConstant>();
  set and(ListBuilder<GFilterGetRuntimeConstant>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeConstant>? _or;
  ListBuilder<GFilterGetRuntimeConstant> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeConstant>();
  set or(ListBuilder<GFilterGetRuntimeConstant>? or) => _$this._or = or;

  GFilterGetRuntimeConstantBuilder? _not;
  GFilterGetRuntimeConstantBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeConstantBuilder();
  set not(GFilterGetRuntimeConstantBuilder? not) => _$this._not = not;

  GFilterGetRuntimeConstantBuilder();

  GFilterGetRuntimeConstantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _constantName = $v.constantName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeConstant other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeConstant;
  }

  @override
  void update(void Function(GFilterGetRuntimeConstantBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeConstant build() => _build();

  _$GFilterGetRuntimeConstant _build() {
    _$GFilterGetRuntimeConstant _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeConstant._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              constantName: constantName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeConstant', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeConstants extends GFilterGetRuntimeConstants {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? constantName;
  @override
  final BuiltList<GFilterGetRuntimeConstants>? and;
  @override
  final BuiltList<GFilterGetRuntimeConstants>? or;
  @override
  final GFilterGetRuntimeConstants? not;

  factory _$GFilterGetRuntimeConstants(
          [void Function(GFilterGetRuntimeConstantsBuilder)? updates]) =>
      (new GFilterGetRuntimeConstantsBuilder()..update(updates))._build();

  _$GFilterGetRuntimeConstants._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.constantName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeConstants rebuild(
          void Function(GFilterGetRuntimeConstantsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeConstantsBuilder toBuilder() =>
      new GFilterGetRuntimeConstantsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeConstants &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        constantName == other.constantName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    constantName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeConstants')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('constantName', constantName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeConstantsBuilder
    implements
        Builder<GFilterGetRuntimeConstants, GFilterGetRuntimeConstantsBuilder> {
  _$GFilterGetRuntimeConstants? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _constantName;
  String? get constantName => _$this._constantName;
  set constantName(String? constantName) => _$this._constantName = constantName;

  ListBuilder<GFilterGetRuntimeConstants>? _and;
  ListBuilder<GFilterGetRuntimeConstants> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeConstants>();
  set and(ListBuilder<GFilterGetRuntimeConstants>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeConstants>? _or;
  ListBuilder<GFilterGetRuntimeConstants> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeConstants>();
  set or(ListBuilder<GFilterGetRuntimeConstants>? or) => _$this._or = or;

  GFilterGetRuntimeConstantsBuilder? _not;
  GFilterGetRuntimeConstantsBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeConstantsBuilder();
  set not(GFilterGetRuntimeConstantsBuilder? not) => _$this._not = not;

  GFilterGetRuntimeConstantsBuilder();

  GFilterGetRuntimeConstantsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _constantName = $v.constantName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeConstants other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeConstants;
  }

  @override
  void update(void Function(GFilterGetRuntimeConstantsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeConstants build() => _build();

  _$GFilterGetRuntimeConstants _build() {
    _$GFilterGetRuntimeConstants _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeConstants._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              constantName: constantName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeConstants', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeErrorMessage extends GFilterGetRuntimeErrorMessage {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? errorName;
  @override
  final BuiltList<GFilterGetRuntimeErrorMessage>? and;
  @override
  final BuiltList<GFilterGetRuntimeErrorMessage>? or;
  @override
  final GFilterGetRuntimeErrorMessage? not;

  factory _$GFilterGetRuntimeErrorMessage(
          [void Function(GFilterGetRuntimeErrorMessageBuilder)? updates]) =>
      (new GFilterGetRuntimeErrorMessageBuilder()..update(updates))._build();

  _$GFilterGetRuntimeErrorMessage._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.errorName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeErrorMessage rebuild(
          void Function(GFilterGetRuntimeErrorMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeErrorMessageBuilder toBuilder() =>
      new GFilterGetRuntimeErrorMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeErrorMessage &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        errorName == other.errorName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    errorName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeErrorMessage')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('errorName', errorName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeErrorMessageBuilder
    implements
        Builder<GFilterGetRuntimeErrorMessage,
            GFilterGetRuntimeErrorMessageBuilder> {
  _$GFilterGetRuntimeErrorMessage? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _errorName;
  String? get errorName => _$this._errorName;
  set errorName(String? errorName) => _$this._errorName = errorName;

  ListBuilder<GFilterGetRuntimeErrorMessage>? _and;
  ListBuilder<GFilterGetRuntimeErrorMessage> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeErrorMessage>();
  set and(ListBuilder<GFilterGetRuntimeErrorMessage>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeErrorMessage>? _or;
  ListBuilder<GFilterGetRuntimeErrorMessage> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeErrorMessage>();
  set or(ListBuilder<GFilterGetRuntimeErrorMessage>? or) => _$this._or = or;

  GFilterGetRuntimeErrorMessageBuilder? _not;
  GFilterGetRuntimeErrorMessageBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeErrorMessageBuilder();
  set not(GFilterGetRuntimeErrorMessageBuilder? not) => _$this._not = not;

  GFilterGetRuntimeErrorMessageBuilder();

  GFilterGetRuntimeErrorMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _errorName = $v.errorName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeErrorMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeErrorMessage;
  }

  @override
  void update(void Function(GFilterGetRuntimeErrorMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeErrorMessage build() => _build();

  _$GFilterGetRuntimeErrorMessage _build() {
    _$GFilterGetRuntimeErrorMessage _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeErrorMessage._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              errorName: errorName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeErrorMessage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeErrorMessages extends GFilterGetRuntimeErrorMessages {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? errorName;
  @override
  final BuiltList<GFilterGetRuntimeErrorMessages>? and;
  @override
  final BuiltList<GFilterGetRuntimeErrorMessages>? or;
  @override
  final GFilterGetRuntimeErrorMessages? not;

  factory _$GFilterGetRuntimeErrorMessages(
          [void Function(GFilterGetRuntimeErrorMessagesBuilder)? updates]) =>
      (new GFilterGetRuntimeErrorMessagesBuilder()..update(updates))._build();

  _$GFilterGetRuntimeErrorMessages._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.errorName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeErrorMessages rebuild(
          void Function(GFilterGetRuntimeErrorMessagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeErrorMessagesBuilder toBuilder() =>
      new GFilterGetRuntimeErrorMessagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeErrorMessages &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        errorName == other.errorName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    errorName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeErrorMessages')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('errorName', errorName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeErrorMessagesBuilder
    implements
        Builder<GFilterGetRuntimeErrorMessages,
            GFilterGetRuntimeErrorMessagesBuilder> {
  _$GFilterGetRuntimeErrorMessages? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _errorName;
  String? get errorName => _$this._errorName;
  set errorName(String? errorName) => _$this._errorName = errorName;

  ListBuilder<GFilterGetRuntimeErrorMessages>? _and;
  ListBuilder<GFilterGetRuntimeErrorMessages> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeErrorMessages>();
  set and(ListBuilder<GFilterGetRuntimeErrorMessages>? and) =>
      _$this._and = and;

  ListBuilder<GFilterGetRuntimeErrorMessages>? _or;
  ListBuilder<GFilterGetRuntimeErrorMessages> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeErrorMessages>();
  set or(ListBuilder<GFilterGetRuntimeErrorMessages>? or) => _$this._or = or;

  GFilterGetRuntimeErrorMessagesBuilder? _not;
  GFilterGetRuntimeErrorMessagesBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeErrorMessagesBuilder();
  set not(GFilterGetRuntimeErrorMessagesBuilder? not) => _$this._not = not;

  GFilterGetRuntimeErrorMessagesBuilder();

  GFilterGetRuntimeErrorMessagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _errorName = $v.errorName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeErrorMessages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeErrorMessages;
  }

  @override
  void update(void Function(GFilterGetRuntimeErrorMessagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeErrorMessages build() => _build();

  _$GFilterGetRuntimeErrorMessages _build() {
    _$GFilterGetRuntimeErrorMessages _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeErrorMessages._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              errorName: errorName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeErrorMessages', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeEvent extends GFilterGetRuntimeEvent {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? eventName;
  @override
  final BuiltList<GFilterGetRuntimeEvent>? and;
  @override
  final BuiltList<GFilterGetRuntimeEvent>? or;
  @override
  final GFilterGetRuntimeEvent? not;

  factory _$GFilterGetRuntimeEvent(
          [void Function(GFilterGetRuntimeEventBuilder)? updates]) =>
      (new GFilterGetRuntimeEventBuilder()..update(updates))._build();

  _$GFilterGetRuntimeEvent._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.eventName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeEvent rebuild(
          void Function(GFilterGetRuntimeEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeEventBuilder toBuilder() =>
      new GFilterGetRuntimeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeEvent &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        eventName == other.eventName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    eventName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeEvent')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('eventName', eventName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeEventBuilder
    implements Builder<GFilterGetRuntimeEvent, GFilterGetRuntimeEventBuilder> {
  _$GFilterGetRuntimeEvent? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  ListBuilder<GFilterGetRuntimeEvent>? _and;
  ListBuilder<GFilterGetRuntimeEvent> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeEvent>();
  set and(ListBuilder<GFilterGetRuntimeEvent>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeEvent>? _or;
  ListBuilder<GFilterGetRuntimeEvent> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeEvent>();
  set or(ListBuilder<GFilterGetRuntimeEvent>? or) => _$this._or = or;

  GFilterGetRuntimeEventBuilder? _not;
  GFilterGetRuntimeEventBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeEventBuilder();
  set not(GFilterGetRuntimeEventBuilder? not) => _$this._not = not;

  GFilterGetRuntimeEventBuilder();

  GFilterGetRuntimeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _eventName = $v.eventName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeEvent;
  }

  @override
  void update(void Function(GFilterGetRuntimeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeEvent build() => _build();

  _$GFilterGetRuntimeEvent _build() {
    _$GFilterGetRuntimeEvent _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeEvent._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              eventName: eventName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeEvents extends GFilterGetRuntimeEvents {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? eventName;
  @override
  final BuiltList<GFilterGetRuntimeEvents>? and;
  @override
  final BuiltList<GFilterGetRuntimeEvents>? or;
  @override
  final GFilterGetRuntimeEvents? not;

  factory _$GFilterGetRuntimeEvents(
          [void Function(GFilterGetRuntimeEventsBuilder)? updates]) =>
      (new GFilterGetRuntimeEventsBuilder()..update(updates))._build();

  _$GFilterGetRuntimeEvents._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.eventName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeEvents rebuild(
          void Function(GFilterGetRuntimeEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeEventsBuilder toBuilder() =>
      new GFilterGetRuntimeEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeEvents &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        eventName == other.eventName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    eventName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeEvents')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('eventName', eventName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeEventsBuilder
    implements
        Builder<GFilterGetRuntimeEvents, GFilterGetRuntimeEventsBuilder> {
  _$GFilterGetRuntimeEvents? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  ListBuilder<GFilterGetRuntimeEvents>? _and;
  ListBuilder<GFilterGetRuntimeEvents> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeEvents>();
  set and(ListBuilder<GFilterGetRuntimeEvents>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeEvents>? _or;
  ListBuilder<GFilterGetRuntimeEvents> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeEvents>();
  set or(ListBuilder<GFilterGetRuntimeEvents>? or) => _$this._or = or;

  GFilterGetRuntimeEventsBuilder? _not;
  GFilterGetRuntimeEventsBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeEventsBuilder();
  set not(GFilterGetRuntimeEventsBuilder? not) => _$this._not = not;

  GFilterGetRuntimeEventsBuilder();

  GFilterGetRuntimeEventsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _eventName = $v.eventName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeEvents;
  }

  @override
  void update(void Function(GFilterGetRuntimeEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeEvents build() => _build();

  _$GFilterGetRuntimeEvents _build() {
    _$GFilterGetRuntimeEvents _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeEvents._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              eventName: eventName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeEvents', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeEventAttributes
    extends GFilterGetRuntimeEventAttributes {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? eventName;
  @override
  final BuiltList<GFilterGetRuntimeEventAttributes>? and;
  @override
  final BuiltList<GFilterGetRuntimeEventAttributes>? or;
  @override
  final GFilterGetRuntimeEventAttributes? not;

  factory _$GFilterGetRuntimeEventAttributes(
          [void Function(GFilterGetRuntimeEventAttributesBuilder)? updates]) =>
      (new GFilterGetRuntimeEventAttributesBuilder()..update(updates))._build();

  _$GFilterGetRuntimeEventAttributes._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.eventName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeEventAttributes rebuild(
          void Function(GFilterGetRuntimeEventAttributesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeEventAttributesBuilder toBuilder() =>
      new GFilterGetRuntimeEventAttributesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeEventAttributes &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        eventName == other.eventName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    eventName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeEventAttributes')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('eventName', eventName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeEventAttributesBuilder
    implements
        Builder<GFilterGetRuntimeEventAttributes,
            GFilterGetRuntimeEventAttributesBuilder> {
  _$GFilterGetRuntimeEventAttributes? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  ListBuilder<GFilterGetRuntimeEventAttributes>? _and;
  ListBuilder<GFilterGetRuntimeEventAttributes> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeEventAttributes>();
  set and(ListBuilder<GFilterGetRuntimeEventAttributes>? and) =>
      _$this._and = and;

  ListBuilder<GFilterGetRuntimeEventAttributes>? _or;
  ListBuilder<GFilterGetRuntimeEventAttributes> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeEventAttributes>();
  set or(ListBuilder<GFilterGetRuntimeEventAttributes>? or) => _$this._or = or;

  GFilterGetRuntimeEventAttributesBuilder? _not;
  GFilterGetRuntimeEventAttributesBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeEventAttributesBuilder();
  set not(GFilterGetRuntimeEventAttributesBuilder? not) => _$this._not = not;

  GFilterGetRuntimeEventAttributesBuilder();

  GFilterGetRuntimeEventAttributesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _eventName = $v.eventName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeEventAttributes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeEventAttributes;
  }

  @override
  void update(void Function(GFilterGetRuntimeEventAttributesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeEventAttributes build() => _build();

  _$GFilterGetRuntimeEventAttributes _build() {
    _$GFilterGetRuntimeEventAttributes _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeEventAttributes._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              eventName: eventName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeEventAttributes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimePallet extends GFilterGetRuntimePallet {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final BuiltList<GFilterGetRuntimePallet>? and;
  @override
  final BuiltList<GFilterGetRuntimePallet>? or;
  @override
  final GFilterGetRuntimePallet? not;

  factory _$GFilterGetRuntimePallet(
          [void Function(GFilterGetRuntimePalletBuilder)? updates]) =>
      (new GFilterGetRuntimePalletBuilder()..update(updates))._build();

  _$GFilterGetRuntimePallet._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimePallet rebuild(
          void Function(GFilterGetRuntimePalletBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimePalletBuilder toBuilder() =>
      new GFilterGetRuntimePalletBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimePallet &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                    pallet.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimePallet')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimePalletBuilder
    implements
        Builder<GFilterGetRuntimePallet, GFilterGetRuntimePalletBuilder> {
  _$GFilterGetRuntimePallet? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  ListBuilder<GFilterGetRuntimePallet>? _and;
  ListBuilder<GFilterGetRuntimePallet> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimePallet>();
  set and(ListBuilder<GFilterGetRuntimePallet>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimePallet>? _or;
  ListBuilder<GFilterGetRuntimePallet> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimePallet>();
  set or(ListBuilder<GFilterGetRuntimePallet>? or) => _$this._or = or;

  GFilterGetRuntimePalletBuilder? _not;
  GFilterGetRuntimePalletBuilder get not =>
      _$this._not ??= new GFilterGetRuntimePalletBuilder();
  set not(GFilterGetRuntimePalletBuilder? not) => _$this._not = not;

  GFilterGetRuntimePalletBuilder();

  GFilterGetRuntimePalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimePallet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimePallet;
  }

  @override
  void update(void Function(GFilterGetRuntimePalletBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimePallet build() => _build();

  _$GFilterGetRuntimePallet _build() {
    _$GFilterGetRuntimePallet _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimePallet._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimePallet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimePallets extends GFilterGetRuntimePallets {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final BuiltList<GFilterGetRuntimePallets>? and;
  @override
  final BuiltList<GFilterGetRuntimePallets>? or;
  @override
  final GFilterGetRuntimePallets? not;

  factory _$GFilterGetRuntimePallets(
          [void Function(GFilterGetRuntimePalletsBuilder)? updates]) =>
      (new GFilterGetRuntimePalletsBuilder()..update(updates))._build();

  _$GFilterGetRuntimePallets._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimePallets rebuild(
          void Function(GFilterGetRuntimePalletsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimePalletsBuilder toBuilder() =>
      new GFilterGetRuntimePalletsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimePallets &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                    pallet.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimePallets')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimePalletsBuilder
    implements
        Builder<GFilterGetRuntimePallets, GFilterGetRuntimePalletsBuilder> {
  _$GFilterGetRuntimePallets? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  ListBuilder<GFilterGetRuntimePallets>? _and;
  ListBuilder<GFilterGetRuntimePallets> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimePallets>();
  set and(ListBuilder<GFilterGetRuntimePallets>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimePallets>? _or;
  ListBuilder<GFilterGetRuntimePallets> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimePallets>();
  set or(ListBuilder<GFilterGetRuntimePallets>? or) => _$this._or = or;

  GFilterGetRuntimePalletsBuilder? _not;
  GFilterGetRuntimePalletsBuilder get not =>
      _$this._not ??= new GFilterGetRuntimePalletsBuilder();
  set not(GFilterGetRuntimePalletsBuilder? not) => _$this._not = not;

  GFilterGetRuntimePalletsBuilder();

  GFilterGetRuntimePalletsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimePallets other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimePallets;
  }

  @override
  void update(void Function(GFilterGetRuntimePalletsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimePallets build() => _build();

  _$GFilterGetRuntimePallets _build() {
    _$GFilterGetRuntimePallets _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimePallets._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimePallets', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeStorage extends GFilterGetRuntimeStorage {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? storageName;
  @override
  final BuiltList<GFilterGetRuntimeStorage>? and;
  @override
  final BuiltList<GFilterGetRuntimeStorage>? or;
  @override
  final GFilterGetRuntimeStorage? not;

  factory _$GFilterGetRuntimeStorage(
          [void Function(GFilterGetRuntimeStorageBuilder)? updates]) =>
      (new GFilterGetRuntimeStorageBuilder()..update(updates))._build();

  _$GFilterGetRuntimeStorage._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.storageName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeStorage rebuild(
          void Function(GFilterGetRuntimeStorageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeStorageBuilder toBuilder() =>
      new GFilterGetRuntimeStorageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeStorage &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        storageName == other.storageName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    storageName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeStorage')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('storageName', storageName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeStorageBuilder
    implements
        Builder<GFilterGetRuntimeStorage, GFilterGetRuntimeStorageBuilder> {
  _$GFilterGetRuntimeStorage? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _storageName;
  String? get storageName => _$this._storageName;
  set storageName(String? storageName) => _$this._storageName = storageName;

  ListBuilder<GFilterGetRuntimeStorage>? _and;
  ListBuilder<GFilterGetRuntimeStorage> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeStorage>();
  set and(ListBuilder<GFilterGetRuntimeStorage>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeStorage>? _or;
  ListBuilder<GFilterGetRuntimeStorage> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeStorage>();
  set or(ListBuilder<GFilterGetRuntimeStorage>? or) => _$this._or = or;

  GFilterGetRuntimeStorageBuilder? _not;
  GFilterGetRuntimeStorageBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeStorageBuilder();
  set not(GFilterGetRuntimeStorageBuilder? not) => _$this._not = not;

  GFilterGetRuntimeStorageBuilder();

  GFilterGetRuntimeStorageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _storageName = $v.storageName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeStorage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeStorage;
  }

  @override
  void update(void Function(GFilterGetRuntimeStorageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeStorage build() => _build();

  _$GFilterGetRuntimeStorage _build() {
    _$GFilterGetRuntimeStorage _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeStorage._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              storageName: storageName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeStorage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeStorages extends GFilterGetRuntimeStorages {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? pallet;
  @override
  final String? storageName;
  @override
  final BuiltList<GFilterGetRuntimeStorages>? and;
  @override
  final BuiltList<GFilterGetRuntimeStorages>? or;
  @override
  final GFilterGetRuntimeStorages? not;

  factory _$GFilterGetRuntimeStorages(
          [void Function(GFilterGetRuntimeStoragesBuilder)? updates]) =>
      (new GFilterGetRuntimeStoragesBuilder()..update(updates))._build();

  _$GFilterGetRuntimeStorages._(
      {this.specName,
      this.specVersion,
      this.pallet,
      this.storageName,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeStorages rebuild(
          void Function(GFilterGetRuntimeStoragesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeStoragesBuilder toBuilder() =>
      new GFilterGetRuntimeStoragesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeStorages &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        pallet == other.pallet &&
        storageName == other.storageName &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                        pallet.hashCode),
                    storageName.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeStorages')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('pallet', pallet)
          ..add('storageName', storageName)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeStoragesBuilder
    implements
        Builder<GFilterGetRuntimeStorages, GFilterGetRuntimeStoragesBuilder> {
  _$GFilterGetRuntimeStorages? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _pallet;
  String? get pallet => _$this._pallet;
  set pallet(String? pallet) => _$this._pallet = pallet;

  String? _storageName;
  String? get storageName => _$this._storageName;
  set storageName(String? storageName) => _$this._storageName = storageName;

  ListBuilder<GFilterGetRuntimeStorages>? _and;
  ListBuilder<GFilterGetRuntimeStorages> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeStorages>();
  set and(ListBuilder<GFilterGetRuntimeStorages>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeStorages>? _or;
  ListBuilder<GFilterGetRuntimeStorages> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeStorages>();
  set or(ListBuilder<GFilterGetRuntimeStorages>? or) => _$this._or = or;

  GFilterGetRuntimeStoragesBuilder? _not;
  GFilterGetRuntimeStoragesBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeStoragesBuilder();
  set not(GFilterGetRuntimeStoragesBuilder? not) => _$this._not = not;

  GFilterGetRuntimeStoragesBuilder();

  GFilterGetRuntimeStoragesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _pallet = $v.pallet;
      _storageName = $v.storageName;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeStorages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeStorages;
  }

  @override
  void update(void Function(GFilterGetRuntimeStoragesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeStorages build() => _build();

  _$GFilterGetRuntimeStorages _build() {
    _$GFilterGetRuntimeStorages _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeStorages._(
              specName: specName,
              specVersion: specVersion,
              pallet: pallet,
              storageName: storageName,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeStorages', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeType extends GFilterGetRuntimeType {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? scaleType;
  @override
  final BuiltList<GFilterGetRuntimeType>? and;
  @override
  final BuiltList<GFilterGetRuntimeType>? or;
  @override
  final GFilterGetRuntimeType? not;

  factory _$GFilterGetRuntimeType(
          [void Function(GFilterGetRuntimeTypeBuilder)? updates]) =>
      (new GFilterGetRuntimeTypeBuilder()..update(updates))._build();

  _$GFilterGetRuntimeType._(
      {this.specName,
      this.specVersion,
      this.scaleType,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeType rebuild(
          void Function(GFilterGetRuntimeTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeTypeBuilder toBuilder() =>
      new GFilterGetRuntimeTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeType &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        scaleType == other.scaleType &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                    scaleType.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeType')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('scaleType', scaleType)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeTypeBuilder
    implements Builder<GFilterGetRuntimeType, GFilterGetRuntimeTypeBuilder> {
  _$GFilterGetRuntimeType? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _scaleType;
  String? get scaleType => _$this._scaleType;
  set scaleType(String? scaleType) => _$this._scaleType = scaleType;

  ListBuilder<GFilterGetRuntimeType>? _and;
  ListBuilder<GFilterGetRuntimeType> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeType>();
  set and(ListBuilder<GFilterGetRuntimeType>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeType>? _or;
  ListBuilder<GFilterGetRuntimeType> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeType>();
  set or(ListBuilder<GFilterGetRuntimeType>? or) => _$this._or = or;

  GFilterGetRuntimeTypeBuilder? _not;
  GFilterGetRuntimeTypeBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeTypeBuilder();
  set not(GFilterGetRuntimeTypeBuilder? not) => _$this._not = not;

  GFilterGetRuntimeTypeBuilder();

  GFilterGetRuntimeTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _scaleType = $v.scaleType;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeType;
  }

  @override
  void update(void Function(GFilterGetRuntimeTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeType build() => _build();

  _$GFilterGetRuntimeType _build() {
    _$GFilterGetRuntimeType _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeType._(
              specName: specName,
              specVersion: specVersion,
              scaleType: scaleType,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetRuntimeTypes extends GFilterGetRuntimeTypes {
  @override
  final String? specName;
  @override
  final String? specVersion;
  @override
  final String? scaleType;
  @override
  final BuiltList<GFilterGetRuntimeTypes>? and;
  @override
  final BuiltList<GFilterGetRuntimeTypes>? or;
  @override
  final GFilterGetRuntimeTypes? not;

  factory _$GFilterGetRuntimeTypes(
          [void Function(GFilterGetRuntimeTypesBuilder)? updates]) =>
      (new GFilterGetRuntimeTypesBuilder()..update(updates))._build();

  _$GFilterGetRuntimeTypes._(
      {this.specName,
      this.specVersion,
      this.scaleType,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetRuntimeTypes rebuild(
          void Function(GFilterGetRuntimeTypesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetRuntimeTypesBuilder toBuilder() =>
      new GFilterGetRuntimeTypesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetRuntimeTypes &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        scaleType == other.scaleType &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, specName.hashCode), specVersion.hashCode),
                    scaleType.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetRuntimeTypes')
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('scaleType', scaleType)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetRuntimeTypesBuilder
    implements Builder<GFilterGetRuntimeTypes, GFilterGetRuntimeTypesBuilder> {
  _$GFilterGetRuntimeTypes? _$v;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  String? _specVersion;
  String? get specVersion => _$this._specVersion;
  set specVersion(String? specVersion) => _$this._specVersion = specVersion;

  String? _scaleType;
  String? get scaleType => _$this._scaleType;
  set scaleType(String? scaleType) => _$this._scaleType = scaleType;

  ListBuilder<GFilterGetRuntimeTypes>? _and;
  ListBuilder<GFilterGetRuntimeTypes> get and =>
      _$this._and ??= new ListBuilder<GFilterGetRuntimeTypes>();
  set and(ListBuilder<GFilterGetRuntimeTypes>? and) => _$this._and = and;

  ListBuilder<GFilterGetRuntimeTypes>? _or;
  ListBuilder<GFilterGetRuntimeTypes> get or =>
      _$this._or ??= new ListBuilder<GFilterGetRuntimeTypes>();
  set or(ListBuilder<GFilterGetRuntimeTypes>? or) => _$this._or = or;

  GFilterGetRuntimeTypesBuilder? _not;
  GFilterGetRuntimeTypesBuilder get not =>
      _$this._not ??= new GFilterGetRuntimeTypesBuilder();
  set not(GFilterGetRuntimeTypesBuilder? not) => _$this._not = not;

  GFilterGetRuntimeTypesBuilder();

  GFilterGetRuntimeTypesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _scaleType = $v.scaleType;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetRuntimeTypes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetRuntimeTypes;
  }

  @override
  void update(void Function(GFilterGetRuntimeTypesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetRuntimeTypes build() => _build();

  _$GFilterGetRuntimeTypes _build() {
    _$GFilterGetRuntimeTypes _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetRuntimeTypes._(
              specName: specName,
              specVersion: specVersion,
              scaleType: scaleType,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetRuntimeTypes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetLog extends GFilterGetLog {
  @override
  final String? blockNumber;
  @override
  final String? logIdx;
  @override
  final int? typeId;
  @override
  final String? typeName;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final String? blockHash;
  @override
  final String? specName;
  @override
  final int? specVersion;
  @override
  final bool? complete;
  @override
  final BuiltList<GFilterGetLog>? and;
  @override
  final BuiltList<GFilterGetLog>? or;
  @override
  final GFilterGetLog? not;

  factory _$GFilterGetLog([void Function(GFilterGetLogBuilder)? updates]) =>
      (new GFilterGetLogBuilder()..update(updates))._build();

  _$GFilterGetLog._(
      {this.blockNumber,
      this.logIdx,
      this.typeId,
      this.typeName,
      this.blockDatetime,
      this.blockDatetimeLt,
      this.blockDatetimeLte,
      this.blockDatetimeGt,
      this.blockDatetimeGte,
      this.blockHash,
      this.specName,
      this.specVersion,
      this.complete,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetLog rebuild(void Function(GFilterGetLogBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetLogBuilder toBuilder() => new GFilterGetLogBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetLog &&
        blockNumber == other.blockNumber &&
        logIdx == other.logIdx &&
        typeId == other.typeId &&
        typeName == other.typeName &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeLte == other.blockDatetimeLte &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockHash == other.blockHash &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        complete == other.complete &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    blockNumber
                                                                        .hashCode),
                                                                logIdx
                                                                    .hashCode),
                                                            typeId.hashCode),
                                                        typeName.hashCode),
                                                    blockDatetime.hashCode),
                                                blockDatetimeLt.hashCode),
                                            blockDatetimeLte.hashCode),
                                        blockDatetimeGt.hashCode),
                                    blockDatetimeGte.hashCode),
                                blockHash.hashCode),
                            specName.hashCode),
                        specVersion.hashCode),
                    complete.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetLog')
          ..add('blockNumber', blockNumber)
          ..add('logIdx', logIdx)
          ..add('typeId', typeId)
          ..add('typeName', typeName)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockHash', blockHash)
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('complete', complete)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetLogBuilder
    implements Builder<GFilterGetLog, GFilterGetLogBuilder> {
  _$GFilterGetLog? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _logIdx;
  String? get logIdx => _$this._logIdx;
  set logIdx(String? logIdx) => _$this._logIdx = logIdx;

  int? _typeId;
  int? get typeId => _$this._typeId;
  set typeId(int? typeId) => _$this._typeId = typeId;

  String? _typeName;
  String? get typeName => _$this._typeName;
  set typeName(String? typeName) => _$this._typeName = typeName;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  String? _blockHash;
  String? get blockHash => _$this._blockHash;
  set blockHash(String? blockHash) => _$this._blockHash = blockHash;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  int? _specVersion;
  int? get specVersion => _$this._specVersion;
  set specVersion(int? specVersion) => _$this._specVersion = specVersion;

  bool? _complete;
  bool? get complete => _$this._complete;
  set complete(bool? complete) => _$this._complete = complete;

  ListBuilder<GFilterGetLog>? _and;
  ListBuilder<GFilterGetLog> get and =>
      _$this._and ??= new ListBuilder<GFilterGetLog>();
  set and(ListBuilder<GFilterGetLog>? and) => _$this._and = and;

  ListBuilder<GFilterGetLog>? _or;
  ListBuilder<GFilterGetLog> get or =>
      _$this._or ??= new ListBuilder<GFilterGetLog>();
  set or(ListBuilder<GFilterGetLog>? or) => _$this._or = or;

  GFilterGetLogBuilder? _not;
  GFilterGetLogBuilder get not => _$this._not ??= new GFilterGetLogBuilder();
  set not(GFilterGetLogBuilder? not) => _$this._not = not;

  GFilterGetLogBuilder();

  GFilterGetLogBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _logIdx = $v.logIdx;
      _typeId = $v.typeId;
      _typeName = $v.typeName;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockHash = $v.blockHash;
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _complete = $v.complete;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetLog other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetLog;
  }

  @override
  void update(void Function(GFilterGetLogBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetLog build() => _build();

  _$GFilterGetLog _build() {
    _$GFilterGetLog _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetLog._(
              blockNumber: blockNumber,
              logIdx: logIdx,
              typeId: typeId,
              typeName: typeName,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockHash: blockHash,
              specName: specName,
              specVersion: specVersion,
              complete: complete,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();

        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetLog', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetLogs extends GFilterGetLogs {
  @override
  final String? blockNumber;
  @override
  final int? typeId;
  @override
  final String? typeName;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final String? blockHash;
  @override
  final String? specName;
  @override
  final int? specVersion;
  @override
  final bool? complete;
  @override
  final BuiltList<GFilterGetLogs>? and;
  @override
  final BuiltList<GFilterGetLogs>? or;
  @override
  final GFilterGetLogs? not;

  factory _$GFilterGetLogs([void Function(GFilterGetLogsBuilder)? updates]) =>
      (new GFilterGetLogsBuilder()..update(updates))._build();

  _$GFilterGetLogs._(
      {this.blockNumber,
      this.typeId,
      this.typeName,
      this.blockDatetime,
      this.blockDatetimeLt,
      this.blockDatetimeLte,
      this.blockDatetimeGt,
      this.blockDatetimeGte,
      this.blockHash,
      this.specName,
      this.specVersion,
      this.complete,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetLogs rebuild(void Function(GFilterGetLogsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetLogsBuilder toBuilder() =>
      new GFilterGetLogsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetLogs &&
        blockNumber == other.blockNumber &&
        typeId == other.typeId &&
        typeName == other.typeName &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeLte == other.blockDatetimeLte &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockHash == other.blockHash &&
        specName == other.specName &&
        specVersion == other.specVersion &&
        complete == other.complete &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                blockNumber
                                                                    .hashCode),
                                                            typeId.hashCode),
                                                        typeName.hashCode),
                                                    blockDatetime.hashCode),
                                                blockDatetimeLt.hashCode),
                                            blockDatetimeLte.hashCode),
                                        blockDatetimeGt.hashCode),
                                    blockDatetimeGte.hashCode),
                                blockHash.hashCode),
                            specName.hashCode),
                        specVersion.hashCode),
                    complete.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetLogs')
          ..add('blockNumber', blockNumber)
          ..add('typeId', typeId)
          ..add('typeName', typeName)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockHash', blockHash)
          ..add('specName', specName)
          ..add('specVersion', specVersion)
          ..add('complete', complete)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetLogsBuilder
    implements Builder<GFilterGetLogs, GFilterGetLogsBuilder> {
  _$GFilterGetLogs? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  int? _typeId;
  int? get typeId => _$this._typeId;
  set typeId(int? typeId) => _$this._typeId = typeId;

  String? _typeName;
  String? get typeName => _$this._typeName;
  set typeName(String? typeName) => _$this._typeName = typeName;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  String? _blockHash;
  String? get blockHash => _$this._blockHash;
  set blockHash(String? blockHash) => _$this._blockHash = blockHash;

  String? _specName;
  String? get specName => _$this._specName;
  set specName(String? specName) => _$this._specName = specName;

  int? _specVersion;
  int? get specVersion => _$this._specVersion;
  set specVersion(int? specVersion) => _$this._specVersion = specVersion;

  bool? _complete;
  bool? get complete => _$this._complete;
  set complete(bool? complete) => _$this._complete = complete;

  ListBuilder<GFilterGetLogs>? _and;
  ListBuilder<GFilterGetLogs> get and =>
      _$this._and ??= new ListBuilder<GFilterGetLogs>();
  set and(ListBuilder<GFilterGetLogs>? and) => _$this._and = and;

  ListBuilder<GFilterGetLogs>? _or;
  ListBuilder<GFilterGetLogs> get or =>
      _$this._or ??= new ListBuilder<GFilterGetLogs>();
  set or(ListBuilder<GFilterGetLogs>? or) => _$this._or = or;

  GFilterGetLogsBuilder? _not;
  GFilterGetLogsBuilder get not => _$this._not ??= new GFilterGetLogsBuilder();
  set not(GFilterGetLogsBuilder? not) => _$this._not = not;

  GFilterGetLogsBuilder();

  GFilterGetLogsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _typeId = $v.typeId;
      _typeName = $v.typeName;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockHash = $v.blockHash;
      _specName = $v.specName;
      _specVersion = $v.specVersion;
      _complete = $v.complete;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetLogs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetLogs;
  }

  @override
  void update(void Function(GFilterGetLogsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetLogs build() => _build();

  _$GFilterGetLogs _build() {
    _$GFilterGetLogs _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetLogs._(
              blockNumber: blockNumber,
              typeId: typeId,
              typeName: typeName,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockHash: blockHash,
              specName: specName,
              specVersion: specVersion,
              complete: complete,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();

        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetLogs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetTransfer extends GFilterGetTransfer {
  @override
  final String? blockNumber;
  @override
  final String? eventIdx;
  @override
  final int? extrinsicIdx;
  @override
  final String? fromMultiAddressType;
  @override
  final String? fromMultiAddressAccountId;
  @override
  final String? fromMultiAddressAddress32;
  @override
  final String? fromMultiAddressAddress20;
  @override
  final String? toMultiAddressType;
  @override
  final String? toMultiAddressAccountId;
  @override
  final String? toMultiAddressAddress32;
  @override
  final String? toMultiAddressAddress20;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final BuiltList<GFilterGetTransfer>? and;
  @override
  final BuiltList<GFilterGetTransfer>? or;
  @override
  final GFilterGetTransfer? not;

  factory _$GFilterGetTransfer(
          [void Function(GFilterGetTransferBuilder)? updates]) =>
      (new GFilterGetTransferBuilder()..update(updates))._build();

  _$GFilterGetTransfer._(
      {this.blockNumber,
      this.eventIdx,
      this.extrinsicIdx,
      this.fromMultiAddressType,
      this.fromMultiAddressAccountId,
      this.fromMultiAddressAddress32,
      this.fromMultiAddressAddress20,
      this.toMultiAddressType,
      this.toMultiAddressAccountId,
      this.toMultiAddressAddress32,
      this.toMultiAddressAddress20,
      this.blockDatetime,
      this.blockDatetimeLt,
      this.blockDatetimeLte,
      this.blockDatetimeGt,
      this.blockDatetimeGte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetTransfer rebuild(
          void Function(GFilterGetTransferBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetTransferBuilder toBuilder() =>
      new GFilterGetTransferBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetTransfer &&
        blockNumber == other.blockNumber &&
        eventIdx == other.eventIdx &&
        extrinsicIdx == other.extrinsicIdx &&
        fromMultiAddressType == other.fromMultiAddressType &&
        fromMultiAddressAccountId == other.fromMultiAddressAccountId &&
        fromMultiAddressAddress32 == other.fromMultiAddressAddress32 &&
        fromMultiAddressAddress20 == other.fromMultiAddressAddress20 &&
        toMultiAddressType == other.toMultiAddressType &&
        toMultiAddressAccountId == other.toMultiAddressAccountId &&
        toMultiAddressAddress32 == other.toMultiAddressAddress32 &&
        toMultiAddressAddress20 == other.toMultiAddressAddress20 &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeLte == other.blockDatetimeLte &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                blockNumber
                                                                                    .hashCode),
                                                                            eventIdx
                                                                                .hashCode),
                                                                        extrinsicIdx
                                                                            .hashCode),
                                                                    fromMultiAddressType
                                                                        .hashCode),
                                                                fromMultiAddressAccountId
                                                                    .hashCode),
                                                            fromMultiAddressAddress32
                                                                .hashCode),
                                                        fromMultiAddressAddress20
                                                            .hashCode),
                                                    toMultiAddressType
                                                        .hashCode),
                                                toMultiAddressAccountId
                                                    .hashCode),
                                            toMultiAddressAddress32.hashCode),
                                        toMultiAddressAddress20.hashCode),
                                    blockDatetime.hashCode),
                                blockDatetimeLt.hashCode),
                            blockDatetimeLte.hashCode),
                        blockDatetimeGt.hashCode),
                    blockDatetimeGte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetTransfer')
          ..add('blockNumber', blockNumber)
          ..add('eventIdx', eventIdx)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('fromMultiAddressType', fromMultiAddressType)
          ..add('fromMultiAddressAccountId', fromMultiAddressAccountId)
          ..add('fromMultiAddressAddress32', fromMultiAddressAddress32)
          ..add('fromMultiAddressAddress20', fromMultiAddressAddress20)
          ..add('toMultiAddressType', toMultiAddressType)
          ..add('toMultiAddressAccountId', toMultiAddressAccountId)
          ..add('toMultiAddressAddress32', toMultiAddressAddress32)
          ..add('toMultiAddressAddress20', toMultiAddressAddress20)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetTransferBuilder
    implements Builder<GFilterGetTransfer, GFilterGetTransferBuilder> {
  _$GFilterGetTransfer? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _eventIdx;
  String? get eventIdx => _$this._eventIdx;
  set eventIdx(String? eventIdx) => _$this._eventIdx = eventIdx;

  int? _extrinsicIdx;
  int? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(int? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  String? _fromMultiAddressType;
  String? get fromMultiAddressType => _$this._fromMultiAddressType;
  set fromMultiAddressType(String? fromMultiAddressType) =>
      _$this._fromMultiAddressType = fromMultiAddressType;

  String? _fromMultiAddressAccountId;
  String? get fromMultiAddressAccountId => _$this._fromMultiAddressAccountId;
  set fromMultiAddressAccountId(String? fromMultiAddressAccountId) =>
      _$this._fromMultiAddressAccountId = fromMultiAddressAccountId;

  String? _fromMultiAddressAddress32;
  String? get fromMultiAddressAddress32 => _$this._fromMultiAddressAddress32;
  set fromMultiAddressAddress32(String? fromMultiAddressAddress32) =>
      _$this._fromMultiAddressAddress32 = fromMultiAddressAddress32;

  String? _fromMultiAddressAddress20;
  String? get fromMultiAddressAddress20 => _$this._fromMultiAddressAddress20;
  set fromMultiAddressAddress20(String? fromMultiAddressAddress20) =>
      _$this._fromMultiAddressAddress20 = fromMultiAddressAddress20;

  String? _toMultiAddressType;
  String? get toMultiAddressType => _$this._toMultiAddressType;
  set toMultiAddressType(String? toMultiAddressType) =>
      _$this._toMultiAddressType = toMultiAddressType;

  String? _toMultiAddressAccountId;
  String? get toMultiAddressAccountId => _$this._toMultiAddressAccountId;
  set toMultiAddressAccountId(String? toMultiAddressAccountId) =>
      _$this._toMultiAddressAccountId = toMultiAddressAccountId;

  String? _toMultiAddressAddress32;
  String? get toMultiAddressAddress32 => _$this._toMultiAddressAddress32;
  set toMultiAddressAddress32(String? toMultiAddressAddress32) =>
      _$this._toMultiAddressAddress32 = toMultiAddressAddress32;

  String? _toMultiAddressAddress20;
  String? get toMultiAddressAddress20 => _$this._toMultiAddressAddress20;
  set toMultiAddressAddress20(String? toMultiAddressAddress20) =>
      _$this._toMultiAddressAddress20 = toMultiAddressAddress20;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  ListBuilder<GFilterGetTransfer>? _and;
  ListBuilder<GFilterGetTransfer> get and =>
      _$this._and ??= new ListBuilder<GFilterGetTransfer>();
  set and(ListBuilder<GFilterGetTransfer>? and) => _$this._and = and;

  ListBuilder<GFilterGetTransfer>? _or;
  ListBuilder<GFilterGetTransfer> get or =>
      _$this._or ??= new ListBuilder<GFilterGetTransfer>();
  set or(ListBuilder<GFilterGetTransfer>? or) => _$this._or = or;

  GFilterGetTransferBuilder? _not;
  GFilterGetTransferBuilder get not =>
      _$this._not ??= new GFilterGetTransferBuilder();
  set not(GFilterGetTransferBuilder? not) => _$this._not = not;

  GFilterGetTransferBuilder();

  GFilterGetTransferBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _eventIdx = $v.eventIdx;
      _extrinsicIdx = $v.extrinsicIdx;
      _fromMultiAddressType = $v.fromMultiAddressType;
      _fromMultiAddressAccountId = $v.fromMultiAddressAccountId;
      _fromMultiAddressAddress32 = $v.fromMultiAddressAddress32;
      _fromMultiAddressAddress20 = $v.fromMultiAddressAddress20;
      _toMultiAddressType = $v.toMultiAddressType;
      _toMultiAddressAccountId = $v.toMultiAddressAccountId;
      _toMultiAddressAddress32 = $v.toMultiAddressAddress32;
      _toMultiAddressAddress20 = $v.toMultiAddressAddress20;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetTransfer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetTransfer;
  }

  @override
  void update(void Function(GFilterGetTransferBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetTransfer build() => _build();

  _$GFilterGetTransfer _build() {
    _$GFilterGetTransfer _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetTransfer._(
              blockNumber: blockNumber,
              eventIdx: eventIdx,
              extrinsicIdx: extrinsicIdx,
              fromMultiAddressType: fromMultiAddressType,
              fromMultiAddressAccountId: fromMultiAddressAccountId,
              fromMultiAddressAddress32: fromMultiAddressAddress32,
              fromMultiAddressAddress20: fromMultiAddressAddress20,
              toMultiAddressType: toMultiAddressType,
              toMultiAddressAccountId: toMultiAddressAccountId,
              toMultiAddressAddress32: toMultiAddressAddress32,
              toMultiAddressAddress20: toMultiAddressAddress20,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetTransfer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetTransfers extends GFilterGetTransfers {
  @override
  final String? blockNumber;
  @override
  final String? eventIdx;
  @override
  final int? extrinsicIdx;
  @override
  final String? fromMultiAddressType;
  @override
  final String? fromMultiAddressAccountId;
  @override
  final String? fromMultiAddressAddress32;
  @override
  final String? fromMultiAddressAddress20;
  @override
  final String? toMultiAddressType;
  @override
  final String? toMultiAddressAccountId;
  @override
  final String? toMultiAddressAddress32;
  @override
  final String? toMultiAddressAddress20;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final BuiltList<GFilterGetTransfers>? and;
  @override
  final BuiltList<GFilterGetTransfers>? or;
  @override
  final GFilterGetTransfers? not;

  factory _$GFilterGetTransfers(
          [void Function(GFilterGetTransfersBuilder)? updates]) =>
      (new GFilterGetTransfersBuilder()..update(updates))._build();

  _$GFilterGetTransfers._(
      {this.blockNumber,
      this.eventIdx,
      this.extrinsicIdx,
      this.fromMultiAddressType,
      this.fromMultiAddressAccountId,
      this.fromMultiAddressAddress32,
      this.fromMultiAddressAddress20,
      this.toMultiAddressType,
      this.toMultiAddressAccountId,
      this.toMultiAddressAddress32,
      this.toMultiAddressAddress20,
      this.blockDatetime,
      this.blockDatetimeLt,
      this.blockDatetimeLte,
      this.blockDatetimeGt,
      this.blockDatetimeGte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GFilterGetTransfers rebuild(
          void Function(GFilterGetTransfersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetTransfersBuilder toBuilder() =>
      new GFilterGetTransfersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetTransfers &&
        blockNumber == other.blockNumber &&
        eventIdx == other.eventIdx &&
        extrinsicIdx == other.extrinsicIdx &&
        fromMultiAddressType == other.fromMultiAddressType &&
        fromMultiAddressAccountId == other.fromMultiAddressAccountId &&
        fromMultiAddressAddress32 == other.fromMultiAddressAddress32 &&
        fromMultiAddressAddress20 == other.fromMultiAddressAddress20 &&
        toMultiAddressType == other.toMultiAddressType &&
        toMultiAddressAccountId == other.toMultiAddressAccountId &&
        toMultiAddressAddress32 == other.toMultiAddressAddress32 &&
        toMultiAddressAddress20 == other.toMultiAddressAddress20 &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeLte == other.blockDatetimeLte &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                blockNumber
                                                                                    .hashCode),
                                                                            eventIdx
                                                                                .hashCode),
                                                                        extrinsicIdx
                                                                            .hashCode),
                                                                    fromMultiAddressType
                                                                        .hashCode),
                                                                fromMultiAddressAccountId
                                                                    .hashCode),
                                                            fromMultiAddressAddress32
                                                                .hashCode),
                                                        fromMultiAddressAddress20
                                                            .hashCode),
                                                    toMultiAddressType
                                                        .hashCode),
                                                toMultiAddressAccountId
                                                    .hashCode),
                                            toMultiAddressAddress32.hashCode),
                                        toMultiAddressAddress20.hashCode),
                                    blockDatetime.hashCode),
                                blockDatetimeLt.hashCode),
                            blockDatetimeLte.hashCode),
                        blockDatetimeGt.hashCode),
                    blockDatetimeGte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetTransfers')
          ..add('blockNumber', blockNumber)
          ..add('eventIdx', eventIdx)
          ..add('extrinsicIdx', extrinsicIdx)
          ..add('fromMultiAddressType', fromMultiAddressType)
          ..add('fromMultiAddressAccountId', fromMultiAddressAccountId)
          ..add('fromMultiAddressAddress32', fromMultiAddressAddress32)
          ..add('fromMultiAddressAddress20', fromMultiAddressAddress20)
          ..add('toMultiAddressType', toMultiAddressType)
          ..add('toMultiAddressAccountId', toMultiAddressAccountId)
          ..add('toMultiAddressAddress32', toMultiAddressAddress32)
          ..add('toMultiAddressAddress20', toMultiAddressAddress20)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetTransfersBuilder
    implements Builder<GFilterGetTransfers, GFilterGetTransfersBuilder> {
  _$GFilterGetTransfers? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _eventIdx;
  String? get eventIdx => _$this._eventIdx;
  set eventIdx(String? eventIdx) => _$this._eventIdx = eventIdx;

  int? _extrinsicIdx;
  int? get extrinsicIdx => _$this._extrinsicIdx;
  set extrinsicIdx(int? extrinsicIdx) => _$this._extrinsicIdx = extrinsicIdx;

  String? _fromMultiAddressType;
  String? get fromMultiAddressType => _$this._fromMultiAddressType;
  set fromMultiAddressType(String? fromMultiAddressType) =>
      _$this._fromMultiAddressType = fromMultiAddressType;

  String? _fromMultiAddressAccountId;
  String? get fromMultiAddressAccountId => _$this._fromMultiAddressAccountId;
  set fromMultiAddressAccountId(String? fromMultiAddressAccountId) =>
      _$this._fromMultiAddressAccountId = fromMultiAddressAccountId;

  String? _fromMultiAddressAddress32;
  String? get fromMultiAddressAddress32 => _$this._fromMultiAddressAddress32;
  set fromMultiAddressAddress32(String? fromMultiAddressAddress32) =>
      _$this._fromMultiAddressAddress32 = fromMultiAddressAddress32;

  String? _fromMultiAddressAddress20;
  String? get fromMultiAddressAddress20 => _$this._fromMultiAddressAddress20;
  set fromMultiAddressAddress20(String? fromMultiAddressAddress20) =>
      _$this._fromMultiAddressAddress20 = fromMultiAddressAddress20;

  String? _toMultiAddressType;
  String? get toMultiAddressType => _$this._toMultiAddressType;
  set toMultiAddressType(String? toMultiAddressType) =>
      _$this._toMultiAddressType = toMultiAddressType;

  String? _toMultiAddressAccountId;
  String? get toMultiAddressAccountId => _$this._toMultiAddressAccountId;
  set toMultiAddressAccountId(String? toMultiAddressAccountId) =>
      _$this._toMultiAddressAccountId = toMultiAddressAccountId;

  String? _toMultiAddressAddress32;
  String? get toMultiAddressAddress32 => _$this._toMultiAddressAddress32;
  set toMultiAddressAddress32(String? toMultiAddressAddress32) =>
      _$this._toMultiAddressAddress32 = toMultiAddressAddress32;

  String? _toMultiAddressAddress20;
  String? get toMultiAddressAddress20 => _$this._toMultiAddressAddress20;
  set toMultiAddressAddress20(String? toMultiAddressAddress20) =>
      _$this._toMultiAddressAddress20 = toMultiAddressAddress20;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  ListBuilder<GFilterGetTransfers>? _and;
  ListBuilder<GFilterGetTransfers> get and =>
      _$this._and ??= new ListBuilder<GFilterGetTransfers>();
  set and(ListBuilder<GFilterGetTransfers>? and) => _$this._and = and;

  ListBuilder<GFilterGetTransfers>? _or;
  ListBuilder<GFilterGetTransfers> get or =>
      _$this._or ??= new ListBuilder<GFilterGetTransfers>();
  set or(ListBuilder<GFilterGetTransfers>? or) => _$this._or = or;

  GFilterGetTransfersBuilder? _not;
  GFilterGetTransfersBuilder get not =>
      _$this._not ??= new GFilterGetTransfersBuilder();
  set not(GFilterGetTransfersBuilder? not) => _$this._not = not;

  GFilterGetTransfersBuilder();

  GFilterGetTransfersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _eventIdx = $v.eventIdx;
      _extrinsicIdx = $v.extrinsicIdx;
      _fromMultiAddressType = $v.fromMultiAddressType;
      _fromMultiAddressAccountId = $v.fromMultiAddressAccountId;
      _fromMultiAddressAddress32 = $v.fromMultiAddressAddress32;
      _fromMultiAddressAddress20 = $v.fromMultiAddressAddress20;
      _toMultiAddressType = $v.toMultiAddressType;
      _toMultiAddressAccountId = $v.toMultiAddressAccountId;
      _toMultiAddressAddress32 = $v.toMultiAddressAddress32;
      _toMultiAddressAddress20 = $v.toMultiAddressAddress20;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetTransfers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetTransfers;
  }

  @override
  void update(void Function(GFilterGetTransfersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetTransfers build() => _build();

  _$GFilterGetTransfers _build() {
    _$GFilterGetTransfers _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetTransfers._(
              blockNumber: blockNumber,
              eventIdx: eventIdx,
              extrinsicIdx: extrinsicIdx,
              fromMultiAddressType: fromMultiAddressType,
              fromMultiAddressAccountId: fromMultiAddressAccountId,
              fromMultiAddressAddress32: fromMultiAddressAddress32,
              fromMultiAddressAddress20: fromMultiAddressAddress20,
              toMultiAddressType: toMultiAddressType,
              toMultiAddressAccountId: toMultiAddressAccountId,
              toMultiAddressAddress32: toMultiAddressAddress32,
              toMultiAddressAddress20: toMultiAddressAddress20,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetTransfers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFilterGetTaggedAccount extends GFilterGetTaggedAccount {
  @override
  final String? accountId;
  @override
  final BuiltList<GFilterGetTaggedAccount>? and;
  @override
  final BuiltList<GFilterGetTaggedAccount>? or;
  @override
  final GFilterGetTaggedAccount? not;

  factory _$GFilterGetTaggedAccount(
          [void Function(GFilterGetTaggedAccountBuilder)? updates]) =>
      (new GFilterGetTaggedAccountBuilder()..update(updates))._build();

  _$GFilterGetTaggedAccount._({this.accountId, this.and, this.or, this.not})
      : super._();

  @override
  GFilterGetTaggedAccount rebuild(
          void Function(GFilterGetTaggedAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFilterGetTaggedAccountBuilder toBuilder() =>
      new GFilterGetTaggedAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFilterGetTaggedAccount &&
        accountId == other.accountId &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, accountId.hashCode), and.hashCode), or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFilterGetTaggedAccount')
          ..add('accountId', accountId)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GFilterGetTaggedAccountBuilder
    implements
        Builder<GFilterGetTaggedAccount, GFilterGetTaggedAccountBuilder> {
  _$GFilterGetTaggedAccount? _$v;

  String? _accountId;
  String? get accountId => _$this._accountId;
  set accountId(String? accountId) => _$this._accountId = accountId;

  ListBuilder<GFilterGetTaggedAccount>? _and;
  ListBuilder<GFilterGetTaggedAccount> get and =>
      _$this._and ??= new ListBuilder<GFilterGetTaggedAccount>();
  set and(ListBuilder<GFilterGetTaggedAccount>? and) => _$this._and = and;

  ListBuilder<GFilterGetTaggedAccount>? _or;
  ListBuilder<GFilterGetTaggedAccount> get or =>
      _$this._or ??= new ListBuilder<GFilterGetTaggedAccount>();
  set or(ListBuilder<GFilterGetTaggedAccount>? or) => _$this._or = or;

  GFilterGetTaggedAccountBuilder? _not;
  GFilterGetTaggedAccountBuilder get not =>
      _$this._not ??= new GFilterGetTaggedAccountBuilder();
  set not(GFilterGetTaggedAccountBuilder? not) => _$this._not = not;

  GFilterGetTaggedAccountBuilder();

  GFilterGetTaggedAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountId = $v.accountId;
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFilterGetTaggedAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFilterGetTaggedAccount;
  }

  @override
  void update(void Function(GFilterGetTaggedAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFilterGetTaggedAccount build() => _build();

  _$GFilterGetTaggedAccount _build() {
    _$GFilterGetTaggedAccount _$result;
    try {
      _$result = _$v ??
          new _$GFilterGetTaggedAccount._(
              accountId: accountId,
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFilterGetTaggedAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GEventsFilter extends GEventsFilter {
  @override
  final String? blockNumber;
  @override
  final String? eventModule;
  @override
  final String? eventName;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final BuiltList<GEventsFilter>? and;
  @override
  final BuiltList<GEventsFilter>? or;
  @override
  final GEventsFilter? not;

  factory _$GEventsFilter([void Function(GEventsFilterBuilder)? updates]) =>
      (new GEventsFilterBuilder()..update(updates))._build();

  _$GEventsFilter._(
      {this.blockNumber,
      this.eventModule,
      this.eventName,
      this.blockDatetime,
      this.blockDatetimeGt,
      this.blockDatetimeLt,
      this.blockDatetimeGte,
      this.blockDatetimeLte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GEventsFilter rebuild(void Function(GEventsFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEventsFilterBuilder toBuilder() => new GEventsFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEventsFilter &&
        blockNumber == other.blockNumber &&
        eventModule == other.eventModule &&
        eventName == other.eventName &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockDatetimeLte == other.blockDatetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, blockNumber.hashCode),
                                            eventModule.hashCode),
                                        eventName.hashCode),
                                    blockDatetime.hashCode),
                                blockDatetimeGt.hashCode),
                            blockDatetimeLt.hashCode),
                        blockDatetimeGte.hashCode),
                    blockDatetimeLte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GEventsFilter')
          ..add('blockNumber', blockNumber)
          ..add('eventModule', eventModule)
          ..add('eventName', eventName)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GEventsFilterBuilder
    implements Builder<GEventsFilter, GEventsFilterBuilder> {
  _$GEventsFilter? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _eventModule;
  String? get eventModule => _$this._eventModule;
  set eventModule(String? eventModule) => _$this._eventModule = eventModule;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  ListBuilder<GEventsFilter>? _and;
  ListBuilder<GEventsFilter> get and =>
      _$this._and ??= new ListBuilder<GEventsFilter>();
  set and(ListBuilder<GEventsFilter>? and) => _$this._and = and;

  ListBuilder<GEventsFilter>? _or;
  ListBuilder<GEventsFilter> get or =>
      _$this._or ??= new ListBuilder<GEventsFilter>();
  set or(ListBuilder<GEventsFilter>? or) => _$this._or = or;

  GEventsFilterBuilder? _not;
  GEventsFilterBuilder get not => _$this._not ??= new GEventsFilterBuilder();
  set not(GEventsFilterBuilder? not) => _$this._not = not;

  GEventsFilterBuilder();

  GEventsFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _eventModule = $v.eventModule;
      _eventName = $v.eventName;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEventsFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEventsFilter;
  }

  @override
  void update(void Function(GEventsFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEventsFilter build() => _build();

  _$GEventsFilter _build() {
    _$GEventsFilter _$result;
    try {
      _$result = _$v ??
          new _$GEventsFilter._(
              blockNumber: blockNumber,
              eventModule: eventModule,
              eventName: eventName,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GEventsFilter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTransferFilter extends GTransferFilter {
  @override
  final String? blockNumber;
  @override
  final String? eventIdx;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final BuiltList<GTransferFilter>? and;
  @override
  final BuiltList<GTransferFilter>? or;
  @override
  final GTransferFilter? not;
  @override
  final String? fromMultiAddressAccountId;
  @override
  final String? toMultiAddressAccountId;

  factory _$GTransferFilter([void Function(GTransferFilterBuilder)? updates]) =>
      (new GTransferFilterBuilder()..update(updates))._build();

  _$GTransferFilter._(
      {this.blockNumber,
      this.eventIdx,
      this.blockDatetime,
      this.blockDatetimeGt,
      this.blockDatetimeLt,
      this.blockDatetimeGte,
      this.blockDatetimeLte,
      this.and,
      this.or,
      this.not,
      this.fromMultiAddressAccountId,
      this.toMultiAddressAccountId})
      : super._();

  @override
  GTransferFilter rebuild(void Function(GTransferFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTransferFilterBuilder toBuilder() =>
      new GTransferFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTransferFilter &&
        blockNumber == other.blockNumber &&
        eventIdx == other.eventIdx &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockDatetimeLte == other.blockDatetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not &&
        fromMultiAddressAccountId == other.fromMultiAddressAccountId &&
        toMultiAddressAccountId == other.toMultiAddressAccountId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, blockNumber.hashCode),
                                                eventIdx.hashCode),
                                            blockDatetime.hashCode),
                                        blockDatetimeGt.hashCode),
                                    blockDatetimeLt.hashCode),
                                blockDatetimeGte.hashCode),
                            blockDatetimeLte.hashCode),
                        and.hashCode),
                    or.hashCode),
                not.hashCode),
            fromMultiAddressAccountId.hashCode),
        toMultiAddressAccountId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTransferFilter')
          ..add('blockNumber', blockNumber)
          ..add('eventIdx', eventIdx)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not)
          ..add('fromMultiAddressAccountId', fromMultiAddressAccountId)
          ..add('toMultiAddressAccountId', toMultiAddressAccountId))
        .toString();
  }
}

class GTransferFilterBuilder
    implements Builder<GTransferFilter, GTransferFilterBuilder> {
  _$GTransferFilter? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _eventIdx;
  String? get eventIdx => _$this._eventIdx;
  set eventIdx(String? eventIdx) => _$this._eventIdx = eventIdx;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  ListBuilder<GTransferFilter>? _and;
  ListBuilder<GTransferFilter> get and =>
      _$this._and ??= new ListBuilder<GTransferFilter>();
  set and(ListBuilder<GTransferFilter>? and) => _$this._and = and;

  ListBuilder<GTransferFilter>? _or;
  ListBuilder<GTransferFilter> get or =>
      _$this._or ??= new ListBuilder<GTransferFilter>();
  set or(ListBuilder<GTransferFilter>? or) => _$this._or = or;

  GTransferFilterBuilder? _not;
  GTransferFilterBuilder get not =>
      _$this._not ??= new GTransferFilterBuilder();
  set not(GTransferFilterBuilder? not) => _$this._not = not;

  String? _fromMultiAddressAccountId;
  String? get fromMultiAddressAccountId => _$this._fromMultiAddressAccountId;
  set fromMultiAddressAccountId(String? fromMultiAddressAccountId) =>
      _$this._fromMultiAddressAccountId = fromMultiAddressAccountId;

  String? _toMultiAddressAccountId;
  String? get toMultiAddressAccountId => _$this._toMultiAddressAccountId;
  set toMultiAddressAccountId(String? toMultiAddressAccountId) =>
      _$this._toMultiAddressAccountId = toMultiAddressAccountId;

  GTransferFilterBuilder();

  GTransferFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _eventIdx = $v.eventIdx;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _fromMultiAddressAccountId = $v.fromMultiAddressAccountId;
      _toMultiAddressAccountId = $v.toMultiAddressAccountId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTransferFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTransferFilter;
  }

  @override
  void update(void Function(GTransferFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTransferFilter build() => _build();

  _$GTransferFilter _build() {
    _$GTransferFilter _$result;
    try {
      _$result = _$v ??
          new _$GTransferFilter._(
              blockNumber: blockNumber,
              eventIdx: eventIdx,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build(),
              fromMultiAddressAccountId: fromMultiAddressAccountId,
              toMultiAddressAccountId: toMultiAddressAccountId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTransferFilter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GLogFilter extends GLogFilter {
  @override
  final String? blockNumber;
  @override
  final String? logIdx;
  @override
  final int? typeId;
  @override
  final GDateTime? blockDatetime;
  @override
  final GDateTime? blockDatetimeGt;
  @override
  final GDateTime? blockDatetimeLt;
  @override
  final GDateTime? blockDatetimeGte;
  @override
  final GDateTime? blockDatetimeLte;
  @override
  final BuiltList<GLogFilter>? and;
  @override
  final BuiltList<GLogFilter>? or;
  @override
  final GLogFilter? not;

  factory _$GLogFilter([void Function(GLogFilterBuilder)? updates]) =>
      (new GLogFilterBuilder()..update(updates))._build();

  _$GLogFilter._(
      {this.blockNumber,
      this.logIdx,
      this.typeId,
      this.blockDatetime,
      this.blockDatetimeGt,
      this.blockDatetimeLt,
      this.blockDatetimeGte,
      this.blockDatetimeLte,
      this.and,
      this.or,
      this.not})
      : super._();

  @override
  GLogFilter rebuild(void Function(GLogFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLogFilterBuilder toBuilder() => new GLogFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLogFilter &&
        blockNumber == other.blockNumber &&
        logIdx == other.logIdx &&
        typeId == other.typeId &&
        blockDatetime == other.blockDatetime &&
        blockDatetimeGt == other.blockDatetimeGt &&
        blockDatetimeLt == other.blockDatetimeLt &&
        blockDatetimeGte == other.blockDatetimeGte &&
        blockDatetimeLte == other.blockDatetimeLte &&
        and == other.and &&
        or == other.or &&
        not == other.not;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, blockNumber.hashCode),
                                            logIdx.hashCode),
                                        typeId.hashCode),
                                    blockDatetime.hashCode),
                                blockDatetimeGt.hashCode),
                            blockDatetimeLt.hashCode),
                        blockDatetimeGte.hashCode),
                    blockDatetimeLte.hashCode),
                and.hashCode),
            or.hashCode),
        not.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GLogFilter')
          ..add('blockNumber', blockNumber)
          ..add('logIdx', logIdx)
          ..add('typeId', typeId)
          ..add('blockDatetime', blockDatetime)
          ..add('blockDatetimeGt', blockDatetimeGt)
          ..add('blockDatetimeLt', blockDatetimeLt)
          ..add('blockDatetimeGte', blockDatetimeGte)
          ..add('blockDatetimeLte', blockDatetimeLte)
          ..add('and', and)
          ..add('or', or)
          ..add('not', not))
        .toString();
  }
}

class GLogFilterBuilder implements Builder<GLogFilter, GLogFilterBuilder> {
  _$GLogFilter? _$v;

  String? _blockNumber;
  String? get blockNumber => _$this._blockNumber;
  set blockNumber(String? blockNumber) => _$this._blockNumber = blockNumber;

  String? _logIdx;
  String? get logIdx => _$this._logIdx;
  set logIdx(String? logIdx) => _$this._logIdx = logIdx;

  int? _typeId;
  int? get typeId => _$this._typeId;
  set typeId(int? typeId) => _$this._typeId = typeId;

  GDateTimeBuilder? _blockDatetime;
  GDateTimeBuilder get blockDatetime =>
      _$this._blockDatetime ??= new GDateTimeBuilder();
  set blockDatetime(GDateTimeBuilder? blockDatetime) =>
      _$this._blockDatetime = blockDatetime;

  GDateTimeBuilder? _blockDatetimeGt;
  GDateTimeBuilder get blockDatetimeGt =>
      _$this._blockDatetimeGt ??= new GDateTimeBuilder();
  set blockDatetimeGt(GDateTimeBuilder? blockDatetimeGt) =>
      _$this._blockDatetimeGt = blockDatetimeGt;

  GDateTimeBuilder? _blockDatetimeLt;
  GDateTimeBuilder get blockDatetimeLt =>
      _$this._blockDatetimeLt ??= new GDateTimeBuilder();
  set blockDatetimeLt(GDateTimeBuilder? blockDatetimeLt) =>
      _$this._blockDatetimeLt = blockDatetimeLt;

  GDateTimeBuilder? _blockDatetimeGte;
  GDateTimeBuilder get blockDatetimeGte =>
      _$this._blockDatetimeGte ??= new GDateTimeBuilder();
  set blockDatetimeGte(GDateTimeBuilder? blockDatetimeGte) =>
      _$this._blockDatetimeGte = blockDatetimeGte;

  GDateTimeBuilder? _blockDatetimeLte;
  GDateTimeBuilder get blockDatetimeLte =>
      _$this._blockDatetimeLte ??= new GDateTimeBuilder();
  set blockDatetimeLte(GDateTimeBuilder? blockDatetimeLte) =>
      _$this._blockDatetimeLte = blockDatetimeLte;

  ListBuilder<GLogFilter>? _and;
  ListBuilder<GLogFilter> get and =>
      _$this._and ??= new ListBuilder<GLogFilter>();
  set and(ListBuilder<GLogFilter>? and) => _$this._and = and;

  ListBuilder<GLogFilter>? _or;
  ListBuilder<GLogFilter> get or =>
      _$this._or ??= new ListBuilder<GLogFilter>();
  set or(ListBuilder<GLogFilter>? or) => _$this._or = or;

  GLogFilterBuilder? _not;
  GLogFilterBuilder get not => _$this._not ??= new GLogFilterBuilder();
  set not(GLogFilterBuilder? not) => _$this._not = not;

  GLogFilterBuilder();

  GLogFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockNumber = $v.blockNumber;
      _logIdx = $v.logIdx;
      _typeId = $v.typeId;
      _blockDatetime = $v.blockDatetime?.toBuilder();
      _blockDatetimeGt = $v.blockDatetimeGt?.toBuilder();
      _blockDatetimeLt = $v.blockDatetimeLt?.toBuilder();
      _blockDatetimeGte = $v.blockDatetimeGte?.toBuilder();
      _blockDatetimeLte = $v.blockDatetimeLte?.toBuilder();
      _and = $v.and?.toBuilder();
      _or = $v.or?.toBuilder();
      _not = $v.not?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLogFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLogFilter;
  }

  @override
  void update(void Function(GLogFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLogFilter build() => _build();

  _$GLogFilter _build() {
    _$GLogFilter _$result;
    try {
      _$result = _$v ??
          new _$GLogFilter._(
              blockNumber: blockNumber,
              logIdx: logIdx,
              typeId: typeId,
              blockDatetime: _blockDatetime?.build(),
              blockDatetimeGt: _blockDatetimeGt?.build(),
              blockDatetimeLt: _blockDatetimeLt?.build(),
              blockDatetimeGte: _blockDatetimeGte?.build(),
              blockDatetimeLte: _blockDatetimeLte?.build(),
              and: _and?.build(),
              or: _or?.build(),
              not: _not?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockDatetime';
        _blockDatetime?.build();
        _$failedField = 'blockDatetimeGt';
        _blockDatetimeGt?.build();
        _$failedField = 'blockDatetimeLt';
        _blockDatetimeLt?.build();
        _$failedField = 'blockDatetimeGte';
        _blockDatetimeGte?.build();
        _$failedField = 'blockDatetimeLte';
        _blockDatetimeLte?.build();
        _$failedField = 'and';
        _and?.build();
        _$failedField = 'or';
        _or?.build();
        _$failedField = 'not';
        _not?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GLogFilter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
