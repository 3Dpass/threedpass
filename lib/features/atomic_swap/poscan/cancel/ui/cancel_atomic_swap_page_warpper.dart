import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/bloc/cancel_poscan_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/ui/cancel_atomic_swap_page.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class CancelAtomicSwapPageWarpper extends StatelessWidget
    implements AutoRouteWrapper {
  final PendingPoscanAtomicSwap pendingSwap;

  const CancelAtomicSwapPageWarpper({
    required this.pendingSwap,
    super.key,
  });

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CancelPoscanAtomicSwapBloc>(
          create: (final _) => getIt<CancelPoscanAtomicSwapBloc>(
            param1: pendingSwap,
            param2: context.router,
          ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return CancelAtomicSwapPage();
  }
}
