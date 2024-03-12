import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/locked_balance_card.dart';

void main() {
  group('Widget tests', () {
    testWidgets('Balance widget', (tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              LockedBalanceCard(
                tokenSymbol: 'P3D',
                tokenDecimals: 12,
                balance: '0x0000000000000000000044364c5baff6',
              ),
            ],
          ),
        ),
      );
      // TODO check if localization works
      final titleFinder = find.text('75 P3D');
      expect(titleFinder, findsOneWidget);
    });
  });

  group('Utility tests', () {
    test('BalanceUtils.tokenInt', () {
      const decimals = 12;

      final v1 = BalanceUtils.tokenInt('0', decimals);
      expect(v1, BigInt.from(0));

      final v2 = BalanceUtils.tokenInt('0.2', decimals);
      expect(v2, BigInt.from(200000000000));

      final v3 = BalanceUtils.tokenInt('2', decimals);
      expect(v3, BigInt.from(2000000000000));
    });
  });
}
