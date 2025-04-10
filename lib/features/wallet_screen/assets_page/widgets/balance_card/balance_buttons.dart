import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/card_buttons_list.dart';
import 'package:threedpass/features/other/card_with_buttons/card_with_buttons.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/coin_transfer_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/recieve_button.dart';
import 'package:threedpass/router/router.gr.dart';

class BalanceButtons extends StatelessWidget {
  const BalanceButtons();

  @override
  Widget build(BuildContext context) {
    return CardButtonsList(
      buttons: [
        CoinTransferButton(),
        FastCardButton(
          title: 'transfer_history_button_label',
          iconData: Icons.history,
          onButtonPressed: () =>
              context.router.push(const TransactionsHistoryRouteWrapper()),
        ),
        RecieveButton(),
      ],
      padding: EdgeInsets.symmetric(horizontal: CardWithButtons.padding),
    );
  }
}
