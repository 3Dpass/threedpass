import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return BackButton(
      onPressed: () => context.router.maybePop(),
    );
  }
}
