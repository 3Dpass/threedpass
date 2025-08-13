import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

class WhenValue<B extends StateStreamable<AsyncValue<S>>, S>
    extends StatelessWidget {
  const WhenValue({
    required this.builder,
    super.key,
  });

  final Widget Function(S state) builder;

  @override
  Widget build(BuildContext context) => BlocBuilder<B, AsyncValue<S>>(
        builder: (BuildContext context, AsyncValue<S> state) => state.when(
          data: builder,
          error: (final error, final stackTrace) =>
              Text('Error $error $stackTrace'),
          loading: () => const D3pProgressIndicator(
            size: null,
            strokeWidth: 2,
          ),
        ),
      );
}
