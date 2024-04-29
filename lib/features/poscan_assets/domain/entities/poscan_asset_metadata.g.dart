// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_asset_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoscanAssetMetadata _$PoscanAssetMetadataFromJson(Map<String, dynamic> json) =>
    PoscanAssetMetadata(
      symbol: json['symbol'] as String,
      decimals: json['decimals'] as String,
      deposit: json['deposit'] as String,
      id: json['id'] as int,
      isFrozen: json['isFrozen'] as bool,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PoscanAssetMetadataToJson(
        PoscanAssetMetadata instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'deposit': instance.deposit,
      'id': instance.id,
      'isFrozen': instance.isFrozen,
      'name': instance.name,
    };
