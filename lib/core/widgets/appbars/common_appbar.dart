import 'package:flutter/material.dart';

class CommonAppbar extends AppBar {
  CommonAppbar({
    Key? key,
    required Widget title,
  }) : super(
          key: key,
          backgroundColor: Colors.black,
          titleSpacing: 16,
          title: title,
          automaticallyImplyLeading: false,
        );
}
