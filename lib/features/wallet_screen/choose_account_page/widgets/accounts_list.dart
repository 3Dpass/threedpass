import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/widgets/address_icon.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/router/router.gr.dart';

class SelectableAccountsList extends StatelessWidget {
  final List<KeyPairData> accounts;
  final KeyPairData selectedAccount;
  final void Function(KeyPairData) selectAccount;

  const SelectableAccountsList({
    required this.accounts,
    required this.selectedAccount,
    required this.selectAccount,
    super.key,
  });

  BorderSide? side(final KeyPairData acc) {
    if (selectedAccount.address == acc.address) {
      return const BorderSide(color: Colors.green);
    } else {
      return null;
    }
  }

  void Function()? resolveOnTap(final KeyPairData acc) {
    if (selectedAccount.address == acc.address) {
      return null;
    } else {
      return () => selectAccount(acc);
    }
  }

  static void deleteAccount(final BuildContext context) =>
      context.router.push(const RemoveAccountRoute());

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 128),
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: accounts.length,
      itemBuilder: (final context, final index) {
        final acc = accounts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ClickableCard(
            side: side(acc),
            onTap: resolveOnTap(acc),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                D3pAddressIcon(
                  acc.address,
                  svg: acc.icon,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: D3pBodyLargeText(
                    acc.name ?? 'Anonymous',
                    translate: false,
                  ),
                ),
                const SizedBox(width: 8),
                D3pBodyMediumText(
                  Fmt.shorterAddress(acc.address),
                  translate: false,
                ),
                D3pIconButton(
                  iconData: Icons.delete,
                  iconColor: Theme.of(context).colorScheme.error,
                  onPressed: () => deleteAccount(context),
                  emptyContraints: true,
                  splashRadius: 22,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
