import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/utils/dismiss_function.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/to_card_basic.dart';

class ToCardManyToOne extends StatelessWidget {
  const ToCardManyToOne({
    required this.data,
    required this.isFirst,
    super.key,
  });

  final ToAddressData data;
  final bool isFirst;

  @override
  Widget build(final BuildContext context) {
    final dismissFunctionFabric = DismissFunctionFabric(context);
    final dismiss = isFirst ? null : dismissFunctionFabric.buildToAddress(data);

    return BasicTransferBlock(
      child: ToCardBasic(data: data),
      dismiss: dismiss,
    );
  }
}
