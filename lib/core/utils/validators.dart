import 'package:easy_localization/easy_localization.dart';

class Validators {
  static bool checkPassword(final String pass) {
    final reg = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[\S]{6,32}$');
    return reg.hasMatch(pass);
  }

  static String? notEmpty(final String? value) {
    if (value == null || value.isEmpty) {
      return 'error_empty'.tr();
    }
    return null;
  }

  static String? onlyInt(final String? p0) {
    final res = int.tryParse(p0 ?? '');

    return res != null && res > 0 ? null : 'error_wrong_amount_int'.tr();
  }

  static String? onlyU8(final String? p0) {
    final res = int.tryParse(p0 ?? '');

    return res != null && res > 0 && res <= 255 ? null : 'error_u8'.tr();
  }

  static String? onlyBigInt(final String? p0) {
    final res = BigInt.tryParse(p0 ?? '');

    return res != null && res > BigInt.zero
        ? null
        : 'error_wrong_amount_int'.tr();
  }
}
