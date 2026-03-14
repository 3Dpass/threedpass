import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/rest/bloc/explorer_url_cubit.dart';
import 'package:threedpass/features/rest/presentation/explorer_url_status.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/setting_sub_page.dart';

@RoutePage()
class WalletExplorerSubPage extends StatefulWidget {
  WalletExplorerSubPage({
    required this.initialState,
    super.key,
  });

  final GlobalSettings initialState;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<WalletExplorerSubPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController explorerUrlController = TextEditingController();
  ConnectionMode connectionMode = ConnectionMode.defaultRandom;

  @override
  void initState() {
    explorerUrlController.text =
        widget.initialState.walletSettings.explorerUrl!;
    connectionMode = widget.initialState.walletSettings.explorerConnectionMode!;
    super.initState();
  }

  void onEnumPressed(final ConnectionMode mode) {
    if (mounted) {
      setState(() {
        connectionMode = mode;
        _formKey.currentState?.validate();
      });
    }
  }

  bool apply(final String text, final BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final settingsCubit = BlocProvider.of<SettingsCubit>(context);
      final newExplorerConfig = settingsCubit.state.walletSettings.copyWith(
        explorerUrl: text,
        explorerConnectionMode: connectionMode,
      );
      final newState =
          settingsCubit.state.copyWith(walletSettings: newExplorerConfig);
      settingsCubit.updateSettings(newState);

      final explorerUrlCubit = BlocProvider.of<ExplorerUrlCubit>(context);
      unawaited(explorerUrlCubit.initUrl());

      if (text != widget.initialState.walletSettings.explorerUrl ||
          connectionMode != widget.initialState.walletSettings.connectionMode) {
        unawaited(
          Fluttertoast.showToast(
            msg: 'explorer_settings_changed'.tr(),
            toastLength: Toast.LENGTH_LONG,
          ),
        );
      }
      return true;
    } else {
      unawaited(
        Fluttertoast.showToast(
          msg: 'Settings are not valid',
          toastLength: Toast.LENGTH_LONG,
        ),
      );
      return false;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return SettingSubPage(
      appbarTitle: 'explorer_url_subpage_label',
      onSavePressed: (final ctx) => apply(explorerUrlController.text, ctx),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: BlocBuilder<SettingsCubit, GlobalSettings>(
          builder: (final BuildContext context, final GlobalSettings state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  PH16(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'wallet_settings_current_explorer'.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          W8(),
                          const Flexible(child: ExplorerUrlStatus()),
                        ],
                      ),
                    ),
                  ),
                  H16(),
                  PH16(
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
                    title: Text('Random public URL'),
                    value: ConnectionMode.defaultRandom,
                    groupValue: connectionMode,
                    onChanged: (final value) => onEnumPressed(value!),
                  ),
                  H16(),
                  RadioListTile.adaptive(
                    title: Text('Your custom URL'),
                    value: ConnectionMode.custom,
                    groupValue: connectionMode,
                    onChanged: (final value) => onEnumPressed(value!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 16,
                      top: 8,
                    ),
                    child: D3pTextFormField(
                      controller: explorerUrlController,
                      enabled: connectionMode == ConnectionMode.custom,
                      validator: (final input) => connectionMode ==
                              ConnectionMode.custom
                          ? Validators.explorerUrl(explorerUrlController.text)
                              ? null
                              : 'url_validation_error'.tr()
                          : null,
                      labelText: 'explorer_url_label'.tr(),
                      suffixButton: Icons.clear,
                      onSuffixButtonPressed: () =>
                          explorerUrlController.text = '',
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
