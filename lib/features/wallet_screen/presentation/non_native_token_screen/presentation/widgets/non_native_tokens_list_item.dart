import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_create.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_mint.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_set_meta_data.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/non_native_token_unknown.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/widgets/non_native_token_create_widget.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/widgets/non_native_token_mint_widget.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/widgets/non_native_token_set_metadata_widget.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/widgets/non_native_token_unknown_widget.dart';

class NonNativeTokensListItem extends StatelessWidget {
  final NonNativeTokenHistoryAtomBase data;

  const NonNativeTokensListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (data.extrinsicType) {
      case NonNativeTokenExtrinsicType.create:
        return NonNativeTokenCreateWidget(data as NonNativeTokenCreate);

      case NonNativeTokenExtrinsicType.set_metadata:
        return NonNativeTokenSetMetadataWidget(
          data as NonNativeTokenSetMetaData,
        );

      case NonNativeTokenExtrinsicType.mint:
        return NonNativeTokenMintWidget(data as NonNativeTokenMint);

      case NonNativeTokenExtrinsicType.transfer:
      case NonNativeTokenExtrinsicType.unknown:
        return NonNativeTokenUnknownWidget(data as NonNativeTokenUnkown);
    }
  }
}
