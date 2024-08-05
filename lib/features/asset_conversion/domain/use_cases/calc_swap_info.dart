import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/utils/decimal_set_decimals.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

// class CalcSwapInfo extends UseCase<(Decimal, Decimal), CalcSwapInfoParams> {
//   const CalcSwapInfo({
//     required this.assetConversionRepository,
//   });

//   final AssetConversionRepository assetConversionRepository;

//   @override
//   Future<Either<Failure, (Decimal, Decimal)>> call(
//     final CalcSwapInfoParams params,
//   ) async {
//     try {
//       final metadata = params.metadata;

//       final asset1Decimals = params.firstAsset.isNative
//           ? params.nativeTokenDecimals
//           : metadata[params.firstAsset.assetId]!.idecimals;

//       final asset2Decimals = params.secondAsset.isNative
//           ? params.nativeTokenDecimals
//           : metadata[params.secondAsset.assetId]!.idecimals;

//       final amount1 = Decimal.parse(params.firstAssetAmountControllerText)
//           .setDecimalsForUserInput(asset1Decimals);
//       final amount2 = Decimal.parse(params.secondAssetAmountControllerText)
//           .setDecimalsForUserInput(asset2Decimals);

//       if (!amount1.hasCorrectDecimals(asset1Decimals)) {
//         return const Either.left(
//           BadDataFailure('Set too many decimals for asset 1'),
//         );
//       }
//       if (!amount2.hasCorrectDecimals(asset2Decimals)) {
//         return const Either.left(
//           BadDataFailure('Set too many decimals for asset 2'),
//         );
//       }

//       if (params.swapMethod == SwapMethod.swapExactTokensForTokens) {
//         // Params: Amount in, Amount out In
//         // Token A is user input. Token B is calculated
//         // InputEditedType.exactIn https://github.com/MVPWorkshop/dot-acp-ui/blob/c4a938db5e7f1036ff5bb56a656fc2071ed36925/src/app/types/enum.ts#L63

//         late final String tokenBPrice;

//         if (params.firstAsset.isNative) {
//           // First is native, second is not
//           final assetTokenPriceResponse =
//               await assetConversionRepository.getAssetTokenFromNativeToken(
//             assetTokenId: params.secondAsset.assetId!,
//             nativeTokenValue: amount1.toBigInt(),
//           );
//           if (!(assetTokenPriceResponse.value is String)) {
//             return const Either.left(
//               BadDataFailure('Left'),
//             );
//           }

//           tokenBPrice = assetTokenPriceResponse.value! as String;
//         } else if (params.secondAsset.isNative) {
//           // Second is native, first is not
//           final nativeTokenPriceResponse =
//               await assetConversionRepository.getNativeTokenFromAssetToken(
//             assetTokenId: params.firstAsset.assetId!,
//             assetTokenValue: amount1.toBigInt(),
//           );
//           if (!(nativeTokenPriceResponse.value is String)) {
//             return const Either.left(
//               BadDataFailure('Left'),
//             );
//           }
//           tokenBPrice = nativeTokenPriceResponse.value! as String;
//         } else {
//           // Both are not native
//           final tokenBPriceResponse =
//               await assetConversionRepository.getAssetTokenBFromAssetTokenA(
//             assetToken1Id: params.firstAsset.assetId!,
//             assetToken2Id: params.secondAsset.assetId!,
//             assetToken1Value: amount1.toBigInt(),
//           );
//           if (!(tokenBPriceResponse.value is String)) {
//             return const Either.left(
//               BadDataFailure('Left'),
//             );
//           }
//           tokenBPrice = tokenBPriceResponse.value! as String;
//         }

//         final tokenBPriceRational =
//             Decimal.parse(tokenBPrice.replaceAll(',', ''))
//                 .setDecimalsForRaw(asset2Decimals);
//         final assetTokenPriceWithSlippage =
//             slippageReduce(tokenBPriceRational, params.slippage).toDecimal();

//         return Either.right(
//           (
//             tokenBPriceRational.toDecimal(),
//             assetTokenPriceWithSlippage,
//           ),
//         );
//       } else {
//         // Params: amount out, amount in max
//         // Token B is user input. Token A is calculated
//         // InputEditedType.exacOut
//         late final String tokenAPrice;

//         if (params.secondAsset.isNative) {
//           // First is native, second is not
//           final assetTokenPriceResponse =
//               await assetConversionRepository.getAssetTokenFromNativeToken(
//             assetTokenId: params.firstAsset.assetId!,
//             nativeTokenValue: amount2.toBigInt(),
//           );
//           if (!(assetTokenPriceResponse.value is String)) {
//             return const Either.left(
//               BadDataFailure('Left'),
//             );
//           }

