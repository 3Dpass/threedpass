import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

class BuildOrLoading<B extends StateStreamable<S>, S> extends StatelessWidget {
  const BuildOrLoading({
    required this.builder,
    super.key,
  });

  final Widget? Function(S state) builder;

  @override
  Widget build(BuildContext context) => BlocBuilder<B, S>(
        builder: (BuildContext context, S state) =>
            builder(state) ??
            const D3pProgressIndicator(
              size: null,
              strokeWidth: 2,
            ),
      );
}
