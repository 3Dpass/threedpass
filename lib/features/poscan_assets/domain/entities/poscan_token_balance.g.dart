// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_token_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoscanAssetBalance _$PoscanAssetBalanceFromJson(Map<String, dynamic> json) =>
    PoscanAssetBalance(
      balance: json['balance'] as String,
      reason: json['reason'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PoscanAssetBalanceToJson(PoscanAssetBalance instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'reason': instance.reason,
      'status': instance.status,
    };
