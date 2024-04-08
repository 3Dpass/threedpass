import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_assets/create_assset/bloc/create_poscan_asset_cubit.dart';

@RoutePage()
class CreateAssetPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const CreateAssetPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    final appServiceLoaderCubit =
        BlocProvider.of<AppServiceLoaderCubit>(context);
    final appService = appServiceLoaderCubit.state;
    final initialAcc = appService.keyring.current;
    return BlocProvider(
      create: (final _) => CreatePoscanAssetCubit(
        initialAccount: initialAcc,
        appServiceLoaderCubit: appServiceLoaderCubit,
      ),
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
