import 'package:easy_localization/easy_localization.dart';

class Fmt {
  static DateFormat basicDateFormat = DateFormat('yyyy-MM-dd H:m:s');

  static String shorterAddress(final String? addr, {final int pad = 6}) {
    if (addr == null || addr.isEmpty) {
      return 'error_empty_account_address'.tr();
    }
    return addr.substring(0, pad) + '...' + addr.substring(addr.length - pad);
  }
}
