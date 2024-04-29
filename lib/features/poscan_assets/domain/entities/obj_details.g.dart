// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obj_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjDetailsPoscanAsset _$ObjDetailsPoscanAssetFromJson(
        Map<String, dynamic> json) =>
    ObjDetailsPoscanAsset(
      maxSupply: json['maxSupply'] as String,
      objIdx: json['objIdx'] as String,
      propIdx: json['propIdx'] as String,
    );

Map<String, dynamic> _$ObjDetailsPoscanAssetToJson(
        ObjDetailsPoscanAsset instance) =>
    <String, dynamic>{
      'objIdx': instance.objIdx,
      'propIdx': instance.propIdx,
      'maxSupply': instance.maxSupply,
    };
