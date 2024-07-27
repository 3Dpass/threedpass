import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/choose_account_page/widgets/accounts_list.dart';
import 'package:threedpass/router/route_paths.dart';

@RoutePage()
class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({super.key});

  void onSelectAccount(final BuildContext context, final KeyPairData p0) {
    BlocProvider.of<AppServiceLoaderCubit>(context).changeAccount(p0);
    context.router.pop();
  }

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
              selectAccount: (final p0) => onSelectAccount(context, p0),
            );
          } else {
            return Center(child: PlatformCircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: Text('new_random_account_floating_button_label'.tr()),
            heroTag: 'push_to_generate_account',
            onPressed: () => pushToGenerateAccount(context),
          ),
          const H16(),
          FloatingActionButton.extended(
            icon: const Icon(Icons.import_export),
            label: Text('import_existing_account_floating_button_label'.tr()),
            heroTag: 'push_to_import_account',
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
