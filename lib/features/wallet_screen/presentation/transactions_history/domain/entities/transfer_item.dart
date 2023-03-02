import 'package:threedp_graphql/features/transfers_history/data/query/__generated__/get_transfers.data.gql.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';

class TransferItem {
  final GGetTransfersData_getTransfers_objects autoGeneratedObject;
  final String? fromAddress;
  final String? toAddress;

  const TransferItem._(
    this.autoGeneratedObject, {
    this.fromAddress,
    this.toAddress,
  });

  static Future<TransferItem> fromAutoGeneratedObject(
    final GGetTransfersData_getTransfers_objects autoGeneratedObject,
    final AppService appService,
  ) async {
    final service = appService.plugin.sdk.api.account.service;
    final ss58Format = appService.networkStateData.ss58Format;
    final fromAccountId = autoGeneratedObject.fromMultiAddressAccountId;
    final toAccountId = autoGeneratedObject.toMultiAddressAccountId;

    late final String? fromAddress;
    late final String? toAddress;

    // I know this is not debuggable and unreadable. But this is the way it works.
    try {
      final d1 = await service.encodeAddress([fromAccountId!], [ss58Format]);
      fromAddress = d1![ss58Format.toString()][fromAccountId] as String;
    } on Object {
      fromAddress = null;
    }

    try {
      final d1 = await service.encodeAddress([toAccountId!], [ss58Format]);
      toAddress = d1![ss58Format.toString()][toAccountId] as String;
    } on Object {
      toAddress = null;
    }

    return TransferItem._(
      autoGeneratedObject,
      fromAddress: fromAddress,
      toAddress: toAddress,
    );
  }
}
