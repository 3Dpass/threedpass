import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/create_asset_global_handler.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/obj_details.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class CreateAsset extends UseCase<void, CreateAssetParams> {
  final PoscanAssetsRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final PoscanAssetsCubit poscanAssetCubit;

  const CreateAsset({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
    required this.poscanAssetCubit,
  });

  @override
  Future<void> call(
    final CreateAssetParams params,
  ) async {
    final notificationLoading = NotificationCreateAsset(
      admin: params.admin,
      objDetails: params.objDetails,
      newAssetId: params.assetId.toString(),
      status: ExtrinsicStatus.loading,
      message: null,
    );

    notificationsBloc.add(
      AddNotification(notificationLoading),
    );

    final res = await repository.create(
      params: params,
      updateStatus: () {
        params.updateStatus();
      },
      msgIdCallback: (final msgId) {
        appServiceLoaderCubit.state.plugin.sdk.api.service.webView!
            .addGlobalHandler(
          CreateAssetGlobalHandler(
            msgId: msgId,
            notificationsBloc: notificationsBloc,
            initialN: notificationLoading,
            webViewRunner:
                appServiceLoaderCubit.state.plugin.sdk.api.service.webView!,
            poscanAssetsCubit: poscanAssetCubit,
          ),
        );
      },
    );
    return res;
  }
}

class CreateAssetParams {
  const CreateAssetParams({
    required this.admin,
    required this.assetId,
    required this.password,
    required this.minBalance,
    required this.objDetails,
    required this.updateStatus,
  });

  final int assetId;
  final KeyPairData admin;
  final String password;
  final int minBalance;
  final ObjDetailsPoscanAsset? objDetails;
  final void Function() updateStatus;
}
