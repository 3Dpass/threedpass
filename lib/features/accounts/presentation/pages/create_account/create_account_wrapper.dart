import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/preview/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class CreateAccountPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const CreateAccountPageWrapper({
    final Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(final BuildContext context) {
    // final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return
        // Provider<AppService>(
        //   create: (final _) => appService,
        //   child:
        MultiBlocProvider(
      providers: [
        // BlocProvider.value(value: appService),
        // User inputs storage
        BlocProvider<AccountStoreBloc>(
          create: (final _) => getIt<AccountStoreBloc>(param1: context),
          lazy: false,
        ),
        BlocProvider<OuterContextCubit>(
          create: (final _) => OuterContextCubit(context),
        ),
      ],
      child: this,
      // ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
