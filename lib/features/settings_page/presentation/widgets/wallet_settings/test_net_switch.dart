import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';

class TestNetSwitch extends StatelessWidget {
  const TestNetSwitch({Key? key}) : super(key: key);

  void onChanged(bool newValue, BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newWalletConfig =
        cubit.state.walletSettings.copyWith(isTestNet: newValue);
    final newState = cubit.state.copyWith(walletSettings: newWalletConfig);
    cubit.updateSettings(newState);

    BlocProvider.of<AppServiceLoaderCubit>(context).init(newWalletConfig);
  }

  @override
  Widget build(BuildContext context) {
    return D3pSwitchButton(
      text: 'wallet_settings_istestnet_switch'.tr(),
      onChanged: (value) => onChanged(value, context),
      initialValue: BlocProvider.of<SettingsConfigCubit>(context)
          .state
          .walletSettings
          .isTestNet,
    );
  }
}
