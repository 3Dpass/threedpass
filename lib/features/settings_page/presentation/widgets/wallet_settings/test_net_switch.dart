import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/d3p_switch_button.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';

class TestNetSwitch extends StatelessWidget {
  const TestNetSwitch({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.walletSettings.isTestNet != current.walletSettings.isTestNet,
      builder: (final context, final state) => D3pSwitchButton(
        text: 'wallet_settings_istestnet_switch'.tr(),
        onChanged: null,
        value: state.walletSettings.isTestNet,
      ),
    );
  }
}
