// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:threedp_graphql/core/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:threedp_graphql/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
    as _i2;

part 'get_tokens_events.data.gql.g.dart';

abstract class GGetEventsData
    implements Built<GGetEventsData, GGetEventsDataBuilder> {
  GGetEventsData._();

  factory GGetEventsData([Function(GGetEventsDataBuilder b) updates]) =
      _$GGetEventsData;

  static void _initializeBuilder(GGetEventsDataBuilder b) =>
      b..G__typename = 'GraphQLQueries';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetEventsData_getEvents? get getEvents;
  static Serializer<GGetEventsData> get serializer =>
      _$gGetEventsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetEventsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetEventsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetEventsData.serializer,
        json,
      );
}

abstract class GGetEventsData_getEvents
    implements
        Built<GGetEventsData_getEvents, GGetEventsData_getEventsBuilder> {
  GGetEventsData_getEvents._();

  factory GGetEventsData_getEvents(
          [Function(GGetEventsData_getEventsBuilder b) updates]) =
      _$GGetEventsData_getEvents;

  static void _initializeBuilder(GGetEventsData_getEventsBuilder b) =>
      b..G__typename = 'PaginatedGetEvents';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetEventsData_getEvents_pageInfo? get pageInfo;
  BuiltList<GGetEventsData_getEvents_objects>? get objects;
  static Serializer<GGetEventsData_getEvents> get serializer =>
      _$gGetEventsDataGetEventsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetEventsData_getEvents.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetEventsData_getEvents? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetEventsData_getEvents.serializer,
        json,
      );
}

abstract class GGetEventsData_getEvents_pageInfo
    implements
        Built<GGetEventsData_getEvents_pageInfo,
            GGetEventsData_getEvents_pageInfoBuilder> {
  GGetEventsData_getEvents_pageInfo._();

  factory GGetEventsData_getEvents_pageInfo(
          [Function(GGetEventsData_getEvents_pageInfoBuilder b) updates]) =
      _$GGetEventsData_getEvents_pageInfo;

  static void _initializeBuilder(GGetEventsData_getEvents_pageInfoBuilder b) =>
      b..G__typename = 'PaginationType';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get pageSize;
  String? get pageNext;
  String? get pagePrev;
  static Serializer<GGetEventsData_getEvents_pageInfo> get serializer =>
      _$gGetEventsDataGetEventsPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetEventsData_getEvents_pageInfo.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetEventsData_getEvents_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetEventsData_getEvents_pageInfo.serializer,
        json,
      );
}

abstract class GGetEventsData_getEvents_objects
    implements
        Built<GGetEventsData_getEvents_objects,
            GGetEventsData_getEvents_objectsBuilder> {
  GGetEventsData_getEvents_objects._();

  factory GGetEventsData_getEvents_objects(
          [Function(GGetEventsData_getEvents_objectsBuilder b) updates]) =
      _$GGetEventsData_getEvents_objects;

  static void _initializeBuilder(GGetEventsData_getEvents_objectsBuilder b) =>
      b..G__typename = 'SchemaGetEvents';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get blockNumber;
  int? get eventIdx;
  int? get extrinsicIdx;
  String? get event;
  String? get eventModule;
  String? get eventName;
  int? get phaseIdx;
  String? get phaseName;
  _i2.GJSONString? get attributes;
  _i2.GJSONString? get topics;
  static Serializer<GGetEventsData_getEvents_objects> get serializer =>
      _$gGetEventsDataGetEventsObjectsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetEventsData_getEvents_objects.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetEventsData_getEvents_objects? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetEventsData_getEvents_objects.serializer,
        json,
      );
}

abstract class GGetExtrinsicsData
    implements Built<GGetExtrinsicsData, GGetExtrinsicsDataBuilder> {
  GGetExtrinsicsData._();

  factory GGetExtrinsicsData([Function(GGetExtrinsicsDataBuilder b) updates]) =
      _$GGetExtrinsicsData;

  static void _initializeBuilder(GGetExtrinsicsDataBuilder b) =>
      b..G__typename = 'GraphQLQueries';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetExtrinsicsData_getExtrinsics? get getExtrinsics;
  static Serializer<GGetExtrinsicsData> get serializer =>
      _$gGetExtrinsicsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetExtrinsicsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetExtrinsicsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetExtrinsicsData.serializer,
        json,
      );
}

