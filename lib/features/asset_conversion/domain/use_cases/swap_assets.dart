import 'package:polkawallet_sdk/service/webViewRunner.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_asset_global_handler.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class SwapAssets extends UseCase<void, SwapAssetsParams> {
  final AssetConversionRepository assetConversionRepository;
  final NotificationsBloc notificationsBloc;
  final WebViewRunner webViewRunner;
  final PoolsCubit poolsCubit;
  final PoscanAssetsCubit poscanAssetsCubit;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const SwapAssets({
    required this.assetConversionRepository,
    required this.notificationsBloc,
    required this.webViewRunner,
    required this.poolsCubit,
    required this.poscanAssetsCubit,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Either<Failure, void>> call(
    final SwapAssetsParams params,
  ) async {
    final notificationLoading = NotificationSwapAssets(
      status: ExtrinsicStatus.loading,
      message: null,
      params: params,
    );

    notificationsBloc.add(
      AddNotification(notificationLoading),
    );

    final res = await assetConversionRepository.swapAssets(
      params: params,
      msgIdCallback: (final msgId) {
        webViewRunner.addGlobalHandler(
          SwapAssetGlobalHandler(
            msgId: msgId,
            notificationsBloc: notificationsBloc,
            initialN: notificationLoading,
            webViewRunner: webViewRunner,
            poolsCubit: poolsCubit,
            poscanAssetsCubit: poscanAssetsCubit,
            appServiceLoaderCubit: appServiceLoaderCubit,
          ),
        );
      },
    );
    return res;
  }
}

class SwapAssetsParams {
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final KeyPairData account;
  final String password;
  final void Function() updateStatus;
  final BigInt amount1;
  final BigInt amount2;
  final bool keepAlive;
  final SwapMethod swapMethod;

  const SwapAssetsParams({
    required this.asset1,
    required this.asset2,
    required this.updateStatus,
    required this.account,
    required this.password,
    required this.keepAlive,
    required this.amount1,
    required this.amount2,
    required this.swapMethod,
  });
}
