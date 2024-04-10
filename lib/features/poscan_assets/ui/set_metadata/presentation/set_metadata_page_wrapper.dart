import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class SetMetadataPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const SetMetadataPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    return BlocProvider<SetMetadataAssetCubit>(
      create: (final _) => getIt<SetMetadataAssetCubit>(),
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
