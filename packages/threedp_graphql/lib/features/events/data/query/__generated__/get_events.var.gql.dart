// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:threedp_graphql/core/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:threedp_graphql/core/graphql/__generated__/threedpass.schema.schema.gql.dart'
    as _i1;

part 'get_events.var.gql.g.dart';

abstract class GGetEventsVars
    implements Built<GGetEventsVars, GGetEventsVarsBuilder> {
  GGetEventsVars._();

  factory GGetEventsVars([Function(GGetEventsVarsBuilder b) updates]) =
      _$GGetEventsVars;

  String get pageKey;
  int get pageSize;
  _i1.GFilterGetEvents get filters;
  static Serializer<GGetEventsVars> get serializer =>
      _$gGetEventsVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GGetEventsVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetEventsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GGetEventsVars.serializer,
        json,
      );
}
