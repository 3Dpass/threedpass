import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

class WalletPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const WalletPageWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Context to show global dialogs
        BlocProvider<OuterContextCubit>(
          create: (_) => OuterContextCubit(context),
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
