import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class AssetHistoryUnkown extends NonNativeTokenHistoryAtomBase {
  const AssetHistoryUnkown({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.arguments,
    required this.callModule,
  });

  final String callModule;
  final String arguments;

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.unknown;
}
