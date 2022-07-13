import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/router/route_names.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.error,
  }) : super(key: key);

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Error: ${error.toString()}',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}

const AutoRoute errorPageRoute = AutoRoute(
  page: ErrorPage,
  name: RouteNames.errorPage,
);
