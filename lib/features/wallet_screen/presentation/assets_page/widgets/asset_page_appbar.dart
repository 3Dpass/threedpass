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
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/notifications_icon_button.dart';

class AssetPageAppbar extends AppBar {
  AssetPageAppbar({
    required final KeyPairData account,
    required final ThemeData themeData,
    final Key? key,
  }) : super(
          key: key,
          backgroundColor: const D3pAppBarTheme().backgroundColor,
          centerTitle: true,
          leading: Builder(
            builder: (final context) => D3pIconButton(
              iconData: Icons.switch_account_rounded,
              iconColor: themeData.customColors.appBarButton,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                D3pAddressIcon(
                  account.address,
                  svg: account.icon,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Fmt.shorterAddress(account.address),
                      style: themeData.customTextStyles.accountAddress,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      account.name ?? 'Anonymous',
                      style: themeData.customTextStyles.accountName,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Container(
                  color: Colors.red,
                  width: D3pAddressIcon.defaultSize,
                  child: Align(
                    alignment: Alignment.center,
                    child: D3pIconButton(
                      emptyContraints: true,
                      iconData: Icons.copy,
                      size: 20,
                      iconColor: themeData.customColors.appBarButton,
                      onPressed: () => copyAndNotify(
                        textToCopy: account.address!,
                        textToShow: 'address_copied_to_clipboard'.tr(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: const [
            NotificationsIconButton(),
          ],
        );
}
