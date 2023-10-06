import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_card_basic.dart';

class FromCardOneToMany extends StatelessWidget {
  const FromCardOneToMany({
    required this.data,
    super.key,
  });

  final FromAddressData data;

  @override
  Widget build(final BuildContext context) {
    return BasicTransferBlock(
      child: FromCardBasic(
        data: data,
      ),
    );
  }
}
