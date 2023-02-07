import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void copyAndNotify({
  required final String textToCopy,
  final String? textToShow,
}) {
  Clipboard.setData(ClipboardData(text: textToCopy));

  Fluttertoast.showToast(msg: textToShow ?? 'Copied'.tr() + ' ' + textToCopy);
}
