import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/amount_textfield.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_card_basic.dart';

class FromCardManyToOne extends StatelessWidget {
  const FromCardManyToOne({
    required this.data,
    required this.sendAmountData,
    required this.metaInfoType,
    super.key,
  });

  final FromAddressData data;
  final MetaInfoType metaInfoType;
  final SendAmountData sendAmountData;

  @override
  Widget build(final BuildContext context) {
    return BasicTransferBlock(
      child: Column(
        children: [
          FromCardBasic(
            data: data,
          ),
          const SizedBoxH4(),
          AmountTextFieldBuilder(
            amountController: sendAmountData.amountController,
            transferType: metaInfoType,
            balance: 0, // TODO
          ),
        ],
      ),
    );
  }
}
