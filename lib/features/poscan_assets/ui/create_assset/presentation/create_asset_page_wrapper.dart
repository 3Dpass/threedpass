import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class CreateAssetPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const CreateAssetPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    return BlocProvider<CreatePoscanAssetCubit>(
      create: (final _) => getIt<CreatePoscanAssetCubit>(
        param1: context.router,
      ),
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
