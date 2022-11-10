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
}
