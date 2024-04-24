import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanAssetCombined {
  final PoscanAssetData poscanAssetData;
  final PoscanAssetMetadata? poscanAssetMetadata;
  final PoscanAssetBalance? poscanAssetBalance;

  const PoscanAssetCombined({
    required this.poscanAssetBalance,
    required this.poscanAssetData,
    required this.poscanAssetMetadata,
  });
}
