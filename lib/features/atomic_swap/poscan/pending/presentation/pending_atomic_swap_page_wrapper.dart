import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/presentation/pending_atomic_swap_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class PendingAtomicSwapPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const PendingAtomicSwapPageWrapper({
    super.key,
  });

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PendingAtomicSwapBloc>(
          create: (final _) => getIt<PendingAtomicSwapBloc>(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return PendingAtomicSwapPage();
  }
}
