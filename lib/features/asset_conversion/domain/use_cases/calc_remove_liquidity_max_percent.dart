import 'dart:math';

import 'package:rational/rational.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/utils/calc_user_pool_reserves.dart';

class CalcRemoveLiquidityMaxPercent
    extends UseCase<double, CalcRemoveLiquidityMaxPercentParams> {
  final AssetConversionRepository assetConversionRepository;

  const CalcRemoveLiquidityMaxPercent({
    required this.assetConversionRepository,
  });

  @override
  Future<double> call(
    final CalcRemoveLiquidityMaxPercentParams params,
  ) async {
    final assetUserBalances = params.poolFullInfo
        .userPoolReserves(nativeTokenDecimals: params.nativeTokenDecimals);

    final asset1UserBalance = assetUserBalances.$1;
    final asset2UserBalance = assetUserBalances.$2;

    // Call existential deposit only when one of assets is not native
    Rational? nativeMinBalance;
    if (params.poolFullInfo.asset1Meta == null ||
        params.poolFullInfo.asset2Meta == null) {
      final existentialDeposit =
          await assetConversionRepository.existentialDeposit();

      nativeMinBalance = Rational.fromInt(
        existentialDeposit,
        pow(10, params.nativeTokenDecimals).toInt(),
      );
    }

    final asset1MinBalance = params.poolFullInfo.asset1Data != null
        ? Rational.fromInt(
            params.poolFullInfo.asset1Data!.minBalanceInt,
            pow(10, params.poolFullInfo.asset1Meta!.idecimals).toInt(),
          )
        : nativeMinBalance;
    final asset2MinBalance = params.poolFullInfo.asset2Data != null
        ? Rational.fromInt(
            params.poolFullInfo.asset2Data!.minBalanceInt,
            pow(10, params.poolFullInfo.asset2Meta!.idecimals).toInt(),
          )
        : nativeMinBalance;

    final asset1Base = asset1UserBalance - asset1MinBalance!;
    final asset2Base = asset2UserBalance - asset2MinBalance!;

    final asset1Percent = (asset1Base / asset1UserBalance).toDouble();
    final asset2Percent = (asset2Base / asset2UserBalance).toDouble();

    final minPercent = min(asset1Percent, asset2Percent);

    return minPercent * 100;
  }
}

class CalcRemoveLiquidityMaxPercentParams {
  final PoolFullInfo poolFullInfo;
  final int nativeTokenDecimals;
  // final int nativeMinBalance;

  const CalcRemoveLiquidityMaxPercentParams({
    required this.poolFullInfo,
    required this.nativeTokenDecimals,
    // required this.nativeMinBalance,
  });
}
