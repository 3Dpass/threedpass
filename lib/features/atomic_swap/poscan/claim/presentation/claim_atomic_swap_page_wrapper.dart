import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/bloc/claim_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/presentation/claim_atomic_swap_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class ClaimAtomicSwapPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const ClaimAtomicSwapPageWrapper({
    super.key,
  });

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClaimAtomicSwapBloc>(
          create: (final _) => getIt<ClaimAtomicSwapBloc>(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return ClaimAtomicSwapPage();
  }
}
