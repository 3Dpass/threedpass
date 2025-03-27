import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/cancel/presentation/cancel_atomic_swap_page.dart';
import 'package:threedpass/features/atomic_swap/claim/presentation/claim_atomic_swap_page.dart';
import 'package:threedpass/features/atomic_swap/pending/presentation/pending_atomic_swap_page.dart';

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
        // BlocProvider<CreateAtomicSwapCubit>(
        //   create: (final _) => getIt<CreateAtomicSwapCubit>(
        //     param1: 0,
        //     param2: context.router,
        //   ),
        // ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return PendingAtomicSwapPage();
  }
}
