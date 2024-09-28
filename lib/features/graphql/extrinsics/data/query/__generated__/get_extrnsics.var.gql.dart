// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:threedpass/core/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:threedpass/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
    as _i1;

part 'get_extrnsics.var.gql.g.dart';

abstract class GGetExtrinsicsVars
    implements Built<GGetExtrinsicsVars, GGetExtrinsicsVarsBuilder> {
  GGetExtrinsicsVars._();

  factory GGetExtrinsicsVars(
          [void Function(GGetExtrinsicsVarsBuilder b) updates]) =
      _$GGetExtrinsicsVars;

  String get pageKey;
  int get pageSize;
  _i1.GExtrinsicFilter get filters;
  static Serializer<GGetExtrinsicsVars> get serializer =>
      _$gGetExtrinsicsVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GGetExtrinsicsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetExtrinsicsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GGetExtrinsicsVars.serializer,
        json,
      );
}
