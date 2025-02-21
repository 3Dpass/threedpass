import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/other/card_with_buttons/card_button.dart';
import 'package:threedpass/features/other/card_with_buttons/card_with_buttons.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/avaliable_balance_card.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/balance_buttons.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/locked_balance_card.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/reserved_balance_card.dart';
import 'package:threedpass/features/wallet_screen/widgets/asset_balance_text.dart';

part './balance_card/main_balance_content.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.balance,
    required this.tokenDecimals,
    required this.tokenSymbol,
    final Key? key,
  }) : super(key: key);

  final BalanceData balance;
  final int tokenDecimals;
  final String tokenSymbol;

  static const double height = 180 + CardButton.size;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding16(
        child: Card.filled(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: _MainBalanceContent(
                  balance: balance,
                  tokenDecimals: tokenDecimals,
                  tokenSymbol: tokenSymbol,
                ),
              ),
              BalanceButtons(),
              SizedBox(
                height: CardWithButtons.padding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
