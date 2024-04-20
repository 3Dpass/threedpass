import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanAssetsState {
  final List<PoscanAssetData> assets;

  const PoscanAssetsState({
    required this.assets,
  });

  const PoscanAssetsState.initial() : assets = const [];
}

class PoscanAssetsCubit extends Cubit<PoscanAssetsState> {
  PoscanAssetsCubit({required this.repository})
      : super(const PoscanAssetsState.initial());

  PoscanAssetsRepository repository;

  Future<void> loadTokens() {
    return Future.value();
  }
}
