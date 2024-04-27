import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';

class GetExtrinsicsUseCaseParams {
  final String address;
  final PoscanAssetCombined poscanAssetCombined;

  const GetExtrinsicsUseCaseParams({
    required this.address,
    required this.poscanAssetCombined,
  });
}
