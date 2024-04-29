import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@Deprecated('Use just Fluttertoast')
class FastSnackBar {
  const FastSnackBar({
    required this.textCode,
    required this.context,
  });

  final String textCode;
  final BuildContext context;

  void show() {
    Fluttertoast.showToast(msg: textCode.tr());
  }
}
