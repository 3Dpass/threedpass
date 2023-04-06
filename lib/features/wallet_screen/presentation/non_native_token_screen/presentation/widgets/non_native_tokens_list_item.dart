import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';

class NonNativeTokensListItem extends StatelessWidget {
  final NonNativeTokenHistoryAtomBase data;

  const NonNativeTokensListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (data.extrinsicType) {
      case NonNativeTokenExtrinsicType.create:
        // TODO: Handle this case.
        break;
      case NonNativeTokenExtrinsicType.set_metadata:
        // TODO: Handle this case.
        break;
      case NonNativeTokenExtrinsicType.mint:
        // TODO: Handle this case.
        break;
      case NonNativeTokenExtrinsicType.transfer:
        // TODO: Handle this case.
        break;
      case NonNativeTokenExtrinsicType.unknown:
        // TODO: Handle this case.
        break;
    }
  }
}
