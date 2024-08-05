import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/raw_pool_reserve.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoolFullInfo {
  final BasicPoolEntity basicInfo;
  final RawPoolReserve? rawPoolReserve;
  final BigInt? lpBalance;
  final BigInt totalLpTokenSupply;
  final PoscanAssetMetadata? asset1Meta;
  final PoscanAssetMetadata? asset2Meta;
  final PoscanAssetData? asset1Data;
  final PoscanAssetData? asset2Data;

  const PoolFullInfo({
    required this.basicInfo,
    required this.lpBalance,
    required this.rawPoolReserve,
    required this.asset1Meta,
    required this.asset2Meta,
    required this.asset1Data,
    required this.asset2Data,
    required this.totalLpTokenSupply,
  });

  String realBalance1(final int defaultDecimals) {
    final asset1Decimals = asset1Meta?.idecimals ?? defaultDecimals;
    final balance = BalanceUtils.formattedBigInt(
      rawPoolReserve?.balance1BigInt ?? BigInt.zero,
      asset1Decimals,
    );
    return balance;
  }

  String realBalance2(final int defaultDecimals) {
    final asset2Decimals = asset2Meta?.idecimals ?? defaultDecimals;
    final balance = BalanceUtils.formattedBigInt(
      rawPoolReserve?.balance2BigInt ?? BigInt.zero,
      asset2Decimals,
    );
    return balance;
  }
}
