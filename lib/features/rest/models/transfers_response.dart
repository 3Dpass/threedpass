import 'package:json_annotation/json_annotation.dart';

part 'transfers_response.g.dart';

@JsonSerializable(createToJson: false)
class TransfersResponse {
  final List<TransferResponseItem> items;
  final int page;
  final int pageSize;
  final int total;

  const TransfersResponse({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
  });

  factory TransfersResponse.fromJson(Map<String, dynamic> json) =>
      _$TransfersResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class TransferResponseItem {
  final IndexerResponse indexer;
  final String from;
  final String to;
  final String balance;
  final bool isSigned;
  // final bool isNativeAsset;

  const TransferResponseItem({
    required this.indexer,
    required this.from,
    required this.to,
    required this.balance,
    required this.isSigned,
  });

  factory TransferResponseItem.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class IndexerResponse {
  // final int blockHeight;
  // final String blockHash;
  final int blockTime;
  // final int eventIndex;
  // final int extrinsicIndex;

  const IndexerResponse({
    required this.blockTime,
  });

  factory IndexerResponse.fromJson(Map<String, dynamic> json) =>
      _$IndexerResponseFromJson(json);
}
