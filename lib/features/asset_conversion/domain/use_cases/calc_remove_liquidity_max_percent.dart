import 'dart:math';

import 'package:rational/rational.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/utils/calc_user_pool_reserves.dart';

class CalcRemoveLiquidityMaxPercent
    extends UseCase<void, CalcRemoveLiquidityMaxPercentParams> {
  const CalcRemoveLiquidityMaxPercent({
    required this.assetConversionRepository,
  });

  final AssetConversionRepository assetConversionRepository;

  @override
  Future<Either<Failure, double>> call(
    final CalcRemoveLiquidityMaxPercentParams params,
  ) async {
    try {
      final assetUserBalances = params.poolFullInfo
          .userPoolReserves(nativeTokenDecimals: params.nativeTokenDecimals);

      final asset1UserBalance = assetUserBalances.left;
      final asset2UserBalance = assetUserBalances.right;

      // Call existential deposit only when one of assets is not native
      Rational? nativeMinBalance;
      if (params.poolFullInfo.asset1Meta == null ||
          params.poolFullInfo.asset2Meta == null) {
        final existentialDeposit =
            await assetConversionRepository.existentialDeposit();

        if (existentialDeposit.value is int) {
          nativeMinBalance = Rational.fromInt(
            existentialDeposit.value! as int,
            pow(10, params.nativeTokenDecimals).toInt(),
          );
        } else {
          final errorMsg =
              existentialDeposit.value?.toString() ?? 'Unknown error';
          logger.e(errorMsg);
          return Either.left(
            NetworkFailure(errorMsg),
          );
        }
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

      return Either.right(minPercent * 100);
    } on Object catch (e) {
      return Either.left(BadDataFailure(e.toString()));
    }
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
