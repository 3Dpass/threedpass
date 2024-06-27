import 'package:polkawallet_sdk/service/webViewRunner.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class AddLiquidity extends UseCase<void, AddLiquidityParams> {
  final AssetConversionRepository assetConversionRepository;
  final NotificationsBloc notificationsBloc;
  final WebViewRunner webViewRunner;

  const AddLiquidity({
    required this.assetConversionRepository,
    required this.notificationsBloc,
    required this.webViewRunner,
  });

  @override
  Future<Either<Failure, void>> call(
    final AddLiquidityParams params,
  ) async {
    // if (params.asset1.isNative && params.asset2.isNative) {
    //   return const Either.left(
    //     BadDataFailure('Impossible to create pool of two native assets'),
    //   );
    // }

    // final notificationLoading = NotificationCreatePool(
    //   admin: params.account,
    //   asset1: params.asset1,
    //   asset2: params.asset2,
    //   status: ExtrinsicStatus.loading,
    //   message: null,
    // );

    // notificationsBloc.add(
    //   AddNotification(notificationLoading),
    // );

    // final res = await assetConversionRepository.createPool(
    //   params: params,
    //   updateStatus: params.updateStatus,
    //   msgIdCallback: (final msgId) {
    //     webViewRunner.addGlobalHandler(
    //       CreatePoolGlobalHandler(
    //         msgId: msgId,
    //         notificationsBloc: notificationsBloc,
    //         initialN: notificationLoading,
    //         webViewRunner: webViewRunner,
    //       ),
    //     );
    //   },
    // );
    // return res;
    return const Either.left(BadDataFailure('Not implemented'));
  }
}

class AddLiquidityParams {
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final KeyPairData account;
  final String password;
  final void Function() updateStatus;
  final BigInt amount1Desired;
  final BigInt amount2Desired;
  final BigInt amount1Min;
  final BigInt amount2Min;

  const AddLiquidityParams({
    required this.asset1,
    required this.asset2,
    required this.updateStatus,
    required this.account,
    required this.password,
    required this.amount1Desired,
    required this.amount2Desired,
    required this.amount1Min,
    required this.amount2Min,
  });
}
