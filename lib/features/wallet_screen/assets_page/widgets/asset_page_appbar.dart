import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/widgets/address_icon.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/notifications_icon_button.dart';

class AssetPageAppbar extends AppBar {
  AssetPageAppbar({
    required final KeyPairData account,
    final Key? key,
  }) : super(
          key: key,
          backgroundColor: const D3pAppBarTheme().backgroundColor,
          centerTitle: true,
          leading: const _OpenDrawerButton(),
          title: SizedBox(
            // color: Colors.red,
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                D3pAddressIcon(
                  account.address,
                  svg: account.icon,
                ),
                const SizedBox(width: 16),
                _AccountName(
                  accountAddress: account.address,
                  accountName: account.name,
                ),
                const SizedBox(width: 16),
                _CopyButton(
                  accountAddress: account.address,
                ),
              ],
            ),
          ),
          actions: const [
            NotificationsIconButton(),
            SizedBox(width: 16),
          ],
        );
}

class _OpenDrawerButton extends StatelessWidget {
  const _OpenDrawerButton();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      // width: D3pAddressIcon.defaultSize,
      height: kToolbarHeight,
      child: Align(
        child: D3pIconButton(
          emptyContraints: true,
          iconData: Icons.switch_account_rounded,
          iconColor: theme.customColors.appBarButton,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }
}

class _AccountName extends StatelessWidget {
  const _AccountName({
    required this.accountAddress,
    required this.accountName,
  });

  final String? accountName;
  final String? accountAddress;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Fmt.shorterAddress(accountAddress),
          style: theme.customTextStyles.accountAddress,
        ),
        const SizedBoxH4(),
        Text(
          accountName ?? 'Anonymous',
          style: theme.customTextStyles.accountName,
        ),
      ],
    );
  }
}

class _CopyButton extends StatelessWidget {
  const _CopyButton({
    required this.accountAddress,
  });

  final String? accountAddress;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      // color: Colors.red,
      width: D3pAddressIcon.defaultSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          D3pIconButton(
            emptyContraints: true,
            iconData: Icons.copy,
            size: 24,
            iconColor: theme.customColors.appBarButton,
            onPressed: () => copyAndNotify(
              textToCopy: accountAddress ?? '',
              textToShow: 'address_copied_to_clipboard'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
