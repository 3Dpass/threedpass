import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/input/textformfield.dart';

class TransferPage extends StatelessWidget {
  TransferPage({
    Key? key,
    required AppService appService,
  })  : balance = BalanceUtils.bigIntToDouble(
          BalanceUtils.balanceInt(appService.balance.value.availableBalance),
          appService.networkStateData.safeDecimals,
        ),
        super(key: key);

  final toAddressController = TextEditingController(
      text: 'd7bWgA9pmk6V48nnwqsxEWzE8LWqACChF3YY5jbLYXEbL7Pqc');
  final amountController = TextEditingController(text: '1');
  final passwordController = TextEditingController(text: '123q123');
  final _formKey = GlobalKey<FormState>();

  // final BalanceData balanceData;
  final double balance;

  String? _passValidator(String? v) {
    // return null;
    return v != null && checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  String? _amountValidator(String? v) {
    return v != null && double.tryParse(v) != null && double.parse(v) <= balance
        ? null
        : 'error_wrong_amount'.tr();
  }

  Future<void> sendAmount(AppService appService) async {
    if (_formKey.currentState!.validate()) {
      final sender = TxSenderData(
        appService.keyring.current.address,
        appService.keyring.current.pubKey,
      );
      final txInfo = TxInfoData('balances', 'transfer', sender);
      final realAmount = BalanceUtils.tokenInt(
        amountController.text,
        appService.networkStateData.safeDecimals,
      );
      final res = appService.plugin.sdk.api.tx.signAndSend(
        txInfo,
        [
          // params.to
          toAddressController.text,
          // params.amount
          realAmount.toString(),
        ],
        passwordController.text,
        onStatusChange: (p0) => print(p0),
      );
      final b = 1 + 1;
    } else {}
  }

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'from_address_label'.tr(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      D3pTextFormField(
                        controller: TextEditingController(
                          text: Fmt.shorterAddress(
                            appService.keyring.current.address,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'to_address_label'.tr(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      D3pTextFormField(
                        controller: toAddressController,
                        maxLines: 1,
                        hintText: 'to_address_hint'.tr(),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'amount_label'.tr(
                          args: [
                            BalanceUtils.balance(
                              appService.balance.value.availableBalance,
                              appService.networkStateData.safeDecimals,
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      D3pTextFormField(
                        controller: amountController,
                        hintText: 'amount_hint'.tr(),
                        validator: _amountValidator,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'enter_password_label'.tr(
                          args: [
                            BalanceUtils.balance(
                              appService.balance.value.availableBalance,
                              appService.networkStateData.safeDecimals,
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      D3pTextFormField(
                        controller: passwordController,
                        hintText: 'enter_password_hint'.tr(),
                        validator: _passValidator,
                        obscureText: true,
                        // hintText: 'amount_hint'.tr(),
                      ),

                      // TODO Calc fees
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
            ),
          ),
          D3pElevatedButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            text: 'make_transfer_label'.tr(),
            onPressed: () => sendAmount(appService),
          ),
        ],
      ),
    );
  }
}
