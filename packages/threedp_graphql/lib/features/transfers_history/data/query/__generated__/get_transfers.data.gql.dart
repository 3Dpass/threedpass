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

part 'get_transfers.data.gql.g.dart';

abstract class GGetTransfersData
    implements Built<GGetTransfersData, GGetTransfersDataBuilder> {
  GGetTransfersData._();

  factory GGetTransfersData([Function(GGetTransfersDataBuilder b) updates]) =
      _$GGetTransfersData;

  static void _initializeBuilder(GGetTransfersDataBuilder b) =>
      b..G__typename = 'GraphQLQueries';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetTransfersData_getTransfers? get getTransfers;
  static Serializer<GGetTransfersData> get serializer =>
      _$gGetTransfersDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetTransfersData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetTransfersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetTransfersData.serializer,
        json,
      );
}

abstract class GGetTransfersData_getTransfers
    implements
        Built<GGetTransfersData_getTransfers,
            GGetTransfersData_getTransfersBuilder> {
  GGetTransfersData_getTransfers._();

  factory GGetTransfersData_getTransfers(
          [Function(GGetTransfersData_getTransfersBuilder b) updates]) =
      _$GGetTransfersData_getTransfers;

  static void _initializeBuilder(GGetTransfersData_getTransfersBuilder b) =>
      b..G__typename = 'PaginatedGetTransfers';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetTransfersData_getTransfers_pageInfo? get pageInfo;
  BuiltList<GGetTransfersData_getTransfers_objects>? get objects;
  static Serializer<GGetTransfersData_getTransfers> get serializer =>
      _$gGetTransfersDataGetTransfersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetTransfersData_getTransfers.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetTransfersData_getTransfers? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetTransfersData_getTransfers.serializer,
        json,
      );
}

abstract class GGetTransfersData_getTransfers_pageInfo
    implements
        Built<GGetTransfersData_getTransfers_pageInfo,
            GGetTransfersData_getTransfers_pageInfoBuilder> {
  GGetTransfersData_getTransfers_pageInfo._();

  factory GGetTransfersData_getTransfers_pageInfo(
      [Function(GGetTransfersData_getTransfers_pageInfoBuilder b)
          updates]) = _$GGetTransfersData_getTransfers_pageInfo;

  static void _initializeBuilder(
          GGetTransfersData_getTransfers_pageInfoBuilder b) =>
      b..G__typename = 'PaginationType';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get pageSize;
  String? get pageNext;
  String? get pagePrev;
  static Serializer<GGetTransfersData_getTransfers_pageInfo> get serializer =>
      _$gGetTransfersDataGetTransfersPageInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetTransfersData_getTransfers_pageInfo.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetTransfersData_getTransfers_pageInfo? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetTransfersData_getTransfers_pageInfo.serializer,
        json,
      );
}

abstract class GGetTransfersData_getTransfers_objects
    implements
        Built<GGetTransfersData_getTransfers_objects,
            GGetTransfersData_getTransfers_objectsBuilder> {
  GGetTransfersData_getTransfers_objects._();

  factory GGetTransfersData_getTransfers_objects(
          [Function(GGetTransfersData_getTransfers_objectsBuilder b) updates]) =
      _$GGetTransfersData_getTransfers_objects;

  static void _initializeBuilder(
          GGetTransfersData_getTransfers_objectsBuilder b) =>
      b..G__typename = 'SchemaGetTransfers';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get blockNumber;
  int? get extrinsicIdx;
  int? get eventIdx;
  String? get fromMultiAddressAccountId;
  String? get toMultiAddressAccountId;
  double? get value;
  _i2.GDateTime? get blockDatetime;
  static Serializer<GGetTransfersData_getTransfers_objects> get serializer =>
      _$gGetTransfersDataGetTransfersObjectsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetTransfersData_getTransfers_objects.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetTransfersData_getTransfers_objects? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetTransfersData_getTransfers_objects.serializer,
        json,
      );
}
