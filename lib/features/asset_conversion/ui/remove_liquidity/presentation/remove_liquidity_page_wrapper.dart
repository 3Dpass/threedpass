import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/presentation/remove_liquidity_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class RemoveLiquidityPageWrapper extends StatelessWidget {
  const RemoveLiquidityPageWrapper({required this.poolFullInfo, super.key});

  final PoolFullInfo poolFullInfo;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<RemoveLiquidityCubit>(
      create: (final _) => getIt<RemoveLiquidityCubit>(
        param1: context.router,
        param2: poolFullInfo,
      ),
      child: const RemoveLiquidityPage(),
    );
  }
}
