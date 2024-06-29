import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/bloc/add_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/presentation/add_liquidity_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class AddLiquidityPageWrapper extends StatelessWidget {
  const AddLiquidityPageWrapper({required this.poolFullInfo, super.key});

  final PoolFullInfo poolFullInfo;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<AddLiquidityCubit>(
      create: (final _) => getIt<AddLiquidityCubit>(
        param1: context.router,
        param2: poolFullInfo,
      ),
      child: const AddLiquidityPage(),
    );
  }
}
