import 'package:decimal/decimal.dart';
import 'package:polkawallet_sdk/service/webViewRunner.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/add_liquidity_global_handler.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class AddLiquidity extends UseCase<void, AddLiquidityParams> {
  final AssetConversionRepository assetConversionRepository;
  final NotificationsBloc notificationsBloc;
  final WebViewRunner webViewRunner;
  final PoolsCubit poolsCubit;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  const AddLiquidity({
    required this.assetConversionRepository,
    required this.notificationsBloc,
    required this.webViewRunner,
    required this.poolsCubit,
    required this.appServiceLoaderCubit,
  });

  @override
  Future<Either<Failure, void>> call(
    final AddLiquidityParams params,
  ) async {
    final notificationLoading = NotificationAddLiquidity(
      status: ExtrinsicStatus.loading,
      message: null,
      params: params,
    );

    notificationsBloc.add(
      AddNotification(notificationLoading),
    );

    final res = await assetConversionRepository.addLiquidity(
      params: params,
      msgIdCallback: (final msgId) {
        webViewRunner.addGlobalHandler(
          AddLiquidityGlobalHandler(
            msgId: msgId,
            notificationsBloc: notificationsBloc,
            initialN: notificationLoading,
            webViewRunner: webViewRunner,
            poolsCubit: poolsCubit,
            appServiceLoaderCubit: appServiceLoaderCubit,
          ),
        );
      },
    );
    return res;
  }
}

class AddLiquidityParams {
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final KeyPairData account;
  final String password;
  final void Function() updateStatus;
  final Decimal amount1Desired;
  final Decimal amount2Desired;
  final Decimal amount1Min;
  final Decimal amount2Min;

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
