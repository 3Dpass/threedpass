import 'dart:async';

import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

class SetMetadataGlobalHandler
    extends PrimitiveEventLogsHandler<NotificationSetMetadata> {
  const SetMetadataGlobalHandler({
    required super.msgId,
    required super.notificationsBloc,
    required super.initialN,
    required super.webViewRunner,
    required this.poscanAssetsCubit,
  });

  final PoscanAssetsCubit poscanAssetsCubit;

  @override
  NotificationSetMetadata customCopyWith(
    final NotificationSetMetadata initialN,
    final ExtrinsicStatus status,
    final String? message,
  ) {
    return initialN.copyWith(status: status, message: message);
  }

  @override
  void onExtrinsicSuccess() {
    updateNotification(ExtrinsicStatus.success, null);
    unawaited(poscanAssetsCubit.init());
  }
}
