import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/remove_account_dialog.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
                icon: Icons.add_circle,
                text: 'create_account_button_label'.tr(),
                onPressed: () =>
                    CreateAccountPageWrapper.pushToGenerateRandom(context),
              ),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                mainAxisAlignment: MainAxisAlignment.start,
                icon: Icons.import_export,
                text: 'import_account_button_label'.tr(),
                onPressed: () =>
                    CreateAccountPageWrapper.pushToImportType(context),
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
                    icon: accounts[index].address == current.address
                        ? D3pIconButton(
                            iconData: Icons.delete,
                            iconColor: Colors.red,
                            onPressed: () => deleteAccount(context),
                            emptyContraints: true,
                            splashRadius: 22,
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        );

  static Future<void> deleteAccount(final BuildContext context) async {
    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;

    await showPlatformDialog<void>(
      context: outerContext,
      builder: (final _) => const RemoveAccountDialog(),
    );
  }
}
