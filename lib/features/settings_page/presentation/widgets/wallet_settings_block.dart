import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings/node_url_textfield.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings/test_net_switch.dart';

class WalletSettingsBlock extends StatelessWidget {
  const WalletSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'wallet_settings_title'.tr(),
          style: Theme.of(context).textTheme.headline6,
        ),
        const TestNetSwitch(),
        NodeUrlTextfield(
          settingsConfigCubit: BlocProvider.of<SettingsConfigCubit>(context),
          appServiceLoaderCubit:
              BlocProvider.of<AppServiceLoaderCubit>(context),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
