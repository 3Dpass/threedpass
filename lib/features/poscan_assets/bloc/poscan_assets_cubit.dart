import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:rational/rational.dart';
import 'package:threedpass/core/polkawallet/utils/set_decimals.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/get_all_tokens_data.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/get_all_tokens_metadata.dart';

part 'poscan_assets_cubit.g.dart';

@CopyWith()
class PoscanAssetsState {
  final List<PoscanAssetData> assets;
  final Map<int, PoscanAssetMetadata> metadata;
  final Map<int, PoscanAssetBalance> balances;

  List<PoscanAssetCombined> get combined => assets
      .map(
        (final e) => PoscanAssetCombined(
          poscanAssetData: e,
          poscanAssetMetadata: metadata[e.id],
          poscanAssetBalance: balances[e.id],
        ),
      )
      .toList();

  @Deprecated('Use AsyncValue')
  final bool isLoading;
  final String errorMessage;
  final KeyPairData currentAccount;

  const PoscanAssetsState({
    required this.assets,
    required this.metadata,
    required this.balances,
    // required this.combined,
    required this.currentAccount,
    required this.isLoading,
    required this.errorMessage,
  });

  const PoscanAssetsState.initial(final KeyPairData initialAccount)
      : currentAccount = initialAccount,
        assets = const [],
        metadata = const {},
        balances = const {},
        errorMessage = '',
        isLoading = true;
}

class PoscanAssetsCubit extends Cubit<PoscanAssetsState> {
  PoscanAssetsCubit({
    required this.repository,
    required final KeyPairData currentAccount,
    required this.getAllTokensData,
    required this.getAllTokensMetadata,
  }) : super(PoscanAssetsState.initial(currentAccount));

  final PoscanAssetsRepository repository;
  final GetAllTokensData getAllTokensData;
  final GetAllTokensMetadata getAllTokensMetadata;

  void switchAccount(final KeyPairData newAccount) {
    emit(state.copyWith(currentAccount: newAccount));
  }

  Future<void> updateBalances() async {
    emit(state.copyWith(isLoading: true));

    final tokenIds = state.assets.map((final e) => e.id);
    final balances = await repository.tokensBalancesForCurrentAccount(
      tokenIds,
      state.currentAccount.address.toString(),
    );
    emit(
      state.copyWith(
        balances: balances,
        isLoading: false,
      ),
    );
  }

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    // final dataResponse = await repository.allTokens();
    await getAllTokensData.safeCall(
      params: null,
      onError: (final e, final st) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: e.toString(),
          ),
        );
      },
      onSuccess: (final data) async {
        await getAllTokensMetadata.safeCall(
          params: null,
          onError: (final e, final _) => emit(
            state.copyWith(
              isLoading: false,
              errorMessage: e.toString(),
            ),
          ),
          onSuccess: (final Map<int, PoscanAssetMetadata> metadata) async {
            final tokenIds = data.map((final e) => e.id);

            final balances = await repository.tokensBalancesForCurrentAccount(
              tokenIds,
              state.currentAccount.address.toString(),
            );

            emit(
              state.copyWith(
                assets: data,
                metadata: metadata,
                balances: balances,
                isLoading: false,
                errorMessage: '',
              ),
            );
          },
        );
      },
    );
  }

  static const nonFungiblePropId = '0';

  List<PoolAssetField>? get poolAssets {
    if (state.isLoading) {
      return null;
    } else {
      final assetsDataMap = <int, PoscanAssetData>{};
      state.assets.forEach((final data) {
        assetsDataMap[data.id] = data;
      });
      final possiblePoolIds = state.assets
          .where((final data) => data.objDetails?.propIdx != nonFungiblePropId);
      return <PoolAssetField>[
        const PoolAssetField.native(),
        ...possiblePoolIds
            .map((final e) => PoolAssetField(assetId: e.id, isNative: false)),
      ];
    }
  }

  // TODO Refactor get decimals to UseCase
  int decimalsById(final int assetId) {
    return state.metadata[assetId]!.idecimals;
  }

  // TODO Refactor get balance to UseCase
  Rational? fastBalanceById(final int id) {
    if (state.balances[id] == null) {
      return null;
    }
    return Decimal.fromBigInt(state.balances[id]!.decodedRawBalance)
        .setDecimalsForRaw(decimalsById(id));
  }
}
