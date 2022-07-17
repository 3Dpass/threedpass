import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';

class CreateAccountWrapper extends StatelessWidget implements AutoRouteWrapper {
  const CreateAccountWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Context to return to menu.
        BlocProvider<AccountStoreBloc>(
          create: (_) => AccountStoreBloc(),
          lazy: false,
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
