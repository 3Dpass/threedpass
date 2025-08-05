import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/chains/domain/entities/current_account.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

class WhenAddress extends StatelessWidget {
  final Widget Function(CurrentAccount data) builder;

  const WhenAddress({
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAccountCubit, CurrentAccountState>(
      builder: (BuildContext context, CurrentAccountState state) {
        return state.when(
          data: builder,
          error: (Object error, StackTrace stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => D3pProgressIndicator(size: null),
        );
      },
    );
  }
}
