import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class OpenPoolsButton extends StatelessWidget {
  const OpenPoolsButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoolsCubit, PoolsState>(
      builder: (final context, final state) => Padding16(
        child: D3pSecondaryButton(
          localizedTextKey: 'open_pools_label',
          iconData: Icons.explore_outlined,
          onPressed: state.isLoading
              ? null
              : () => context.router.push(
                    const PoolsRouteWrapper(),
                  ),
        ),
      ),
    );
  }
}
