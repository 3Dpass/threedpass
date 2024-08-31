import 'package:flutter/material.dart';

class D3pTabBarTheme extends TabBarTheme {
  D3pTabBarTheme(
    final Color mainColor,
  ) : super(
          labelColor: mainColor,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: mainColor,
              width: 3,
            ),
          ),
        );
}
