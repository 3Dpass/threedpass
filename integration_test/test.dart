// import 'test_config.dart';
import './scan_page_test.dart' as scan_page;
import '../test/test_config.dart';
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
