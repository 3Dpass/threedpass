import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/rest/bloc/explorer_url_cubit.dart';

class ExplorerUrlStatus extends StatelessWidget {
  final TextStyle? valueTextTheme;

  const ExplorerUrlStatus({this.valueTextTheme, super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ExplorerUrlCubit, ExplorerUrlState>(
      builder: (final BuildContext context, final ExplorerUrlState state) {
        if (state.hasValue) {
          return Text(
            state.value!,
            style: valueTextTheme,
            overflow: TextOverflow.ellipsis,
          );
        }
        if (state.isLoading) {
          return const D3pProgressIndicator(
            size: 16,
            strokeWidth: 2,
          );
        }
        if (state.hasError) {
          return Text(
            'status_error'.tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
