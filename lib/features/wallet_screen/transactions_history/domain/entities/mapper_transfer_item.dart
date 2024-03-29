import 'package:polkawallet_sdk/api/types/networkStateData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfer_item.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_history_ui.dart';

class MapperTransferItemToUI {
  static TransferHistoryUI fromP3DTransfer({
    required final TransferItem item,
    required final NetworkStateData data,
    required final bool isFrom,
  }) {
    final moneyStr = BalanceUtils.balance(
      item.autoGeneratedObject.value?.toInt().toString() ?? '',
      data.safeDecimals,
    );
    return TransferHistoryUI(
      amount: moneyStr,
      blockDateTime:
          DateTime.parse(item.autoGeneratedObject.blockDatetime?.value ?? ''),
      fromAddress: item.fromAddress.toString(),
      toAddress: item.toAddress.toString(),
      symbols: data.tokenSymbol?.first ?? '',
      direction: isFrom ? TransferDirection.from : TransferDirection.to,
      extrisincStatus: null,
      decimals: data.safeDecimals,
    );
  }
}
