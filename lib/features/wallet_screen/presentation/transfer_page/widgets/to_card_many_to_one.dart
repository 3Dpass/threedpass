import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/utils/dismiss_function.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/to_card_basic.dart';

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
      dismiss: dismiss,
      child: ToCardBasic(
        data: data,
      ),
    );
  }
}
