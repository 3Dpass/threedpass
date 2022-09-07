import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/widgets/address_icon.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/connetction_indicator.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/new_account_popup_menu_button.dart';

class AssetPageAppbar extends AppBar {
  AssetPageAppbar({
    Key? key,
    required KeyPairData account,
    required BuildContext context,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.switch_account_rounded),
            ),
          ),
          title: SizedBox(
            height: kToolbarHeight,
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddressIcon(
                    account.address,
                    svg: account.icon,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Fmt.shorterAddress(account.address),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        account.name ?? 'Anonymous',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const SizedBox(
                    width: AddressIcon.defaultSize,
                    child: Center(
                      child: ConnectionIndicator(),
                    ),
                  ), // placeholder for AddressIcon
                ],
              ),
              onTap: account.address != null
                  ? () => copyAndNotify(
                        textToCopy: account.address!,
                        textToShow: 'address_copied_to_clipboard'.tr(),
                      )
                  : null,
            ),
          ),
          actions: const [
            NewAccountPopupMenuButton(),
          ],
        );
}
