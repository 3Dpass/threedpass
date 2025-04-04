import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/widgets/buttons/enum_button.dart';
import 'package:threedpass/core/widgets/buttons/enum_buttons_list.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';

@RoutePage()
class WalletNodeSubPage extends StatefulWidget {
  WalletNodeSubPage({
    required this.initialState,
    super.key,
  });

  final GlobalSettings initialState;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<WalletNodeSubPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nodeUrlController = TextEditingController();
  ConnectionMode connectionMode = ConnectionMode.defaultRandom;

  @override
  void initState() {
    nodeUrlController.text = widget.initialState.walletSettings.nodeUrl;
    connectionMode = widget.initialState.walletSettings.connectionMode;
    super.initState();
  }

  void onEnumPressed(ConnectionMode mode) {
    setState(() {
      connectionMode = mode;
      _formKey.currentState?.validate();
    });
  }

  Future<void> apply(final String text, final BuildContext context) async {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    final newWalletConfig = cubit.state.walletSettings.copyWith(
      nodeUrl: text,
      connectionMode: connectionMode,
    );
    final newState = cubit.state.copyWith(walletSettings: newWalletConfig);
    cubit.updateSettings(newState);

    if (text != widget.initialState.walletSettings.nodeUrl) {
      await BlocProvider.of<AppServiceLoaderCubit>(context)
          .changeNetwork(newWalletConfig);
    }

    if (text != widget.initialState.walletSettings.nodeUrl ||
        connectionMode != widget.initialState.walletSettings.connectionMode) {
      unawaited(
        Fluttertoast.showToast(
          msg: 'Connection settings changed. Please restart the app.',
          toastLength: Toast.LENGTH_LONG,
        ),
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    return SettingSubPage(
      appbarTitle: 'node_url_subpage_label',
      onSavePressed: (final ctx) => apply(nodeUrlController.text, ctx),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: BlocBuilder<SettingsCubit, GlobalSettings>(
          builder: (BuildContext context, GlobalSettings state) {
            return Column(
              children: [
                EnumButtonsList(
                  length: ConnectionMode.values.length,
                  itemBuilder: (final BuildContext context, final int index) {
                    final mode = ConnectionMode.values[index];
                    return EnumButton(
                      text: mode.localizedName,
                      isChosen: mode == connectionMode,
                      onPressed: () => onEnumPressed(mode),
                    );
                  },
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 16,
                      top: 16,
                    ),
                    child: D3pTextFormField(
                      controller: nodeUrlController,
                      enabled: connectionMode == ConnectionMode.custom,
                      validator: (final input) =>
                          connectionMode == ConnectionMode.custom
                              ? Uri.tryParse(nodeUrlController.text) != null &&
                                      nodeUrlController.text.startsWith('wss')
                                  ? null
                                  : 'Bad URL'
                              : null,
                      labelText: 'node_url_label'.tr(),
                      suffixButton: Icons.restore_outlined,
                      onSuffixButtonPressed: () =>
                          nodeUrlController.text = d3pDefaultNodeUrl,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
