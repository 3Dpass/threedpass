import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/appservice_init_loader_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/no_accounts_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  bool buildWhen(AppService previous, AppService current) {
    // State changes from init sdk to no accounts or hub
    if (previous.status == AppServiceInitStatus.init) {
      return true;
    }

    // If new account was created. Otherwise, IF above condition is met and works fine
    if (current.keyring.allAccounts.length == 1) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      buildWhen: buildWhen,
      builder: (context, state) {
        switch (state.status) {
          case AppServiceInitStatus.init:
            return const AppServiceInitLoaderPage();

          case AppServiceInitStatus.connecting:
          case AppServiceInitStatus.connected:
          case AppServiceInitStatus.error:
            if (state.keyring.allAccounts.isEmpty) {
              return const NoAccountsPage();
            } else {
              return const AssetsPage();
            }
        }
      },
    );
  }
}
