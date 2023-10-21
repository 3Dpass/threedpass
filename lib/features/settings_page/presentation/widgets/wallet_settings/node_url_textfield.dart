import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

class NodeUrlTextfield extends StatelessWidget {
  const NodeUrlTextfield({
    required this.settingsConfigCubit,
    required this.appServiceLoaderCubit,
    required this.textEditingController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final SettingsConfigCubit settingsConfigCubit;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  void onResetButtonPressed(final BuildContext context) {
    textEditingController.text = d3pDefaultNodeUrl;
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: textEditingController,
      labelText: 'node_url_label'.tr(),
      labelButton: Text('Reset'.tr()),
      onLabelButtonPressed: () => onResetButtonPressed(context),
      autofocus: true,
    );
  }
}
