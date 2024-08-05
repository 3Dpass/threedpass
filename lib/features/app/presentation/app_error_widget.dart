import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';
import 'package:threedpass/core/utils/cut_string.dart';

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  final bool isScaffold;

  const AppErrorWidget({
    required this.errorDetails,
    required this.isScaffold,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    // print(
    //     'MainApp: ${widget.runtimeType} isScaffold:${widget is Scaffold || widget is Navigator}');
    final child = Center(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: const BorderRadius.all(D3pCardTheme.radius),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            "ERROR:\n${errorDetails.exception}\n\nContext:\n${errorDetails.context}\n\nStacktrace:\n${errorDetails.stack.toString().cutWithEllipsis(500)}",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
        ),
      ),
    );

    if (isScaffold) {
      return Scaffold(
        appBar: AppBar(),
        body: child,
      );
    } else {
      return child;
    }
  }
}
