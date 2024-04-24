import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanAssetBalance {
  final double balance;
  final PoscanAssetData tokenData;

  const PoscanAssetBalance({
    required this.balance,
    required this.tokenData,
  });
}
