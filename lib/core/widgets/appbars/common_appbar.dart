import 'package:flutter/material.dart';

class CommonAppbar extends AppBar {
  CommonAppbar({
    Key? key,
    required Widget title,
    double? titleSpacing,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          titleSpacing: titleSpacing ?? 16,
          title: title,
          automaticallyImplyLeading: false,
        );
}
