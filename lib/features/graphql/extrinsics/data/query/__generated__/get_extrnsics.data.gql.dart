// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:threedpass/core/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:threedpass/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
    as _i2;

part 'get_extrnsics.data.gql.g.dart';

abstract class GGetExtrinsicsData
    implements Built<GGetExtrinsicsData, GGetExtrinsicsDataBuilder> {
  GGetExtrinsicsData._();

  factory GGetExtrinsicsData(
          [void Function(GGetExtrinsicsDataBuilder b) updates]) =
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
          [void Function(GGetExtrinsicsData_getExtrinsicsBuilder b) updates]) =
      _$GGetExtrinsicsData_getExtrinsics;

  static void _initializeBuilder(GGetExtrinsicsData_getExtrinsicsBuilder b) =>
      b..G__typename = 'PaginatedGetExtrinsics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetExtrinsicsData_getExtrinsics_pageInfo? get pageInfo;
  BuiltList<GGetExtrinsicsData_getExtrinsics_objects?>? get objects;
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
      [void Function(GGetExtrinsicsData_getExtrinsics_pageInfoBuilder b)
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
      [void Function(GGetExtrinsicsData_getExtrinsics_objectsBuilder b)
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
