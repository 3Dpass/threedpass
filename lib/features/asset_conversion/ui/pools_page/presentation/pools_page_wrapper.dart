import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PoolsPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const PoolsPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    return this;
    // return BlocProvider<CreatePoscanAssetCubit>(
    //   create: (final _) => getIt<CreatePoscanAssetCubit>(
    //     param1: context.router,
    //   ),
    //   child: this,
    // );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
