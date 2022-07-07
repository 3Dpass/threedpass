import 'package:flutter/material.dart';

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
