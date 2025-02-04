import 'package:rational/rational.dart';
import 'package:threedpass/core/polkawallet/utils/set_decimals.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';

extension CalcUserPoolReserves on PoolFullInfo {
  (Rational, Rational) userPoolReserves({
    required final int nativeTokenDecimals,
  }) {
    final asset1Decimals = asset1Meta?.idecimals ?? nativeTokenDecimals;
    final asset2Decimals = asset2Meta?.idecimals ?? nativeTokenDecimals;

    final asset1Reserve =
        rawPoolReserve!.balance1Decimal.setDecimalsForRaw(asset1Decimals);
    final asset2Reserve =
        rawPoolReserve!.balance2Decimal.setDecimalsForRaw(asset2Decimals);

    final userLPRate = Rational(lpBalance!, totalLpTokenSupply);

    final asset1UserBalance = asset1Reserve * userLPRate;
    final asset2UserBalance = asset2Reserve * userLPRate;

    return (asset1UserBalance, asset2UserBalance);
  }
}
