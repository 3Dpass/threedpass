import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/widgets/address_icon.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/account_actions.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/connetction_indicator.dart';

class AssetPageAppbar extends AppBar {
  AssetPageAppbar({
    required final KeyPairData account,
    required final ThemeData themeData,
    final Key? key,
  }) : super(
          key: key,
          backgroundColor: themeData.customColors.appBarBackground,
          centerTitle: true,
          leading: Builder(
            builder: (final context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.switch_account_rounded,
                color: themeData.customColors.appBarButton,
              ),
            ),
          ),
          title: SizedBox(
            height: kToolbarHeight,
            child: GestureDetector(
              onTap: account.address != null
                  ? () => copyAndNotify(
                        textToCopy: account.address!,
                        textToShow: 'address_copied_to_clipboard'.tr(),
                      )
                  : null,
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
                  const SizedBox(
                    width: D3pAddressIcon.defaultSize,
                    child: Center(
                      child: ConnectionIndicator(),
                    ),
                  ), // placeholder for AddressIcon
                ],
              ),
            ),
          ),
          actions: const [
            AccountActions(),
          ],
        );
}
