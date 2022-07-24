import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

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
              DrawerHeader(
                decoration: const BoxDecoration(
                    // color: Colors.blue,
                    ),
                child: Center(
                  child: Text('choose_account_assets_page_drawer'.tr()),
                ),
              ),
              ...List.generate(
                accounts.length,
                (index) => ListTile(
                  leading: accounts[index].address == current.address
                      ? const Icon(Icons.arrow_right_rounded)
                      : const Icon(
                          Icons.abc,
                          color: Colors.transparent,
                        ),
                  title: Text(accounts[index].name ?? 'Anonymous'),
                  onTap: accounts[index].address == current.address
                      ? null
                      : () {
                          appServiceCubit.changeAccount(accounts[index]);
                          Navigator.of(context).pop();
                        },
                ),
              ),
            ],
          ),
        );
}
