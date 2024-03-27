import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateAssetPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const CreateAssetPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    return this;
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
