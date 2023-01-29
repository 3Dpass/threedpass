// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:threedpass/core/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:threedpass/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
    as _i1;

part 'get_transfers.var.gql.g.dart';

abstract class GGetTransfersVars
    implements Built<GGetTransfersVars, GGetTransfersVarsBuilder> {
  GGetTransfersVars._();

  factory GGetTransfersVars([Function(GGetTransfersVarsBuilder b) updates]) =
      _$GGetTransfersVars;

  String get pageKey;
  int get pageSize;
  _i1.GFilterGetTransfers get filters;
  static Serializer<GGetTransfersVars> get serializer =>
      _$gGetTransfersVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GGetTransfersVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetTransfersVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GGetTransfersVars.serializer,
        json,
      );
}
