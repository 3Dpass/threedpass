import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';

@RoutePage<bool>()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onLoginResult});

  final void Function(bool isLoggedIn)? onLoginResult;

  @override
  Widget build(BuildContext context) {
    return D3pScaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onLoginResult?.call(true);
          },
          child: Text('lol'),
        ),
      ),
      appbarTitle: 'aaa',
    );
  }
}
