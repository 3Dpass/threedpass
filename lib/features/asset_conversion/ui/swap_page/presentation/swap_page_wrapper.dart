import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/ui/swap_page/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap_page/presentation/swap_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class SwapPageWrapper extends StatelessWidget {
  const SwapPageWrapper({required this.poolAssets, super.key});

  final List<PoolAssetField> poolAssets;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SwapCubit>(
      create: (final _) => getIt<SwapCubit>(
        param1: context.router,
        param2: poolAssets,
      ),
      child: const SwapPage(),
    );
  }
}
