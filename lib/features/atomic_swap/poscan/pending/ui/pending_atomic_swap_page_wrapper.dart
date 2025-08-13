import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/ui/pending_atomic_swap_page.dart';

@RoutePage()
class PendingAtomicSwapPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const PendingAtomicSwapPageWrapper({
    super.key,
  });

  @override
  Widget wrappedRoute(final BuildContext context) => this;

  @override
  Widget build(final BuildContext context) {
    return PendingAtomicSwapPage();
  }
}
