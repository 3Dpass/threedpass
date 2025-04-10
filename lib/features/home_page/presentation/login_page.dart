import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock.dart';

@RoutePage<bool>()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onLoginResult});

  final void Function(bool isLoggedIn)? onLoginResult;

  void onUnlocked() {
    onLoginResult?.call(true);
  }

  @override
  Widget build(final BuildContext context) {
    return D3pScreenLock(onUnlocked: onUnlocked);
  }
}
