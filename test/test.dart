import 'test_config.dart';
import 'ui/scan_page/scan_page_test.dart' as scan_page;
import 'utils/assets_formatting.dart' as assets_formating;
import 'utils/tx_logs_handler.dart' as tx_logs_handler;

/// Test all
void main() {
  config();

  assets_formating.main();
  // tx_logs_handler.main();

  scan_page.main();
}
