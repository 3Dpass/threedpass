import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/balance_card/locked_balance_card.dart';

import 'test_config.dart';
// import 'ui/scan_page/scan_page_test.dart' as scan_page;

/// Test all
void main() {
  config();
  group('Example test', () {
    testWidgets('MyWidget has a title and message', (tester) async {
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

  // Prepare to widget-testing
  // setUpAll(() async {
  //   SharedPreferences.setMockInitialValues({});
  //   await service_locator.setup();
  // });
}
