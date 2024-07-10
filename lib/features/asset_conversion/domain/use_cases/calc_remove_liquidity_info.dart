import 'package:rational/rational.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/utils/decimal_set_decimals.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/remove_liquidity_info.dart';

class CalcRemoveLiquidityInfo
    extends UseCase<void, CalcRemoveLiquidityInfoParams> {
  const CalcRemoveLiquidityInfo({
    required this.assetConversionRepository,
  });

  final AssetConversionRepository assetConversionRepository;

  @override
  Future<Either<Failure, RemoveLiquidityInfo>> call(
    final CalcRemoveLiquidityInfoParams params,
  ) async {
    try {
      final asset1Decimals = params.poolFullInfo.asset1Meta?.idecimals ??
          params.nativeTokenDecimals;
      final asset2Decimals = params.poolFullInfo.asset2Meta?.idecimals ??
          params.nativeTokenDecimals;

      final asset1Reserve = params.poolFullInfo.rawPoolReserve!.balance1Decimal
          .setDecimalsForRaw(asset1Decimals);
      final asset2Reserve = params.poolFullInfo.rawPoolReserve!.balance2Decimal
          .setDecimalsForRaw(asset2Decimals);

      // final tokenId = params.poolFullInfo.basicInfo.lpTokenId;
      final totalLPSupply = params.poolFullInfo.totalLpTokenSupply;
      final userLPTokens = params.poolFullInfo.lpBalance!;

      final userLPRate = Rational(userLPTokens, totalLPSupply);

      final asset1UserBalance = asset1Reserve * userLPRate;
      final asset2UserBalance = asset2Reserve * userLPRate;

      final percentageRational = Rational.fromInt(params.percentage, 100);

      final asset1Expected = asset1UserBalance * percentageRational;
      final asset2Expected = asset2UserBalance * percentageRational;

      final slippageRational = Rational.fromInt(params.slippage, 100);

      final asset1MinRecieve =
          asset1Expected - asset1Expected * slippageRational;
      final asset2MinRecieve =
          asset2Expected - asset2Expected * slippageRational;

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
      return Either.right(res);
    } on Object catch (e) {
      return Either.left(BadDataFailure(e.toString()));
    }
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
