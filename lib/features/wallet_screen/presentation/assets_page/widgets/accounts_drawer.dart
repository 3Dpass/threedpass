import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';

class AccountsDrawer extends Drawer {
  AccountsDrawer({
    required final List<KeyPairData> accounts,
    required final KeyPairData current,
    required final AppServiceLoaderCubit appServiceCubit,
    required final BuildContext context,
    required final ThemeData theme,
    final Key? key,
  }) : super(
          key: key,
          backgroundColor: Theme.of(context).customColors.scaffoldBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Important: Remove any padding from the ListView.
            // padding: EdgeInsets.zero,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              PlatformAppBar(
                title: Text(
                  'choose_account_assets_page_drawer'.tr(),
                  // style: theme.customTextStyles.appBarText,
                ),
                material: (final _, final __) => MaterialAppBarData(
                  automaticallyImplyLeading: false,
                  backgroundColor: theme.customColors.appBarBackground,
                  foregroundColor: theme.customColors.appBarColor,
                  centerTitle: true,
                ),
                cupertino: (final _, final __) => CupertinoNavigationBarData(
                  automaticallyImplyLeading: false,
                  backgroundColor: theme.customColors.appBarBackground,
                ),
              ),
              const SizedBox(height: 4),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                text: 'create_account_button_label'.tr(),
                onPressed: () =>
                    CreateAccountWrapper.pushToGenerateRandom(context),
              ),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                text: 'import_account_button_label'.tr(),
                onPressed: () => CreateAccountWrapper.pushToImportType(context),
              ),
              const Divider(),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (final _, final index) => ListTileButton.usual(
                    text: accounts[index].name ?? 'Anonymous',
                    onPressed: accounts[index].address == current.address
                        ? null
                        : () async {
                            await appServiceCubit
                                .changeAccount(accounts[index]);
                            Navigator.of(context).pop();
                          },
                    // backgroundColor: Theme.of(context).canvasColor,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ),
            ],
          ),
        );
}
