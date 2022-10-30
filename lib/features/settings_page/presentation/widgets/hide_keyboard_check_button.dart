import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class HideKeyboardCheckButton extends StatelessWidget {
  const HideKeyboardCheckButton({final Key? key}) : super(key: key);

  void _onTap() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(final BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (final context, final isKeyboardVisible) {
        return isKeyboardVisible
            ? IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 25,
                onPressed: _onTap,
                color: Theme.of(context).customColors.appBarButton,
                icon: const Icon(Icons.check),
              )
            : const SizedBox();
      },
    );
  }
}
