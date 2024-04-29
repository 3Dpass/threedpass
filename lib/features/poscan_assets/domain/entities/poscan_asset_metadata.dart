import 'package:json_annotation/json_annotation.dart';

part 'poscan_asset_metadata.g.dart';

@JsonSerializable()
class PoscanAssetMetadata {
  final String symbol;
  final String decimals;
  final String deposit;
  final int id;
  final bool isFrozen;
  final String name;

  int get idecimals => int.parse(decimals);

  const PoscanAssetMetadata({
    required this.symbol,
    required this.decimals,
    required this.deposit,
    required this.id,
    required this.isFrozen,
    required this.name,
  });

  factory PoscanAssetMetadata.fromJson(final Map<String, dynamic> json) =>
      _$PoscanAssetMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$PoscanAssetMetadataToJson(this);
}
