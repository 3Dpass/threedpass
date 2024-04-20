// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_token_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoscanAssetData _$PoscanAssetDataFromJson(Map<String, dynamic> json) =>
    PoscanAssetData(
      id: json['id'] as int,
      owner: json['owner'] as String,
      issuer: json['issuer'] as String,
      admin: json['admin'] as String,
      freezer: json['freezer'] as String,
      supply: json['supply'] as String,
      deposit: json['deposit'] as String,
      minBalance: json['minBalance'] as String,
      isSufficient: json['isSufficient'] as bool,
      accounts: json['accounts'] as String,
      sufficients: json['sufficients'] as String,
      approvals: json['approvals'] as String,
      status: json['status'] as String,
      objDetails: json['objDetails'] == null
          ? null
          : ObjDetailsPoscanAsset.fromJson(
              json['objDetails'] as Map<String, dynamic>),
      reserved: json['reserved'] as String,
    );

Map<String, dynamic> _$PoscanAssetDataToJson(PoscanAssetData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'issuer': instance.issuer,
      'admin': instance.admin,
      'freezer': instance.freezer,
      'supply': instance.supply,
      'deposit': instance.deposit,
      'minBalance': instance.minBalance,
      'isSufficient': instance.isSufficient,
      'accounts': instance.accounts,
      'sufficients': instance.sufficients,
      'approvals': instance.approvals,
      'status': instance.status,
      'objDetails': instance.objDetails,
      'reserved': instance.reserved,
    };
