import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

final AutoRoute createAtomicSwapRoute = AutoRoute(
  page: CreateSwapRouteWapper.page,
);

final AutoRoute claimAtomicSwapRoute = AutoRoute(
  page: ClaimAtomicSwapRouteWrapper.page,
);

final AutoRoute cancelAtomicSwapRoute = AutoRoute(
  page: CancelAtomicSwapRouteWarpper.page,
);

final AutoRoute pendingAtomicSwapRoute = AutoRoute(
  page: PendingAtomicSwapRouteWrapper.page,
);
