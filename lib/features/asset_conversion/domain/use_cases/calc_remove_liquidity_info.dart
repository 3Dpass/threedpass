import 'package:rational/rational.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/utils/calc_user_pool_reserves.dart';

class CalcRemoveLiquidityInfo
    extends UseCase<RemoveLiquidityInfo, CalcRemoveLiquidityInfoParams> {
  const CalcRemoveLiquidityInfo();

  @override
  Future<RemoveLiquidityInfo> call(
    final CalcRemoveLiquidityInfoParams params,
  ) async {
    final assetUserBalances = params.poolFullInfo
        .userPoolReserves(nativeTokenDecimals: params.nativeTokenDecimals);

    final asset1UserBalance = assetUserBalances.left;
    final asset2UserBalance = assetUserBalances.right;

    final percentageRational = Rational.fromInt(params.percentage, 100);

    final asset1Expected = asset1UserBalance * percentageRational;
    final asset2Expected = asset2UserBalance * percentageRational;

    final slippageRational = Rational.fromInt(params.slippage, 100);

    final asset1MinRecieve = asset1Expected - asset1Expected * slippageRational;
    final asset2MinRecieve = asset2Expected - asset2Expected * slippageRational;

    // price impact
    // final priceBeforeSwap = asset1Reserve / asset2Reserve;
    // // final priceOfAssetBForOneAssetA = asset2Reserve / asset1Reserve;
    // final valueA = asset1Reserve - asset1Expected;
    // final valueB = asset2Reserve - asset2Expected;
    // final priceAfterSwap = valueA / valueB;
    // final priceImpact = Rational.one - (priceBeforeSwap / priceAfterSwap);
    // final priceImpactPercent = priceImpact * Rational.fromInt(100);

    final res = RemoveLiquidityInfo(
      rate: Rational(BigInt.one),
      priceImpact: Rational(BigInt.one),
      amount1MinRecieve: asset1MinRecieve,
      amount2MinRecieve: asset2MinRecieve,
      amount1Expected: asset1Expected,
      amount2Expected: asset2Expected,
    );
    return res;
  }
}

class CalcRemoveLiquidityInfoParams {
  final PoolFullInfo poolFullInfo;
  final int percentage;
  final int slippage;
  final int nativeTokenDecimals;

  const CalcRemoveLiquidityInfoParams({
    required this.poolFullInfo,
    required this.percentage,
    required this.slippage,
    required this.nativeTokenDecimals,
  });
}
