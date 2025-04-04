import 'package:easy_localization/easy_localization.dart';

class Formatters {
  static final DateFormat basicDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final DateFormat shortDateFormat = DateFormat('yyyy-MM-dd HH:mm');
  static final DateFormat transferDateFormat = DateFormat('kk:mm - dd-MM-yyyy');

  static String shorterAddress(final String? addr, {final int pad = 6}) {
    if (addr == null || addr.isEmpty) {
      return 'error_empty_account_address'.tr();
    }
    return addr.substring(0, pad) + '...' + addr.substring(addr.length - pad);
  }
}
