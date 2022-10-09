import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/router/route_paths.dart';

class CreateAccountWrapper extends StatelessWidget implements AutoRouteWrapper {
  const CreateAccountWrapper({
    Key? key,
    // required this.appService,
    // required this.createRandom,
  }) : super(key: key);

  // final AppService appService;
  // final bool createRandom;

  static void pushToGenerateRandom(BuildContext context) {
    context.router.pushNamed(
      RoutePaths.createAccountMain + RoutePaths.createAccountRandomMnemonic,
    );
  }

  static void pushToImportType(BuildContext context) {
    context.router.pushNamed(
      RoutePaths.createAccountMain + RoutePaths.createAccountChooseType,
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return Provider<AppService>(
      create: (_) => appService,
      child: MultiBlocProvider(
        providers: [
          // User inputs storage
          BlocProvider<AccountStoreBloc>(
            create: (_) => AccountStoreBloc(context),
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
