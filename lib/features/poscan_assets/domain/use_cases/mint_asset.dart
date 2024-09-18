import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/mint_global_handler.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class MintAsset extends UseCase<void, MintAssetParams> {
  final PoscanAssetsRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final PoscanAssetsCubit poscanAssetCubit;

  const MintAsset({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
    required this.poscanAssetCubit,
  });

  @override
  Future<void> call(
    final MintAssetParams params,
  ) async {
    final notificationLoading = NotificationMintAsset(
      admin: params.account,
      assetId: params.assetId.toString(),
      status: ExtrinsicStatus.loading,
      message: null,
    );

    notificationsBloc.add(
      AddNotification(notificationLoading),
    );

    final res = await repository.mint(
      params: params,
      updateStatus: () {
        params.updateStatus();
      },
      msgIdCallback: (final msgId) {
        final webviewRunner =
            appServiceLoaderCubit.state.plugin.sdk.api.service.webView!;

        webviewRunner.addGlobalHandler(
          MintGlobalHandler(
            msgId: msgId,
            notificationsBloc: notificationsBloc,
            initialN: notificationLoading,
            webViewRunner: webviewRunner,
            poscanAssetsCubit: poscanAssetCubit,
          ),
        );
      },
    );
    return res;
  }
}

class MintAssetParams {
  const MintAssetParams({
    required this.account,
    required this.password,
    required this.assetId,
    required this.amount,
    required this.updateStatus,
  });

  final KeyPairData account;
  final String password;
  final int assetId;
  final BigInt amount;
  final void Function() updateStatus;
}