//           tokenAPrice = assetTokenPriceResponse.value! as String;
//         } else if (params.firstAsset.isNative) {
//           // Second is native, first is not
//           final nativeTokenPriceResponse =
//               await assetConversionRepository.getNativeTokenFromAssetToken(
//             assetTokenId: params.secondAsset.assetId!,
//             assetTokenValue: amount2.toBigInt(),
//           );
//           if (!(nativeTokenPriceResponse.value is String)) {
//             return const Either.left(
//               BadDataFailure('Left'),
//             );
//           }
//           tokenAPrice = nativeTokenPriceResponse.value! as String;
//         } else {
//           // Both are not native
//           final tokenAPriceResponse =
//               await assetConversionRepository.getAssetTokenAFromAssetTokenB(
//             assetToken1Id: params.firstAsset.assetId!,
//             assetToken2Id: params.secondAsset.assetId!,
//             assetToken2Value: amount2.toBigInt(),
//           );
//           if (!(tokenAPriceResponse.value is String)) {
//             return const Either.left(
//               BadDataFailure('Left'),
//             );
//           }
//           tokenAPrice = tokenAPriceResponse.value! as String;
//         }

//         final tokenAPriceRational =
//             Decimal.parse(tokenAPrice.replaceAll(',', ''))
//                 .setDecimalsForRaw(asset1Decimals);
//         final assetTokenPriceWithSlippage =
//             slippageAdd(tokenAPriceRational, params.slippage).toDecimal();

//         return Either.right(
//           (
//             tokenAPriceRational.toDecimal(),
//             assetTokenPriceWithSlippage,
//           ),
//         );
//       }
//     } on Object catch (e, stackTrace) {
//       return Either.left(BadDataFailure(e.toString() + stackTrace.toString()));
//     }
//   }
// }

// class CalcSwapInfoParams {
//   // final PoolFullInfo poolFullInfo;
//   final PoolAssetField firstAsset;
//   final PoolAssetField secondAsset;
//   final Map<int, PoscanAssetMetadata> metadata;
//   final String firstAssetAmountControllerText;
//   final String secondAssetAmountControllerText;
//   final SwapMethod swapMethod;
//   final int slippage;
//   final int nativeTokenDecimals;

//   const CalcSwapInfoParams({
//     // required this.poolFullInfo,
//     required this.firstAsset,
//     required this.secondAsset,
//     required this.metadata,
//     required this.firstAssetAmountControllerText,
//     required this.secondAssetAmountControllerText,
//     required this.swapMethod,
//     required this.slippage,
//     required this.nativeTokenDecimals,
//   });
// }

class CalcSwapOnChangedParams {
  // final PoolFullInfo poolFullInfo;
  final PoolAssetField firstAsset;
  final PoolAssetField secondAsset;
  final Map<int, PoscanAssetMetadata>
      metadata; // TODO Get metadata from use case, not from params
  final String assetAmountControllerText;
  final int slippage;
  final int nativeTokenDecimals;

  const CalcSwapOnChangedParams({
    // required this.poolFullInfo,
    required this.firstAsset,
    required this.secondAsset,
    required this.metadata,
    required this.assetAmountControllerText,
    // required this.secondAssetAmountControllerText,
    // required this.swapMethod,
    required this.slippage,
    required this.nativeTokenDecimals,
  });
}

