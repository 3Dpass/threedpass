import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
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
    return BlocBuilder<TransferInfoCubit, TransferInfo>(
      builder: (final context, final state) {
        final items = TransferType.values
            .map(
              (final e) => DropdownMenuItem<TransferType>(
                value: e,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: D3pBodyMediumText(
                    e.name,
                    translate: false,
                  ),
                ),
              ),
            )
            .toList();
        final value = state.type;

        return D3pDropdownButton<TransferType>(
          context: context,
          items: items,
          onChanged: (final TransferType? value) => onChanged(context, value),
          value: value,
        );
      },
    );
  }
}
