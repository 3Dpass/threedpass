import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension AutoRouteGetter on BuildContext {
  RootStackRouter get rootRouter => AutoRouter.of(this).root;
}
