import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_block.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_textfield.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/from_address_textfield.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/transfer_type_dropdown.dart';

part './widgets/make_transfer_button.dart';
part 'widgets/to_address_textfield.dart';
part 'widgets/amount_textfield.dart';
part 'widgets/password_textfield.dart';

@RoutePage()
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
    final transferInfo = BlocProvider.of<TransferInfoCubit>(context);
    // appService.keyring.
    return D3pScaffold(
      appbarTitle:
          'transfer_page_title'.tr() + ' ' + transferInfo.metaDTO.getName(),
      translateAppbar: false,
      body: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBoxH16(),
                      SizedBoxH8(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: transferInfo.state.fromAddresses.length,
                        itemBuilder: (context, index) => BasicTransferBlock(
                          child: Column(
                            children: [
                              const FromAddressTextField(),
                              SizedBoxH4(),
                              _PasswordTextField(
                                passwordController: passwordController,
                              ),
                              SizedBoxH4(),
                              _AmountTextFieldBuilder(
                                amountController: amountController,
                                transferMetaDTO: transferInfo.metaDTO,
                                balance: transferInfo
                                        .state.fromAddresses[index].balance ??
                                    0,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_downward_outlined,
                          size: 30,
                        ),
                      ),

                      // const SizedBoxH24(),
                      _ToAddressTextField(
                        toAddressController: toAddressController,
                      ),
                      const SizedBoxH16(),

                      const TransferTypeDropdown(),
                      // const SizedBox(height: 24),
                      // const FeesText(),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _MakeTransferButton(
              toAddressController: toAddressController,
              amountController: amountController,
              passwordController: passwordController,
              formKey: _formKey,
              appService: appService,
            ),
          ),
        ],
      ),
    );
  }
}
