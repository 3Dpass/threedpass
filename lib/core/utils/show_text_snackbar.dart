import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FastSnackBar {
  const FastSnackBar({
    required this.textCode,
    required this.context,
  });

  final String textCode;
  final BuildContext context;

  void show() {
    if (Platform.isIOS) {
      Fluttertoast.showToast(msg: textCode.tr());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(textCode.tr()),
        ),
      );
    }
  }
}
