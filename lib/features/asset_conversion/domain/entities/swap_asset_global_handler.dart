import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

class SwapAssetGlobalHandler
    extends PrimitiveEventLogsHandler<NotificationSwapAssets> {
  const SwapAssetGlobalHandler({
    required super.msgId,
    required super.notificationsBloc,
    required super.initialN,
    required super.webViewRunner,
    required this.poolsCubit,
    required this.poscanAssetsCubit,
    required this.appServiceLoaderCubit,
  });

  final PoolsCubit poolsCubit;
  final PoscanAssetsCubit poscanAssetsCubit;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  @override
  NotificationSwapAssets customCopyWith(
    final NotificationSwapAssets initialN,
    final ExtrinsicStatus status,
    final String? message,
  ) {
    return initialN.copyWith(status: status, message: message);
  }

  @override
  void onExtrinsicSuccess() {
    poolsCubit.update(
      address: appServiceLoaderCubit.state.keyring.current.address!,
    );
    poscanAssetsCubit.updateBalances();
    super.onExtrinsicSuccess();
  }
}
