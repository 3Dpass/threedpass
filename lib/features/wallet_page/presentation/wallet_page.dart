import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_page/presentation/assets_page.dart';
import 'package:threedpass/features/wallet_page/presentation/connecting_page.dart';
import 'package:threedpass/features/wallet_page/presentation/no_accounts_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  bool buildWhen(Object previous, Object current) {
    // State changes from connecting to no accounts or hub
    if (previous is! AppService && current is AppService) {
      return true;
    }

    // If new account was created
    if (previous is AppService &&
        current is AppService &&
        previous.keyring.allAccounts.length !=
            current.keyring.allAccounts.length) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, Object>(
      buildWhen: buildWhen,
      builder: (context, state) {
        if (state is AppService) {
          // return const NoAccountsPage();

          if (state.keyring.allAccounts.isEmpty) {
            return const NoAccountsPage();
          } else {
            return const AssetsPage();
          }
        } else {
          return const ConnectingPage();
        }
      },
    );
  }
}
