import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_putobject_repository.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/put_object_global_handler.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class PutObject extends UseCase<void, PutObjectParams> {
  final PoScanPutObjectRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const PutObject({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<void> call(
    final PutObjectParams params,
  ) async {
    final notificationLoading = NotificationPutObject(
      account: params.account,
      localSnapshotName: params.localSnapshotName,
      status: ExtrinsicStatus.loading,
      message: null,
    );

    notificationsBloc.add(
      AddNotification(notificationLoading),
    );

    final res = await repository.putObject(
      params: params,
      updateStatus: () {
        params.updateStatus();
      },
      msgIdCallback: (final msgId) {
        appServiceLoaderCubit.state.plugin.sdk.api.service.webView!
            .addGlobalHandler(
          PutObjectGlobalHandler(
            msgId: msgId,
            notificationsBloc: notificationsBloc,
            initialN: notificationLoading,
            webViewRunner:
                appServiceLoaderCubit.state.plugin.sdk.api.service.webView!,
          ),
        );
      },
    );
    // return null;
  }
}

class PutObjectParams {
  const PutObjectParams({
    required this.account,
    required this.password,
    required this.nApprovals,
    required this.pathToFile,
    required this.categoryFabric,
    required this.hashes,
    required this.propValues,
    required this.updateStatus,
    required this.localSnapshotName,
  });

  final KeyPairData account;
  final String password;
  final int nApprovals;
  final String pathToFile;
  final MapPoscanCategory categoryFabric;
  final List<String> hashes;
  final List<PropValue>? propValues;
  final void Function() updateStatus;
  final String localSnapshotName;
}
