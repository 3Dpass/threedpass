import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/p3d/tx_info.dart';
import 'package:polkawallet_sdk/p3d/tx_params.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/polkawallet/utils/tx_update_event_logs_handler.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/data/repositories/transaction.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_type_enum.dart';

class Transfer extends UseCase<void, TransferUseCaseParams> {
  final NotificationsBloc notificationsBloc;
  final AppService appService;

  const Transfer({
    required this.appService,
    required this.notificationsBloc,
  });

  Future<bool> checkAddressAndNotify(
    final AppService appService,
    final String toAddress,
  ) async {
    final addressCorrect =
        await appService.plugin.sdk.api.account.checkAddressFormat(
      toAddress,
      appService.networkStateData.ss58Format!,
    );

    if (addressCorrect == null) {
      unawaited(Fluttertoast.showToast(msg: 'could_not_check_address'.tr()));
      return false;
    }

    if (!addressCorrect) {
      unawaited(Fluttertoast.showToast(msg: 'wrong_address'.tr()));
      return false;
    }

    return true;
  }

  Future<bool> checkAllAddresses(
    final AppService appService,
    final List<TxParams> params,
  ) async {
    for (final p in params) {
      if (!await checkAddressAndNotify(appService, p.toAddress)) {
        return false;
      }
    }

    return true;
  }

  void msgIdCallback(
    final Map<List<String>, String> dict,
    final List<NotificationTransfer> notifications,
  ) {
    // print('msgIdCallback: ${dict}');
    for (int i = 0; i < notifications.length; ++i) {
      appService.plugin.sdk.api.service.webView!.addGlobalHandler(
        TxUpdateEventLogsHandler(
          msgId: dict.values.elementAt(i),
          // notificationsBloc: notificationsBloc,
          // initialN: notif,
          webViewRunner: appService.plugin.sdk.api.service.webView!,
          setTransactionResult: ({
            required final String? message,
            required final ExtrinsicStatus status,
          }) {
            // final a = notifications[i];
            final finishedTransaction = notifications[i].copyWith(
              status: status,
              message: message,
              blockDateTime: DateTime.now(),
            );
            notificationsBloc.add(
              UpdateNotification(
                newN: finishedTransaction,
                oldN: notifications[i],
              ),
            );
          },
        ),
      );
    }
  }

  void msgIdBatchCallback(
    final Map<List<String>, String> dict,
    final NotificationTransferBatch notification,
  ) {
    // print('msgIdBatchCallback: ${dict}');
    final msgId = dict.values.first;
    appService.plugin.sdk.api.service.webView!.addGlobalHandler(
      TxUpdateEventLogsHandler(
        msgId: msgId,
        webViewRunner: appService.plugin.sdk.api.service.webView!,
        setTransactionResult: ({
          required final String? message,
          required final ExtrinsicStatus status,
        }) {
          // logger
          //     .w('Update batch notification: $message $status $msgId');
          final finishedTransaction = notification.copyWith(
            status: status,
            message: message,
            blockDateTime: DateTime.now(),
          );
          notificationsBloc.add(
            UpdateNotification(
              newN: finishedTransaction,
              oldN: notification,
            ),
          );
        },
      ),
    );
  }

  NotificationTransferBatch addBatchNotification(
    final List<TransferTxInfoI> metaInfos,
    final String symbols,
  ) {
    final txParams = metaInfos.map((final e) => e.params()).toList();
    final toAddresses = txParams.map((final e) => e.toAddress).toList();
    final amounts = txParams
        .map((final e) => e.amount)
        .map((final e) => e.toString())
        .toList();

    final res = NotificationTransferBatch(
      status: ExtrinsicStatus.loading,
      toAddress: toAddresses,
      fromAddress: metaInfos.first.senderData.address!,
      amount: amounts,
      symbols: symbols,
      blockDateTime: null,
      message: null,
    );

    notificationsBloc.add(AddNotification(res));
    return res;
  }

  List<NotificationTransfer> createNotifications(
    final List<TransferTxInfoI> metaInfos,
    final String symbols,
  ) {
    final notifications = <NotificationTransfer>[];
    final fromAddress =
        metaInfos.map((final e) => e.txInfo().sender!.address!).toList();

    final txParams = metaInfos.map((final e) => e.params()).toList();
    final toAddresses = txParams.map((final e) => e.toAddress).toList();
    final amounts = txParams
        .map((final e) => e.amount)
        .map((final e) => e.toString())
        .toList();

    for (int i = 0; i < metaInfos.length; i++) {
      notifications.add(
        NotificationTransfer(
          status: ExtrinsicStatus.loading,
          toAddress: toAddresses[i],
          fromAddress: fromAddress[i],
          amount: amounts[i],
          symbols: symbols,
          blockDateTime: null,
          message: null,
        ),
      );
    }
    logger.t('Created ${notifications.length} notifications');
    for (final n in notifications) {
      notificationsBloc.add(AddNotification(n));
    }

    return notifications;
  }

  @override
  Future<Either<Failure, void>> call(final TransferUseCaseParams params) async {
    final txParams = params.metaInfos.map((final e) => e.params()).toList();
    final addressCorrect = await checkAllAddresses(appService, txParams);

    if (!addressCorrect) {
      return Either.left(BadDataFailure('Wrong address'));
    }
    logger.t(
      'TransferUseCase: metas=${params.metaInfos.length}, type: ${params.transferType}',
    );
    late final Map<dynamic, dynamic> res;
    switch (params.transferType) {
      case TransferType.oneToOne:
        final notifications = createNotifications(
          params.metaInfos,
          params.symbols,
        );
        res = await SingleTransaction(
          appService: appService,
          password: params.passwords.first,
          txInfoMeta: params.metaInfos.first,
          onStatusChange: params.onStatusChange,
          msgIdCallback: (final msgId) => msgIdCallback(msgId, notifications),
        ).useApi();
        break;
      case TransferType.manyToOne:
        final notifications = createNotifications(
          params.metaInfos,
          params.symbols,
        );
        res = await MultiTxMultiSender(
          appService: appService,
          txInfoMetas: params.metaInfos,
          passwords: params.passwords,
          onStatusChange: params.onStatusChange,
          msgIdCallback: (final msgId) => msgIdCallback(msgId, notifications),
        ).useApi();
        break;
      case TransferType.oneToMany:
        final notif = addBatchNotification(params.metaInfos, params.symbols);
        res = await MultiTxSingleSender(
          appService: appService,
          txInfoMetas: params.metaInfos,
          password: params.passwords.first,
          onStatusChange: params.onStatusChange,
          msgIdCallback: (final msgId) => msgIdBatchCallback(msgId, notif),
        ).useApi();
        break;
    }
    // print('Finish TransferUseCase, res: $res');
    // final String key = res.keys.first as String;
    if (res['title'] == 'error') {
      return Either.left(BadDataFailure(res['message'].toString()));
    } else {
      return const Either.right(null);
    }
  }
}

class TransferUseCaseParams {
  final List<TransferTxInfoI> metaInfos;
  final List<String> passwords;
  final String symbols;
  final int decimals;
  final TransferType transferType;
  final void Function(String) onStatusChange;

  const TransferUseCaseParams({
    required this.decimals,
    required this.metaInfos,
    required this.passwords,
    required this.symbols,
    required this.transferType,
    required this.onStatusChange,
  });
}
