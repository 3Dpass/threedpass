import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/add_card_basic.dart';

class AddToCardRow extends StatelessWidget {
  const AddToCardRow({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final transferInfoBloc = BlocProvider.of<TransferInfoBloc>(context);
    return AddCardRowBasic(
      onPressed: () => transferInfoBloc.add(const AddToAddressEvent()),
      unlocalizedText: 'add_account_to_label',
      condition: (final state) =>
          state.screenType == TransferScreenType.one_to_many ||
          state.fromAddresses.length == 1,
    );
  }
}
