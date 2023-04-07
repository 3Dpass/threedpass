import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class NonNativeTokenMint extends NonNativeTokenHistoryAtomBase {
  const NonNativeTokenMint({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.value,
  });

  final String value;

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.mint;
}
