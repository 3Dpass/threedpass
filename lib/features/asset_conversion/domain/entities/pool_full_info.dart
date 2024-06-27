import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/lp_balance.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/raw_pool_reserve.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class PoolFullInfo {
  final BasicPoolEntity basicInfo;
  final RawPoolReserve? rawPoolReserve;
  final LPBalance? lpBalance;
  final PoscanAssetMetadata? asset1Meta;
  final PoscanAssetMetadata? asset2Meta;

  const PoolFullInfo({
    required this.basicInfo,
    required this.lpBalance,
    required this.rawPoolReserve,
    required this.asset1Meta,
    required this.asset2Meta,
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
