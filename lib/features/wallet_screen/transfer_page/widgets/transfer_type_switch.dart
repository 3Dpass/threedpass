import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/p3d/balance_transaction_type.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';

class TransferTypeSwitch extends StatelessWidget {
  const TransferTypeSwitch({
    final Key? key,
  }) : super(key: key);

  void onChanged(
    final BuildContext context,
    final BalanceTransactionType? value,
  ) {
    if (value != null) {
      BlocProvider.of<TransferInfoBloc>(context)
          .add(UpdateTransferTypeEvent(value));
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<TransferInfoBloc, TransferInfoBlocState>(
        builder: (
          final context,
          final state,
        ) =>
            D3pSwitchButton(
          value: state.transactionOption ==
              BalanceTransactionType.transferKeepAlive,
          helpText: 'transfer_keep_alive_help'.tr(),
          onChanged: (final value) =>
              BlocProvider.of<TransferInfoBloc>(context).add(
            UpdateTransferTypeEvent(
              value
                  ? BalanceTransactionType.transferKeepAlive
                  : BalanceTransactionType.transfer,
            ),
          ),
          text: 'choose_transfer_keep_alive'.tr(),
        ),
      ),
    );
  }
}
