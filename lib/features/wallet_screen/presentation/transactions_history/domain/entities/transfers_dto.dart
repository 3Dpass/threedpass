import 'package:threedpass/features/wallet_screen/presentation/transactions_history/data/query/__generated__/get_transfers.data.gql.dart';

class TransfersDTO {
  final List<GGetTransfersData_getTransfers_objects> objects;
  final String nextPageKey;

  const TransfersDTO({
    required this.objects,
    required this.nextPageKey,
  });
}
