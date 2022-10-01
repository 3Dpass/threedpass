import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ThinProgressIndicator extends StatelessWidget {
  const ThinProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformCircularProgressIndicator(
      material: (context, _) => MaterialProgressIndicatorData(
        strokeWidth: 2,
      ),
    );
  }
}
