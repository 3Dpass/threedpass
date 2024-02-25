import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:threedpass/core/persistence/hive_setup.dart' as hive_setup;
import 'package:threedpass/setup.dart' as di_setup;

Future<void> config() async {
  setUpAll(() async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    await hive_setup.hiveSetup();
    await di_setup.setup();
    await EasyLocalization.ensureInitialized();
  });
}
