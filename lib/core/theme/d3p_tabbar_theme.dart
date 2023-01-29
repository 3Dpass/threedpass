import 'package:flutter/material.dart';

class D3pTabBarTheme extends TabBarTheme {
  const D3pTabBarTheme()
      : super(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),
        );
}
