import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

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
  }) : super(PoscanAssetsState.initial(currentAccount));

  final PoscanAssetsRepository repository;

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

    final dataResponse = await repository.allTokens();
    final metadataResponse = await repository.tokensMetadata();

    await dataResponse.when(
      right: (final data) {
        return metadataResponse.when(
          right: (final metadata) async {
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
          left: (final e) {
            emit(
              state.copyWith(
                isLoading: false,
                errorMessage: e.cause,
              ),
            );
          },
        );
      },
      left: (final e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: e.cause,
          ),
        );
      },
    );
  }

  List<PoolAssetField> get poolAssets => <PoolAssetField>[
        const PoolAssetField.native(),
        ...state.metadata.keys
            .map((final e) => PoolAssetField(assetId: e, isNative: false)),
      ];
}
