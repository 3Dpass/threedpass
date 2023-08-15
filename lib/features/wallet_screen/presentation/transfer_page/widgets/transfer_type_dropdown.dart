import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';

class TransferTypeDropdown extends StatelessWidget {
  const TransferTypeDropdown({
    final Key? key,
  }) : super(key: key);

  void onChanged(final BuildContext context, final TransferType? value) {
    if (value != null) {
      BlocProvider.of<TransferInfoCubit>(context).updateTransferType(value);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final initialValue =
        BlocProvider.of<TransferInfoCubit>(context).state.type ==
            TransferType.transferKeepAlive;
    return D3pSwitchButton(
      initialValue: initialValue,
      helpText: 'transfer_keep_alive_help'.tr(),
      onChanged: (final value) => onChanged(
        context,
        value ? TransferType.transferKeepAlive : TransferType.transfer,
      ),
      text: 'choose_transfer_keep_alive'.tr(),
    );
  }
}