/// CALL FOR METHOD SwapMethod.swapExactTokensForToken
class CalcSwapOnFirstChanged
    extends UseCase<(Decimal, Decimal), CalcSwapOnChangedParams> {
  const CalcSwapOnFirstChanged({
    required this.assetConversionRepository,
  });

  final AssetConversionRepository assetConversionRepository;

  @override
  Future<Either<Failure, (Decimal, Decimal)>> call(
    final CalcSwapOnChangedParams params,
  ) async {
    try {
      final metadata = params.metadata;

      final asset1Decimals = params.firstAsset.isNative
          ? params.nativeTokenDecimals
          : metadata[params.firstAsset.assetId]!.idecimals;
      final asset2Decimals = params.secondAsset.isNative
          ? params.nativeTokenDecimals
          : metadata[params.secondAsset.assetId]!.idecimals;

      final amount1 = Decimal.parse(params.assetAmountControllerText)
          .setDecimalsForUserInput(asset1Decimals);

      if (!amount1.hasCorrectDecimals(asset1Decimals)) {
        return const Either.left(
          BadDataFailure('Set too many decimals for asset 1'),
        );
      }

      // Params: Amount in, Amount out In
      // Token A is user input. Token B is calculated
      // InputEditedType.exactIn https://github.com/MVPWorkshop/dot-acp-ui/blob/c4a938db5e7f1036ff5bb56a656fc2071ed36925/src/app/types/enum.ts#L63

      late final String tokenBPrice;

      if (params.firstAsset.isNative) {
        // First is native, second is not
        final assetTokenPriceResponse =
            await assetConversionRepository.getAssetTokenFromNativeToken(
          assetTokenId: params.secondAsset.assetId!,
          nativeTokenValue: amount1.toBigInt(),
        );
        if (!(assetTokenPriceResponse.value is String)) {
          return const Either.left(
            BadDataFailure('Left'),
          );
        }

        tokenBPrice = assetTokenPriceResponse.value! as String;
      } else if (params.secondAsset.isNative) {
        // Second is native, first is not
        final nativeTokenPriceResponse =
            await assetConversionRepository.getNativeTokenFromAssetToken(
          assetTokenId: params.firstAsset.assetId!,
          assetTokenValue: amount1.toBigInt(),
        );
        if (!(nativeTokenPriceResponse.value is String)) {
          return const Either.left(
            BadDataFailure('Left'),
          );
        }
        tokenBPrice = nativeTokenPriceResponse.value! as String;
      } else {
        // Both are not native
        final tokenBPriceResponse =
            await assetConversionRepository.getAssetTokenBFromAssetTokenA(
          assetToken1Id: params.firstAsset.assetId!,
          assetToken2Id: params.secondAsset.assetId!,
          assetToken1Value: amount1.toBigInt(),
        );
        if (!(tokenBPriceResponse.value is String)) {
          return const Either.left(
            BadDataFailure('Left'),
          );
        }
        tokenBPrice = tokenBPriceResponse.value! as String;
      }

      final tokenBPriceRational = Decimal.parse(tokenBPrice.replaceAll(',', ''))
          .setDecimalsForRaw(asset2Decimals);
      final assetTokenPriceWithSlippage =
          slippageReduce(tokenBPriceRational, params.slippage).toDecimal();

      return Either.right(
        (
          tokenBPriceRational.toDecimal(),
          assetTokenPriceWithSlippage,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Either.left(BadDataFailure(e.toString() + stackTrace.toString()));
    }
  }

  Rational slippageReduce(final Rational tokenValue, final int slippageValue) =>
      tokenValue -
      (tokenValue * Rational.fromInt(slippageValue) / Rational.fromInt(100));
}

/// CALL FOR METHOD SwapMethod.swapTokensForExactTokens
class CalcSwapOnSecondChanged
    extends UseCase<(Decimal, Decimal), CalcSwapOnChangedParams> {
  const CalcSwapOnSecondChanged({
    required this.assetConversionRepository,
  });

  final AssetConversionRepository assetConversionRepository;

  @override
  Future<Either<Failure, (Decimal, Decimal)>> call(
    final CalcSwapOnChangedParams params,
  ) async {
    try {
      final metadata = params.metadata;

      final asset1Decimals = params.firstAsset.isNative
          ? params.nativeTokenDecimals
          : metadata[params.firstAsset.assetId]!.idecimals;

      final asset2Decimals = params.secondAsset.isNative
          ? params.nativeTokenDecimals
          : metadata[params.secondAsset.assetId]!.idecimals;

      final amount2 = Decimal.parse(params.assetAmountControllerText)
          .setDecimalsForUserInput(asset2Decimals);

      if (!amount2.hasCorrectDecimals(asset2Decimals)) {
        return const Either.left(
          BadDataFailure('Set too many decimals for asset 2'),
        );
      }

      // Params: amount out, amount in max
      // Token B is user input. Token A is calculated
      // InputEditedType.exacOut
      late final String tokenAPrice;

      if (params.secondAsset.isNative) {
        // First is native, second is not
        final assetTokenPriceResponse =
            await assetConversionRepository.getAssetTokenFromNativeToken(
          assetTokenId: params.firstAsset.assetId!,
          nativeTokenValue: amount2.toBigInt(),
        );
        if (!(assetTokenPriceResponse.value is String)) {
          return const Either.left(
            BadDataFailure('Left'),
          );
        }

        tokenAPrice = assetTokenPriceResponse.value! as String;
      } else if (params.firstAsset.isNative) {
        // Second is native, first is not
        final nativeTokenPriceResponse =
            await assetConversionRepository.getNativeTokenFromAssetToken(
          assetTokenId: params.secondAsset.assetId!,
          assetTokenValue: amount2.toBigInt(),
        );
        if (!(nativeTokenPriceResponse.value is String)) {
          return const Either.left(
            BadDataFailure('Left'),
          );
        }
        tokenAPrice = nativeTokenPriceResponse.value! as String;
      } else {
        // Both are not native
        final tokenAPriceResponse =
            await assetConversionRepository.getAssetTokenAFromAssetTokenB(
          assetToken1Id: params.firstAsset.assetId!,
          assetToken2Id: params.secondAsset.assetId!,
          assetToken2Value: amount2.toBigInt(),
        );
        if (!(tokenAPriceResponse.value is String)) {
          return const Either.left(
            BadDataFailure('Left'),
          );
        }
        tokenAPrice = tokenAPriceResponse.value! as String;
      }

      final tokenAPriceRational = Decimal.parse(tokenAPrice.replaceAll(',', ''))
          .setDecimalsForRaw(asset1Decimals);
      final assetTokenPriceWithSlippage =
          slippageAdd(tokenAPriceRational, params.slippage).toDecimal();

      return Either.right(
        (
          tokenAPriceRational.toDecimal(),
          assetTokenPriceWithSlippage,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Either.left(BadDataFailure(e.toString() + stackTrace.toString()));
    }
  }

  Rational slippageAdd(final Rational tokenValue, final int slippageValue) =>
      tokenValue +
      (tokenValue * Rational.fromInt(slippageValue) / Rational.fromInt(100));
}
