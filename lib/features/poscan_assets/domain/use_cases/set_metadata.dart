import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/set_metadata_global_handler.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class SetMetadata extends UseCase<void, SetMetadataParams> {
  final PoscanAssetsRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final PoscanAssetsCubit poscanAssetCubit;

  const SetMetadata({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
    required this.poscanAssetCubit,
  });

  @override
  Future<void> call(
    final SetMetadataParams params,
  ) async {
    final notificationLoading = NotificationSetMetadata(
      admin: params.admin,
      assetId: params.assetId.toString(),
      status: ExtrinsicStatus.loading,
      message: null,
    );

    notificationsBloc.add(
      AddNotification(notificationLoading),
    );

    final res = await repository.setMetadata(
      params: params,
      updateStatus: () {
        params.updateStatus();
      },
      msgIdCallback: (final msgId) {
        final webviewRunner =
            appServiceLoaderCubit.state.plugin.sdk.api.service.webView!;

        webviewRunner.addGlobalHandler(
          SetMetadataGlobalHandler(
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

class SetMetadataParams {
  const SetMetadataParams({
    required this.admin,
    required this.assetId,
    required this.password,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.updateStatus,
  });

  final int assetId;
  final KeyPairData admin;
  final String password;
  final String name;
  final String symbol;
  final int decimals;
  final void Function() updateStatus;
}
