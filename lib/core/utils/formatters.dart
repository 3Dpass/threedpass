import 'package:intl/intl.dart';

class Fmt {
  static DateFormat basicDateFormat = DateFormat('yyyy-MM-dd H:m:s');

  static String address(String? addr, {int pad = 6}) {
    if (addr == null || addr.isEmpty) {
      return 'address';
    }
    return addr.substring(0, pad) + '...' + addr.substring(addr.length - pad);
  }
}
