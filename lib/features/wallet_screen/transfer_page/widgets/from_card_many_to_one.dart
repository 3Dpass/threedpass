import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/utils/dismiss_function.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/amount_textfield.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/from_card_basic.dart';

class FromCardManyToOne extends StatelessWidget {
  const FromCardManyToOne({
    required this.data,
    required this.sendAmountData,
    required this.metaInfoType,
    required this.isFirst,
    super.key,
  });

  final FromAddressData data;
  final MetaInfoType metaInfoType;
  final SendAmountData sendAmountData;
  final bool isFirst;

  @override
  Widget build(final BuildContext context) {
    final dismissFunctionFabric = DismissFunctionFabric(context);
    final dismiss =
        isFirst ? null : dismissFunctionFabric.buildFromAddress(data);
    return BasicTransferBlock(
      dismiss: dismiss,
      child: Column(
        children: [
          FromCardBasic(
            data: data,
            isFirst: isFirst,
          ),
          const SizedBoxH4(),
          AmountTextFieldBuilder(
            amountController: sendAmountData.amountController,
            transferType: metaInfoType,
            address: data.data?.address ?? '',
          ),
        ],
      ),
    );
  }
}
