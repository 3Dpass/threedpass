import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/utils/dismiss_function.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/amount_textfield.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/to_card_basic.dart';

class ToCardOneToMany extends StatelessWidget {
  const ToCardOneToMany({
    required this.data,
    required this.sendAmountData,
    required this.metaInfoType,
    required this.isFirst,
    super.key,
  });

  final ToAddressData data;
  final MetaInfoType metaInfoType;
  final SendAmountData sendAmountData;
  final bool isFirst;

  @override
  Widget build(final BuildContext context) {
    final dismissFunctionFabric = DismissFunctionFabric(context);
    final dismiss = isFirst ? null : dismissFunctionFabric.buildToAddress(data);
    final bloc = BlocProvider.of<TransferInfoBloc>(context);

    return BasicTransferBlock(
      child: Column(
        children: [
          ToCardBasic(data: data),
          const H8(),
          AmountTextFieldBuilder(
            amountController: sendAmountData.amountController,
            transferType: metaInfoType,
            address: bloc.state.fromAddresses.first.data?.address ?? '',
          ),
        ],
      ),
      dismiss: dismiss,
    );
  }
}
