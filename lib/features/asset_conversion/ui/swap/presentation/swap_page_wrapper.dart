import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/swap_page.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class SwapPageWrapper extends StatelessWidget {
  const SwapPageWrapper({super.key});

  // final List<PoolAssetField> poolAssets;

  @override
  Widget build(final BuildContext context) {
    // final List<PoolAssetField> poolAssets = BlocProvider.of<PoolsCubit>(context).state.value!.pools.;
    return BlocProvider<SwapCubit>(
      create: (final _) => getIt<SwapCubit>(
        param1: context.router,
        param2: BlocProvider.of<PoscanAssetsCubit>(context).poolAssets,
      ),
      child: const SwapPage(),
    );
  }
}
