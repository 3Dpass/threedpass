import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class HideKeyboardCheckButton extends StatelessWidget {
  const HideKeyboardCheckButton({Key? key}) : super(key: key);

  void _onTap() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return isKeyboardVisible
            ? IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 25,
                onPressed: _onTap,
                icon: const Icon(Icons.check),
              )
            : const SizedBox();
      },
    );
  }
}
