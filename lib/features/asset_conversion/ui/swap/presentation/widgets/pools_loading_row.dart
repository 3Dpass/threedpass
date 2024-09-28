import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';

class PoolsLoadingRow extends StatelessWidget {
  const PoolsLoadingRow({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoolsCubit, PoolsState>(
      buildWhen: (final previous, final current) =>
          previous.isLoading != current.isLoading,
      builder: (final BuildContext context, final PoolsState state) {
        if (state.isLoading) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const D3pProgressIndicator(size: 16, strokeWidth: 2),
                const W8(),
                Text('pools_loading'.tr()),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
