import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/add_card_basic.dart';

class AddFromCardRow extends StatelessWidget {
  const AddFromCardRow({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final transferInfoBloc = BlocProvider.of<TransferInfoBloc>(context);
    final appServiceLoaderCubit =
        BlocProvider.of<AppServiceLoaderCubit>(context);
    final accAmount = appServiceLoaderCubit.state.keyring.allAccounts.length;

    return AddCardRowBasic(
      onPressed: () => transferInfoBloc.add(const AddFromAddressEvent()),
      unlocalizedText: 'add_account_from_label',
      condition: (final state) =>
          state.screenType == TransferScreenType.many_to_one &&
          state.fromAddresses.length < accAmount,
    );
  }
}
