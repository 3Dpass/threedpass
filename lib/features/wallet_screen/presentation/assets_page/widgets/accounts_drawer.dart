import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/router/router.gr.dart';

class AccountsDrawer extends Drawer {
  AccountsDrawer({
    Key? key,
    required List<KeyPairData> accounts,
    required KeyPairData current,
    required AppServiceLoaderCubit appServiceCubit,
    required BuildContext context,
  }) : super(
          key: key,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              PlatformAppBar(
                leading: const SizedBox(),
                title: Text(
                  'choose_account_assets_page_drawer'.tr(),
                ),
                material: (_, __) => MaterialAppBarData(
                  backgroundColor: Colors.black,
                  foregroundColor: Theme.of(context).canvasColor,
                ),
              ),
              const SizedBox(height: 4),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                text: 'create_account_button_label'.tr(),
                onPressed: () => context.router.push(
                  CreateAccountWrapperRoute(
                    appService: appServiceCubit.state,
                  ),
                ),
              ),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                text: 'import_account_button_label'.tr(),
                onPressed: () => context.router.push(
                  ImportAccountWrapperRoute(
                    appService: appServiceCubit.state,
                  ),
                ),
              ),
              const Divider(),
              ...List.generate(
                accounts.length,
                (index) => ListTileButton.usual(
                  text: accounts[index].name ?? 'Anonymous',
                  onPressed: accounts[index].address == current.address
                      ? null
                      : () {
                          appServiceCubit.changeAccount(accounts[index]);
                          Navigator.of(context).pop();
                        },
                  backgroundColor: Theme.of(context).canvasColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ],
          ),
        );
}
