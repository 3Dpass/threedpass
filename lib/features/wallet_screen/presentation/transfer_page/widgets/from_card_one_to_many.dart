import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/utils/dismiss_function.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_card_basic.dart';

class FromCardOneToMany extends StatelessWidget {
  const FromCardOneToMany({
    required this.data,
    required this.isFirst,
    super.key,
  });

  final FromAddressData data;
  final bool isFirst;

  @override
  Widget build(final BuildContext context) {
    final dismissFunctionFabric = DismissFunctionFabric(context);
    final dismiss =
        isFirst ? null : dismissFunctionFabric.buildFromAddress(data);
    return BasicTransferBlock(
      dismiss: dismiss,
      child: FromCardBasic(
        data: data,
        isFirst: isFirst,
      ),
    );
  }
}
