import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/to_card_basic.dart';

class ToCardManyToOne extends StatelessWidget {
  const ToCardManyToOne({
    required this.data,
    super.key,
  });

  final ToAddressData data;

  @override
  Widget build(final BuildContext context) {
    return BasicTransferBlock(
      child: ToCardBasic(
        data: data,
      ),
    );
  }
}
