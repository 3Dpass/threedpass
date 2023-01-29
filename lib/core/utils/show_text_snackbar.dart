import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FastSnackBar {
  const FastSnackBar({
    required this.textCode,
    required this.context,
  });

  final String textCode;
  final BuildContext context;

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textCode.tr()),
      ),
    );
  }
}
