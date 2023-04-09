import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class AssetHistorySetMetadata extends NonNativeTokenHistoryAtomBase {
  const AssetHistorySetMetadata({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.decimals,
    required this.name,
    required this.symbol,
  });

  final String decimals;
  final String symbol;
  final String name;

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.set_metadata;
}
