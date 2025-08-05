import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/bloc/claim_poscan_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/presentation/claim_atomic_swap_page.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class ClaimAtomicSwapPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  final PendingPoscanAtomicSwap pendingSwap;
  const ClaimAtomicSwapPageWrapper({
    required this.pendingSwap,
    super.key,
  });

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClaimPoscanAtomicSwapBloc>(
          create: (final _) => getIt<ClaimPoscanAtomicSwapBloc>(
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
    return ClaimAtomicSwapPage();
  }
}
