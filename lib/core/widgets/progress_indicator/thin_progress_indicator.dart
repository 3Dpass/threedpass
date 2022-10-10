import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ThinProgressIndicator extends StatelessWidget {
  const ThinProgressIndicator({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return PlatformCircularProgressIndicator(
      material: (final context, final _) => MaterialProgressIndicatorData(
        strokeWidth: 2,
      ),
    );
  }
}
