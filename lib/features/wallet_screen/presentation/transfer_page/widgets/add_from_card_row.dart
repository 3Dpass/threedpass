import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/add_card_basic.dart';

class AddFromCardRow extends StatelessWidget {
  const AddFromCardRow({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final transferInfoCubit = BlocProvider.of<TransferInfoCubit>(context);
    // print(transferInfoCubit.state.fromAddresses.length);
    // print(transferInfoCubit.state.toAddresses.length);

    return AddCardRowBasic(
      onPressed: () => transferInfoCubit.addFromAddress(),
      unlocalizedText: 'add_account_from_label',
      condition: (final state) =>
          state.screenType == TransferScreenType.many_to_one,
    );
  }
}
