import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings/node_url_textfield.dart';

@RoutePage()
class WalletNodeSubPage extends StatelessWidget {
  WalletNodeSubPage({
    required final GlobalSettings initialState,
    super.key,
  }) {
    controller = TextEditingController(
      text: initialState.walletSettings.nodeUrl,
    );
  }

  late final TextEditingController controller;

  void onSavePressed(final BuildContext context) {
    apply(controller.text, context);
  }

  Future<void> apply(final String text, final BuildContext context) async {
    // final cubit = settingsConfigCubit;
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newWalletConfig = cubit.state.walletSettings.copyWith(nodeUrl: text);
    final newState = cubit.state.copyWith(walletSettings: newWalletConfig);
    cubit.updateSettings(newState);

    await BlocProvider.of<AppServiceLoaderCubit>(context)
        .changeNetwork(newWalletConfig);

    unawaited(
      Fluttertoast.showToast(
        msg: 'Node URL updated. Please restart the app.',
        toastLength: Toast.LENGTH_LONG,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return SettingSubPage(
      appbarTitle: 'node_url_subpage_label',
      onSavePressed: onSavePressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: NodeUrlTextfield(
          textEditingController: controller,
          settingsConfigCubit: BlocProvider.of<SettingsConfigCubit>(context),
          appServiceLoaderCubit:
              BlocProvider.of<AppServiceLoaderCubit>(context),
        ),
      ),
    );
  }
}
