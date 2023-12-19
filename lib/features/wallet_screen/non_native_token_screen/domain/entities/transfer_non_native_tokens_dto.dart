import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class TransfersNonNativeTokenDTO {
  final List<NonNativeTokenHistoryAtomBase> objects;
  final String nextPageKey;

  const TransfersNonNativeTokenDTO({
    required this.objects,
    required this.nextPageKey,
  });
}
