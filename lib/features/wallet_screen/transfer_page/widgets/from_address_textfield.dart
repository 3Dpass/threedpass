import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';

class FromAddressTextField extends StatelessWidget {
  const FromAddressTextField({
    required this.data,
    super.key,
  });

  final FromAddressData data;

  void onAccountChoose(final BuildContext context, final KeyPairData? acc) {
    if (acc == null) {
      return;
    }
    final transferInfoCubit = BlocProvider.of<TransferInfoBloc>(context);
    transferInfoCubit
        .add(ChangeChosenAccountEvent(acc: acc, dataToChange: data));
    // Navigator.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) {
    // final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    // final theme = Theme.of(context);
    // Colors from https://github.com/flutter/flutter/blob/936763f58963ef3dd103986fc232310c43360344/packages/flutter/lib/src/material/input_decorator.dart#L4561

    final textStyle = Theme.of(context).customTextStyles;
    // final colors = Theme.of(context).customColors;

    final allAccounts = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .allAccounts;
    final chosenFromAddresses =
        BlocProvider.of<TransferInfoBloc>(context).state.fromAddresses;

    final accounts = AccountsList(
      allAccounts: allAccounts,
      chosenAccounts: chosenFromAddresses,
    ).buildListToChoose();

    if (data.data != null) {
      accounts.add(data.data!);
    }

    // final current = data.data != null
    //     ? accounts
    //         .firstWhere((element) => element.address == data.data!.address)
    //     : null;

    // final debug = data.data ?? accounts.first;
    // print(debug.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'from_address_label'.tr(),
          style: textStyle.hintStyle,
        ),
        const SizedBoxH4(),
        // BlocBuilder<TransferInfoBloc, TransferInfoBlocState>(
        //   builder: (context, state) =>
        D3pDropdownButton<KeyPairData>(
          context: context,
          isExpanded: true,
          items: accounts
              .map<DropdownMenuItem<KeyPairData>>(
                (final e) => DropdownMenuItem(
                  value: e,
                  child: AccountChooseTileText(
                    name: e.name,
                    address: e.address,
                  ),
                ),
              )
              .toList(),
          onChanged: (final obj) => onAccountChoose(context, obj),
          value: data.data,
          hint: 'from_address_dropdown_hint'.tr(),
          validator: (final value) => value == null
              ? 'account_never_null'.tr()
              : null, // TODO Status does not update after choose null acc and then choose valid
        ),
      ],
    );
  }
}

class AccountsList {
  final List<KeyPairData> allAccounts;
  final List<FromAddressData> chosenAccounts;

  const AccountsList({
    required this.allAccounts,
    required this.chosenAccounts,
  });

  List<KeyPairData> buildListToChoose() {
    final setOfChosen = <String>{};
    for (final i in chosenAccounts) {
      setOfChosen.add(i.data?.address ?? '');
    }
    final newList = List<KeyPairData>.from(allAccounts);

    newList
        .removeWhere((final element) => setOfChosen.contains(element.address));
    return newList;
  }
}
