import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

extension WhenWidget<T> on AsyncValue<T> {
  Widget whenWidget({
    required Widget Function(T) data,
    double indicatorSize = 24,
  }) {
    return when<Widget>(
      data: data,
      error: (Object error, StackTrace stackTrace) => Center(
        child: Text(
          error.toString() + '\n' + stackTrace.toString(),
        ),
      ),
      loading: () => Center(
        child: D3pProgressIndicator(
          size: indicatorSize,
        ),
      ),
    );
  }
}
