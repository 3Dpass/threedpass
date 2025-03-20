// ignore_for_file: prefer-match-file-name
import 'dart:ui';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

typedef RepositoryCall<Params> = Future<void> Function({
  required Params params,
  required void Function() updateStatus,
  required void Function(String) msgIdCallback,
});

abstract class ExtrinsicUseCaseParams {
  VoidCallback get updateStatus;

  const ExtrinsicUseCaseParams();
}

abstract class CallExtrinsicUsecase<P extends ExtrinsicUseCaseParams,
    N extends NotificationDTO> extends UseCase<void, P> {
  N notificationLoading(P params);
  NotificationsBloc get notificationsBloc;
  RepositoryCall<P> get repositoryCall;
  AppServiceLoaderCubit get appServiceLoaderCubit;
  PrimitiveEventLogsHandler<N> globalHandler({
    required String msgId,
    required NotificationsBloc notificationsBloc,
    required N initialN,
  });

  const CallExtrinsicUsecase();

  @override
  Future<void> call(P params) async {
    final notification = notificationLoading(params);

    notificationsBloc.add(
      AddNotification(notification),
    );

    return await repositoryCall(
      params: params,
      updateStatus: params.updateStatus,
      msgIdCallback: (final msgId) {
        final webviewRunner =
            appServiceLoaderCubit.state.plugin.sdk.api.service.webView!;
        webviewRunner.addGlobalHandler(
          globalHandler(
            msgId: msgId,
            notificationsBloc: notificationsBloc,
            initialN: notification,
          ),
        );
      },
    );
  }
}
