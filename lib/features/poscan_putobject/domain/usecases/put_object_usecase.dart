import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_repository.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class PutObject extends UseCase<void, PutObjectParams> {
  final PoScanRepository repository;
  final NotificationsBloc notificationsBloc;

  const PutObject({
    required this.repository,
    required this.notificationsBloc,
  });

  @override
  Future<Either<Failure, void>> call(
    final PutObjectParams params,
  ) async {
    bool innerFastCheckPassed = false;

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
      account: params.account,
      password: params.password,
      nApprovals: params.nApprovals,
      pathToFile: params.pathToFile,
      categoryFabric: params.categoryFabric,
      hashes: params.hashes,
      propValues: params.propValues,
      updateStatus: () {
        innerFastCheckPassed = true;
        params.updateStatus();
      },
    );

    updateNotification(notificationLoading, res, innerFastCheckPassed);

    return res;
  }

  /// Set the result of extrinsic
  void updateNotification(
    final NotificationPutObject initialN,
    final Either<Failure, void> res,
    final bool innerFastCheckPassed,
  ) {
    res.when(
      left: (final e) {
        final notificationError = initialN.copyWith(
          status: innerFastCheckPassed
              ? ExtrinsicStatus.failed
              : ExtrinsicStatus.error,
          message: e.cause,
        );
        notificationsBloc.add(
          UpdateNotification(
            newN: notificationError,
            oldN: initialN,
          ),
        );
      },
      right: (final _) {
        final notificationSuccess = initialN.copyWith(
          status: ExtrinsicStatus.success,
        );
        notificationsBloc.add(
          UpdateNotification(
            newN: notificationSuccess,
            oldN: initialN,
          ),
        );
      },
    );
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
