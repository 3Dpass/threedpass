import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class SwapButton extends StatelessWidget {
  // TODO Allow clicking on this button when assets are loaded, but pools could be loading. Show in the top of the page if pools are loading. When choose pair of assets, show if such pool exists
  const SwapButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
      buildWhen: (final previous, final current) =>
          previous.isLoading != current.isLoading,
      builder: (final context, final poscanAssetsState) =>
          BlocBuilder<PoolsCubit, PoolsState>(
        buildWhen: (final previous, final current) =>
            previous.isLoading != current.isLoading,
        builder: (final context, final poolsState) {
          return D3pElevatedButton(
            iconData: Icons.swap_horiz_outlined,
            text: '',
            onPressed: poscanAssetsState.isLoading || poolsState.isLoading
                ? null
                : () => unawaited(
                      context.router.push(
                        SwapRouteWrapper(
                          poolAssets:
                              BlocProvider.of<PoscanAssetsCubit>(context)
                                  .poolAssets,
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }
}
