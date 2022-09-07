import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/input/textformfield.dart';

class TransferPage extends StatelessWidget {
  TransferPage({Key? key}) : super(key: key);

  final toAddressController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'recieve_page_title'.tr(),
      ),
      body: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text('from_address_label'.tr()),
                  D3pTextFormField(
                    controller: TextEditingController(
                      text: Fmt.shorterAddress(
                          appService.keyring.current.address),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('to_address_label'.tr()),
                  D3pTextFormField(
                    controller: toAddressController,
                    hintText: 'to_address_hint'.tr(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'amount_label'.tr(
                      args: [
                        BalanceUtils.balance(
                          appService.balance.value.availableBalance,
                          appService.networkStateData.safeDecimals,
                        ),
                      ],
                    ),
                  ),
                  D3pTextFormField(
                    controller: amountController,
                    hintText: 'amount_hint'.tr(),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
          D3pElevatedButton(
            text: 'make_transfer_label'.tr(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
