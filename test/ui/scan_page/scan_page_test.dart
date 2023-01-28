import 'package:flutter_test/flutter_test.dart';
import 'package:threedpass/features/scan_page/presentation/pages/scan_page.dart';
import 'package:threedpass/main.dart';

import '../../test_config.dart';

void main() {
  // config();
  group('Example test', () {
    testWidgets('MyWidget has a title and message', (tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(ThreeDApp());
    });
  });
}
