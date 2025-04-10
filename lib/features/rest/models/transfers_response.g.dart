// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransfersResponse _$TransfersResponseFromJson(Map<String, dynamic> json) =>
    TransfersResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => TransferResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

TransferResponseItem _$TransferResponseItemFromJson(
        Map<String, dynamic> json) =>
    TransferResponseItem(
      indexer:
          IndexerResponse.fromJson(json['indexer'] as Map<String, dynamic>),
      from: json['from'] as String,
      to: json['to'] as String,
      balance: json['balance'] as String,
      isSigned: json['isSigned'] as bool,
    );

IndexerResponse _$IndexerResponseFromJson(Map<String, dynamic> json) =>
    IndexerResponse(
      blockTime: (json['blockTime'] as num).toInt(),
    );
