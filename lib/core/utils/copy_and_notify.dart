import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void copyAndNotify({
  required String textToCopy,
  String? textToShow,
}) {
  Clipboard.setData(ClipboardData(text: textToCopy));

  Fluttertoast.showToast(msg: textToShow ?? textToCopy + ' ' + 'Copied'.tr());
}
