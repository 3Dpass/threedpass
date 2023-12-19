import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfer_item.dart';

class TransfersDTO {
  final List<TransferItem> objects;
  final String nextPageKey;

  const TransfersDTO({
    required this.objects,
    required this.nextPageKey,
  });
}
