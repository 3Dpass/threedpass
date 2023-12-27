import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

part 'asset_history_unknown.g.dart';

@CopyWith()
class AssetHistoryUnkown extends NonNativeTokenHistoryAtomBase {
  const AssetHistoryUnkown({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.arguments,
    required this.callModule,
    required super.extrisincStatus,
    required super.blockNumber,
  });

  final String callModule;
  final String arguments;

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.unknown;
}
