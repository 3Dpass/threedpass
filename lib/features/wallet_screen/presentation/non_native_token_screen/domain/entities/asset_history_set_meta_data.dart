import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

part 'asset_history_set_meta_data.g.dart';

@CopyWith()
class AssetHistorySetMetadata extends NonNativeTokenHistoryAtomBase {
  const AssetHistorySetMetadata({
    required super.blockDatetime,
    required super.extrinsicIdx,
    required super.authorAddress,
    required this.decimals,
    required this.name,
    required this.symbol,
    required super.extrisincStatus,
    required super.blockNumber,
  });

  final String decimals;
  final String symbol;
  final String name;

  @override
  NonNativeTokenExtrinsicType get extrinsicType =>
      NonNativeTokenExtrinsicType.set_metadata;
}