abstract class GGetExtrinsicsData_getExtrinsics
    implements
        Built<GGetExtrinsicsData_getExtrinsics,
            GGetExtrinsicsData_getExtrinsicsBuilder> {
  GGetExtrinsicsData_getExtrinsics._();

  factory GGetExtrinsicsData_getExtrinsics(
          [Function(GGetExtrinsicsData_getExtrinsicsBuilder b) updates]) =
      _$GGetExtrinsicsData_getExtrinsics;

  static void _initializeBuilder(GGetExtrinsicsData_getExtrinsicsBuilder b) =>
      b..G__typename = 'PaginatedGetExtrinsics';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetExtrinsicsData_getExtrinsics_pageInfo? get pageInfo;
  BuiltList<GGetExtrinsicsData_getExtrinsics_objects>? get objects;
  static Serializer<GGetExtrinsicsData_getExtrinsics> get serializer =>
      _$gGetExtrinsicsDataGetExtrinsicsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetExtrinsicsData_getExtrinsics.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetExtrinsicsData_getExtrinsics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetExtrinsicsData_getExtrinsics.serializer,
        json,
      );
}

abstract class GGetExtrinsicsData_getExtrinsics_pageInfo
    implements
        Built<GGetExtrinsicsData_getExtrinsics_pageInfo,
            GGetExtrinsicsData_getExtrinsics_pageInfoBuilder> {
  GGetExtrinsicsData_getExtrinsics_pageInfo._();

  factory GGetExtrinsicsData_getExtrinsics_pageInfo(
      [Function(GGetExtrinsicsData_getExtrinsics_pageInfoBuilder b)
          updates]) = _$GGetExtrinsicsData_getExtrinsics_pageInfo;

  static void _initializeBuilder(
          GGetExtrinsicsData_getExtrinsics_pageInfoBuilder b) =>
      b..G__typename = 'PaginationType';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get pageSize;
  String? get pageNext;
  String? get pagePrev;
  static Serializer<GGetExtrinsicsData_getExtrinsics_pageInfo> get serializer =>
      _$gGetExtrinsicsDataGetExtrinsicsPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetExtrinsicsData_getExtrinsics_pageInfo.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetExtrinsicsData_getExtrinsics_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetExtrinsicsData_getExtrinsics_pageInfo.serializer,
        json,
      );
}

abstract class GGetExtrinsicsData_getExtrinsics_objects
    implements
        Built<GGetExtrinsicsData_getExtrinsics_objects,
            GGetExtrinsicsData_getExtrinsics_objectsBuilder> {
  GGetExtrinsicsData_getExtrinsics_objects._();

  factory GGetExtrinsicsData_getExtrinsics_objects(
      [Function(GGetExtrinsicsData_getExtrinsics_objectsBuilder b)
          updates]) = _$GGetExtrinsicsData_getExtrinsics_objects;

  static void _initializeBuilder(
          GGetExtrinsicsData_getExtrinsics_objectsBuilder b) =>
      b..G__typename = 'SchemaGetExtrinsics';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get multiAddressAccountId;
  int? get extrinsicIdx;
  int? get blockNumber;
  String? get callModule;
  String? get callName;
  _i2.GJSONString? get callArguments;
  _i2.GDateTime? get blockDatetime;
  int get complete;
  static Serializer<GGetExtrinsicsData_getExtrinsics_objects> get serializer =>
      _$gGetExtrinsicsDataGetExtrinsicsObjectsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetExtrinsicsData_getExtrinsics_objects.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetExtrinsicsData_getExtrinsics_objects? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetExtrinsicsData_getExtrinsics_objects.serializer,
        json,
      );
}
