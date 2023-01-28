import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer.dart';

part './widgets/make_transfer_button.dart';
part 'widgets/from_address_textfield.dart';
part 'widgets/to_address_textfield.dart';
part 'widgets/amount_textfield.dart';
part 'widgets/password_textfield.dart';
part 'widgets/fees_text.dart';

class TransferPage extends StatelessWidget {
  TransferPage({
    final Key? key,
  }) : super(key: key);

  final toAddressController = TextEditingController();
  final amountController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return Scaffold(
      appBar: CommonLogoAppbar(
        // TODO Add back button
        title: 'recieve_page_title'.tr(),
        theme: Theme.of(context),
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
                      const _FromAddressTextField(),
                      const SizedBox(height: 24),
                      _ToAddressTextField(
                        toAddressController: toAddressController,
                      ),
                      const SizedBox(height: 24),
                      _AmountTextFieldBuilder(
                        amountController: amountController,
                      ),
                      const SizedBox(height: 24),
                      _PasswordTextField(
                        passwordController: passwordController,
                      ),
                      // const SizedBox(height: 24),
                      // const _FeesText(),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _MakeTransferButton(
            toAddressController: toAddressController,
            amountController: amountController,
            passwordController: passwordController,
            formKey: _formKey,
            appService: appService,
          ),
        ],
      ),
    );
  }
}
