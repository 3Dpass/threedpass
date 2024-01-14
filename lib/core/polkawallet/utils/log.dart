import 'package:logger/logger.dart';
import 'package:threedpass/setup.dart';

void logV(final String msg) {
  getIt<Logger>().v(msg);
}

void logD(final String msg) {
  getIt<Logger>().d(msg);
}

void logE(final String msg) {
  getIt<Logger>().e(msg);
}
