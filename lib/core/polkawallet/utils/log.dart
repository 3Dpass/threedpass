import 'package:logger/logger.dart';
import 'package:threedpass/setup.dart';

void logV(final String msg) {
  getIt<Logger>().v(msg);
}

void logD(final String msg) {
  getIt<Logger>().d(msg);
}

void logE(final Object msg, final StackTrace? trace) {
  getIt<Logger>().e(msg, msg, trace);
}
