import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class MintAsset extends UseCase<void, MintAssetParams> {
  final PoscanAssetsRepository repository;
  final NotificationsBloc notificationsBloc;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const MintAsset({
    required this.repository,
    required this.notificationsBloc,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Either<Failure, void>> call(
    final MintAssetParams params,
  ) async {
    final notificationLoading = NotificationPutObject(
      account: params.account,
      localSnapshotName: params.localSnapshotName,
      status: ExtrinsicStatus.loading,
      message: null,
    );

    // notificationsBloc.add(
    //   AddNotification(notificationLoading),
    // );

    final res = await repository.setMetadata();
    return res;
  }
}

class MintAssetParams {
  const MintAssetParams({
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
