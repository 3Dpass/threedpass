import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AssetsLoadingPlaceholder extends StatelessWidget {
  const AssetsLoadingPlaceholder({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 36),
      child: PlatformCircularProgressIndicator(),
    );
  }
}
