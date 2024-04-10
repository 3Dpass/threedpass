import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class MintAssetPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const MintAssetPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    return BlocProvider<MintAssetCubit>(
      create: (final _) => getIt<MintAssetCubit>(),
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
