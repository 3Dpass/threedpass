import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/add_from_card_row.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/add_to_card_row.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/froms_list_view.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/tos_list_view.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/transfer_type_switch.dart';

part './widgets/make_transfer_button.dart';

@RoutePage()
class TransferPage extends StatelessWidget {
  TransferPage({
    final Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final transferInfo = BlocProvider.of<TransferInfoCubit>(context);
    // appService.keyring.
    return D3pScaffold(
      appbarTitle: 'transfer_page_title'.tr() + ' ' + transferInfo.metaDTO.name,
      translateAppbar: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: _formKey,
                child: BlocBuilder<TransferInfoCubit, TransferInfo>(
                  builder: (final context, final state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBoxH8(),

                        FromsListView(
                          transferInfo: state,
                          metaInfoType: transferInfo.metaDTO.type,
                        ),

                        const AddFromCardRow(),

                        const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_downward_outlined,
                            size: 30,
                          ),
                        ),

                        // const SizedBoxH24(),
                        ToListView(
                          transferInfo: state,
                          metaInfoType: transferInfo.metaDTO.type,
                        ),

                        const AddToCardRow(),

                        // const SizedBoxH16(),

                        const TransferTypeSwitch(),
                        // const SizedBox(height: 24),
                        // const FeesText(),
                        const SizedBox(height: 72),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: _MakeTransferButton(
                toAddressController: TextEditingController(),
                amountController: TextEditingController(),
                passwordController: TextEditingController(),
                formKey: _formKey,
                appService: appService,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
