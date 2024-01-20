import 'package:auto_route/auto_route.dart';
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
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/assets_page/remove_account_dialog.dart';
import 'package:threedpass/router/route_paths.dart';
import 'package:threedpass/router/router.gr.dart';

part './accounts_drawer/account_text_button.dart';

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
              const SizedBoxH4(),
              const _AccountTextButton(
                icon: Icons.add_circle,
                text: 'create_account_button_label',
                path: RoutePaths.createAccountMain +
                    RoutePaths.createAccountRandomMnemonic,
              ),
              const _AccountTextButton(
                icon: Icons.import_export,
                text: 'import_account_button_label',
                path: RoutePaths.createAccountMain +
                    RoutePaths.createAccountChooseType,
              ),
              D3pTextButton(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                mainAxisAlignment: MainAxisAlignment.start,
                icon: Icons.book,
                text: 'contacts_button_label'.tr(),
                onPressed: () => openContacts(context),
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

  static void openContacts(final BuildContext context) {
    Navigator.of(context).pop();
    context.router.push(const ContactsRoute());
  }

  static Future<void> deleteAccount(final BuildContext context) async {
    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;

    await showPlatformDialog<void>(
      context: outerContext,
      builder: (final _) => const RemoveAccountDialog(),
    );
  }
}
