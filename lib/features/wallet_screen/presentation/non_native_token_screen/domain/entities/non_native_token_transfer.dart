import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class NonNativeTokenTransfer extends NonNativeTokenHistoryAtomBase {
  const NonNativeTokenTransfer({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.value,
    required this.targetAddress,
    required this.isFrom,
    required this.symbols,
  });

  final String value;
  final String targetAddress;
  final bool isFrom;
  final String symbols;

  TransferHistoryUI transferHistoryUI() {
    return TransferHistoryUI(
      amount: value,
      blockDateTime: blockDatetime,
      fromAddress: authorAddress,
      isFrom: isFrom,
      symbols: symbols,
      toAddress: targetAddress,
      extrisincStatus: null,
      // TODO Extrinsic status
    );
  }

  //     TransactionItem(
  //   object: MapperTransferNonNativeTokenAtom.fromNonNativeTransfer(
  //     item: item,
  //   ),
  // ),

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.transfer;
}
