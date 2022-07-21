import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';

class CreateAccountWrapper extends StatelessWidget implements AutoRouteWrapper {
  const CreateAccountWrapper({
    Key? key,
    required this.appService,
  }) : super(key: key);

  final AppService appService;

  @override
  Widget wrappedRoute(BuildContext context) {
    return Provider(
      create: (_) => appService,
      child: MultiBlocProvider(
        providers: [
          // Context to return to menu.
          BlocProvider<AccountStoreBloc>(
            create: (_) => AccountStoreBloc(),
            lazy: false,
          ),
        ],
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}