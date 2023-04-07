import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class NonNativeTokenSetMetaData extends NonNativeTokenHistoryAtomBase {
  const NonNativeTokenSetMetaData({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
  });

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.set_metadata;
}
