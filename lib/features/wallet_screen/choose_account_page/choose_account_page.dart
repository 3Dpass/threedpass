import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/choose_account_page/widgets/accounts_list.dart';
import 'package:threedpass/router/route_paths.dart';

@RoutePage()
class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'select_account_appbar_title',
      body: BlocBuilder<AppServiceLoaderCubit, AppService>(
        builder: (final context, final state) {
          if (state.status == AppServiceInitStatus.connected) {
            return SelectableAccountsList(
              accounts: state.keyring.allAccounts,
              selectedAccount: state.keyring.current,
              selectAccount: (final p0) =>
                  BlocProvider.of<AppServiceLoaderCubit>(context)
                      .changeAccount(p0),
            );
          } else {
            return Center(child: PlatformCircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'push_to_generate_account',
            child: const Icon(Icons.add),
            onPressed: () => pushToGenerateAccount(context),
          ),
          SizedBoxH16(),
          FloatingActionButton(
            heroTag: 'push_to_import_account',
            child: const Icon(Icons.import_export),
            onPressed: () => pushToImportAccount(context),
          ),
        ],
      ),
    );
  }

  void pushToGenerateAccount(final BuildContext context) {
    context.router.pushNamed(
      RoutePaths.createAccountMain + RoutePaths.createAccountRandomMnemonic,
    );
  }

  void pushToImportAccount(final BuildContext context) {
    context.router.pushNamed(
      RoutePaths.createAccountMain + RoutePaths.createAccountChooseType,
    );
  }
}
