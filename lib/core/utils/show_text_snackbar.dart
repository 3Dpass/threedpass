import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showTextSnackBar(String textCode, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(textCode.tr()),
    ),
  );
}
