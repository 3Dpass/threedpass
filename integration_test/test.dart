import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/locked_balance_card.dart';
import 'package:threedpass/main.dart';

import '../test/test_config.dart';

// import 'test_config.dart';
import './scan_page_test.dart' as scan_page;
// import 'utils/assets_formatting.dart' as assets_formating;

/// Test all
void main() {
  config();

  // assets_formating.main();

  scan_page.main();

  // Prepare to widget-testing
  // setUpAll(() async {
  //   SharedPreferences.setMockInitialValues({});
  //   await service_locator.setup();
  // });
}
