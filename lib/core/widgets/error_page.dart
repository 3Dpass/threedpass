import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/router/route_names.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.error,
    final Key? key,
  }) : super(key: key);

  final Object error;

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: Text(
          'Error: ${error}',
          style: Theme.of(context).customTextStyles.d3ptitleMedium,
        ),
      ),
    );
  }
}

const AutoRoute errorPageRoute = AutoRoute(
  page: ErrorPage,
  name: RouteNames.errorPage,
);
