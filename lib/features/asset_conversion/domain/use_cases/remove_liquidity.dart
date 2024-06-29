import 'package:polkawallet_sdk/service/webViewRunner.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class RemoveLiquidity extends UseCase<void, RemoveLiquidityParams> {
  final AssetConversionRepository assetConversionRepository;
  final NotificationsBloc notificationsBloc;
  final WebViewRunner webViewRunner;
  final PoolsCubit poolsCubit;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const RemoveLiquidity({
    required this.assetConversionRepository,
    required this.notificationsBloc,
    required this.webViewRunner,
    required this.poolsCubit,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Either<Failure, void>> call(
    final RemoveLiquidityParams params,
  ) async {
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

class RemoveLiquidityParams {
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final KeyPairData account;
  final String password;
  final void Function() updateStatus;
  final BigInt lpTokenBurn;
  final BigInt amount1Min;
  final BigInt amount2Min;

  const RemoveLiquidityParams({
    required this.asset1,
    required this.asset2,
    required this.updateStatus,
    required this.account,
    required this.password,
    required this.lpTokenBurn,
    required this.amount1Min,
    required this.amount2Min,
  });
}
