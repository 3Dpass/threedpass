import 'package:threedpass/setup.dart';

class MAppInstallDate {
  static const String instanceName = 'app_install_date';
  static DateTime? get() => getIt<DateTime>(instanceName: instanceName);
}
