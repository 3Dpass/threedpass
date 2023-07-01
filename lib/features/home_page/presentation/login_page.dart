import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_screen_lock.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

@RoutePage<bool>()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onLoginResult});

  final void Function(bool isLoggedIn)? onLoginResult;

  void onUnlocked() {
    onLoginResult?.call(true);
  }

  @override
  Widget build(final BuildContext context) {
    final settings = BlocProvider.of<SettingsConfigCubit>(context).state;
    final correctString = settings.appSettings.pinCode;
    return D3pScreenLock(correctString: correctString, onUnlocked: onUnlocked);
  }
}
