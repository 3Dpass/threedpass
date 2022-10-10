import 'package:flutter/material.dart';

class CommonAppbar extends AppBar {
  CommonAppbar({
    required final Widget title,
    final double? titleSpacing,
    final List<Widget>? actions,
    final Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          titleSpacing: titleSpacing ?? 16,
          title: title,
          automaticallyImplyLeading: false,
          actions: actions,
        );
}
