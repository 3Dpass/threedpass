import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';

class NodeUrlTextfield extends StatelessWidget {
  NodeUrlTextfield({
    Key? key,
    required this.settingsConfigCubit,
    required this.appServiceLoaderCubit,
  })  : textEditingController = TextEditingController(
          text: settingsConfigCubit.state.walletSettings.nodeUrl,
        ),
        super(key: key);

  final TextEditingController textEditingController;
  final SettingsConfigCubit settingsConfigCubit;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<void> apply(String text, BuildContext context) async {
    final cubit = settingsConfigCubit;
    final newWalletConfig = cubit.state.walletSettings.copyWith(nodeUrl: text);
    final newState = cubit.state.copyWith(walletSettings: newWalletConfig);
    cubit.updateSettings(newState);

    await BlocProvider.of<AppServiceLoaderCubit>(context)
        .changeNetwork(newWalletConfig);

    Fluttertoast.showToast(
      msg: 'Node URL updated. Please restart the app.',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void onLabelButtonPressed(BuildContext context) {
    textEditingController.text = d3pDefaultNodeUrl;
    apply(textEditingController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return D3pTextFormField(
      controller: textEditingController,
      labelText: 'node_url_label'.tr(),
      labelButton: 'Reset'.tr(),
      onLabelButtonPressed: () => onLabelButtonPressed(context),
      suffixButton: 'Apply'.tr(),
      onSuffixButtonPressed: () => apply(textEditingController.text, context),
    );
  }
}
