import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> copyAndNotify({
  required final String textToCopy,
  final String? textToShow,
}) async {
  await Clipboard.setData(ClipboardData(text: textToCopy));
  await Fluttertoast.showToast(
    msg: textToShow ?? 'Copied'.tr() + ' ' + textToCopy,
  );
}
