import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/create_asset_global_handler.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class CreateAsset extends UseCase<void, CreateAssetParams> {
  final PoscanAssetsRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const CreateAsset({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Either<Failure, void>> call(
    final CreateAssetParams params,
  ) async {
    final notificationLoading = NotificationCreateAsset(
      admin: params.admin,
      objectId: params.objIdx.toString(),
      propetyId: params.propIdx.toString(),
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
    required this.objIdx,
    required this.propIdx,
    required this.maxSupply,
    // required this.nApprovals,
    // required this.pathToFile,
    // required this.categoryFabric,
    // required this.hashes,
    // required this.propValues,
    required this.updateStatus,
    // required this.localSnapshotName,
  });

  final int assetId;
  final KeyPairData admin;
  final String password;
  final int minBalance;
  final int objIdx;
  final int propIdx;
  final BigInt maxSupply;
  // final int nApprovals;
  // final String pathToFile;
  // final MapPoscanCategory categoryFabric;
  // final List<String> hashes;
  // final List<PropValue>? propValues;
  final void Function() updateStatus;
  // final String localSnapshotName;
}
