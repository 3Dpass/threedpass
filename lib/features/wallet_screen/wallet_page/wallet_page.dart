import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/assets_page.dart';
import 'package:threedpass/features/wallet_screen/init_page/appservice_init_loader_page.dart';
import 'package:threedpass/features/wallet_screen/no_accounts_page/no_accounts_page.dart';

@RoutePage()
class WalletPage extends StatelessWidget {
  const WalletPage({final Key? key}) : super(key: key);

  bool buildWhen(final AppService previous, final AppService current) {
    // State changes from init sdk to no accounts or hub
    if (previous.status == AppServiceInitStatus.init) {
      return true;
    }

    // If new account was created. Otherwise, IF above condition is met and works fine
    if (current.keyring.allAccounts.length == 1) {
      return true;
    }

    // If last account was removed
    if (current.keyring.allAccounts.isEmpty) {
      return true;
    }

    return false;
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) {
        switch (state.status) {
          case AppServiceInitStatus.init:
            return const AppServiceInitLoaderPage();
          case AppServiceInitStatus.connecting:
          case AppServiceInitStatus.connected:
          case AppServiceInitStatus.error:
            return state.keyring.allAccounts.isEmpty
                ? const NoAccountsPage()
                : const AssetsPage();
        }
      },
      buildWhen: buildWhen,
    );
  }
}
