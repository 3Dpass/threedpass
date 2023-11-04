import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_bloc.dart';

@RoutePage()
class WalletPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const WalletPageWrapper({
    final Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Context to show global dialogs
        BlocProvider<OuterContextCubit>(
          create: (final _) => OuterContextCubit(context),
          lazy: false,
        ),
        BlocProvider<NotificationsBloc>(
          create: (_) => NotificationsBloc(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
