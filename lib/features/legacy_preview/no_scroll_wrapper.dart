import 'package:flutter/material.dart';

class NoScrollWrapper extends StatelessWidget {
  final Widget child;
  final Size size;

  const NoScrollWrapper({
    required this.size,
    required this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: size.width,
        height: size.height - 0.001,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: child,
            ),
          ),
        ),
      );
}
