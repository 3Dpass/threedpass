import 'package:flutter/material.dart';

abstract class AppButtonStyles {
  static final primaryButton = ButtonStyle(
    minimumSize: MaterialStateProperty.all(
      const Size.fromHeight(46),
    ),
  );
}
