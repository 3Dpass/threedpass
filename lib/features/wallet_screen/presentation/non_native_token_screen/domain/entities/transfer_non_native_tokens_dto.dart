import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class TransfersNonNativeTokenDTO {
  final List<TransferNonNativeTokenAtom> objects;
  final String nextPageKey;

  const TransfersNonNativeTokenDTO({
    required this.objects,
    required this.nextPageKey,
  });
}
