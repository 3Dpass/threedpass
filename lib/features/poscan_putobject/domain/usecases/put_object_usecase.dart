import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_repository.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/put_object_global_handler.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class PutObject extends UseCase<void, PutObjectParams> {
  final PoScanRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const PutObject({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Either<Failure, void>> call(
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

    // updateNotification(notificationLoading, res, innerFastCheckPassed);

    return res;
  }

  /// Set the result of extrinsic
  // void updateNotification(
  //   final NotificationPutObject initialN,
  //   final Either<Failure, void> res,
  //   final bool innerFastCheckPassed,
  // ) {
  //   res.when(
  //     left: (final e) {
  //       final notificationError = initialN.copyWith(
  //         status: innerFastCheckPassed
  //             ? ExtrinsicStatus.failed
  //             : ExtrinsicStatus.error,
  //         message: e.cause,
  //       );
  //       notificationsBloc.add(
  //         UpdateNotification(
  //           newN: notificationError,
  //           oldN: initialN,
  //         ),
  //       );
  //     },
  //     right: (final res) {
  //       // Just close loading dialog and exit from putobject screnn
  //     },
  //   );
  // }
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
