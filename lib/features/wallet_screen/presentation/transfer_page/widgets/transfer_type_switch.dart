import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_bloc.dart';

class TransferTypeSwitch extends StatelessWidget {
  const TransferTypeSwitch({
    final Key? key,
  }) : super(key: key);

  void onChanged(final BuildContext context, final TransactionOption? value) {
    if (value != null) {
      BlocProvider.of<TransferInfoBloc>(context)
          .add(UpdateTransferTypeEvent(value));
    }
  }

  @override
  Widget build(final BuildContext context) {
    final initialValue =
        BlocProvider.of<TransferInfoBloc>(context).state.transactionOption ==
            TransactionOption.transferKeepAlive;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: D3pSwitchButton(
        initialValue: initialValue,
        helpText: 'transfer_keep_alive_help'.tr(),
        onChanged: (final value) => onChanged(
          context,
          value
              ? TransactionOption.transferKeepAlive
              : TransactionOption.transfer,
        ),
        text: 'choose_transfer_keep_alive'.tr(),
      ),
    );
  }
}