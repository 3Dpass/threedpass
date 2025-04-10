// ignore_for_file: prefer-first
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/connection/polkadot/data/repositories/public_3dp_nodes_list_repository.dart';
import 'package:threedpass/features/connection/polkadot/presentation/node_url_status.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';
import 'package:url_launcher/url_launcher.dart';

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

  bool apply(final String text, final BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final cubit = BlocProvider.of<SettingsCubit>(context);
      final newWalletConfig = cubit.state.walletSettings.copyWith(
        nodeUrl: text,
        connectionMode: connectionMode,
      );
      final newState = cubit.state.copyWith(walletSettings: newWalletConfig);
      cubit.updateSettings(newState);

      if (text != widget.initialState.walletSettings.nodeUrl) {
        BlocProvider.of<AppServiceLoaderCubit>(context)
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
      return true;
    } else {
      Fluttertoast.showToast(
        msg: 'Settings are not valid',
        toastLength: Toast.LENGTH_LONG,
      );
      return false;
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
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding16(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'wallet_settings_currently_connected'.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          W8(),
                          NodeUrlStatus(),
                        ],
                      ),
                    ),
                  ),
                  H16(),
                  Padding16(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'wallet_settings_select_connection_mode'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  H8(),
                  RadioListTile.adaptive(
                    title: Text(ConnectionMode.defaultRandom.localizedName),
                    value: ConnectionMode.defaultRandom,
                    groupValue: connectionMode,
                    onChanged: (value) => onEnumPressed(value!),
                  ),
                  H8(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      text: TextSpan(
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                        children: [
                          TextSpan(
                            text: 'random_connection_mode_part_1'.tr(),
                          ),
                          TextSpan(
                            text: 'random_connection_mode_part_2'.tr(),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(
                                  Uri.parse(
                                    Public3dpNodesListRepository
                                        .listOfNodesRepo,
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  H16(),
                  RadioListTile.adaptive(
                    title: Text(ConnectionMode.custom.localizedName),
                    value: ConnectionMode.custom,
                    groupValue: connectionMode,
                    onChanged: (value) => onEnumPressed(value!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 16,
                      top: 8,
                    ),
                    child: D3pTextFormField(
                      controller: nodeUrlController,
                      enabled: connectionMode == ConnectionMode.custom,
                      validator: (final input) =>
                          connectionMode == ConnectionMode.custom
                              ? Uri.tryParse(nodeUrlController.text) != null &&
                                      nodeUrlController.text.startsWith('wss')
                                  ? null
                                  : 'url_validation_error'.tr()
                              : null,
                      labelText: 'node_url_label'.tr(),
                      suffixButton: Icons.clear,
                      onSuffixButtonPressed: () => nodeUrlController.text = "",
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
