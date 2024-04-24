import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

// CopyWith is not used on purpose
class PoscanAssetsState {
  final List<PoscanAssetData> assets;
  final List<PoscanAssetMetadata> metadata;
  final List<PoscanAssetBalance> balances;

  List<PoscanAssetCombined> get combined => assets
      .map(
        (final e) => PoscanAssetCombined(
          poscanAssetData: e,
          poscanAssetMetadata: null,
          poscanAssetBalance: null,
        ),
      )
      .toList();

  final bool isLoading;
  final String errorMessage;

  const PoscanAssetsState({
    required this.assets,
    required this.metadata,
    required this.balances,
    required this.isLoading,
    required this.errorMessage,
  });

  const PoscanAssetsState.initial()
      : assets = const [],
        metadata = const [],
        balances = const [],
        errorMessage = '',
        isLoading = true;
}

class PoscanAssetsCubit extends Cubit<PoscanAssetsState> {
  PoscanAssetsCubit({required this.repository})
      : super(const PoscanAssetsState.initial());

  final PoscanAssetsRepository repository;

  Future<void> loadTokens() async {
    emit(const PoscanAssetsState.initial());

    final response = await repository.allTokens();
    response.when(
      left: (final e) {
        emit(
          PoscanAssetsState(
            assets: [],
            metadata: [],
            balances: [],
            isLoading: false,
            errorMessage: e.cause.toString(),
          ),
        );
      },
      right: (final data) {
        emit(
          PoscanAssetsState(
            assets: data,
            metadata: [],
            balances: [],
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    );
  }
}
