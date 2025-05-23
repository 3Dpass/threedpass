import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/preview/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/scan_page/bloc/objects_expanded_cubit.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class ScanPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const ScanPageWrapper({
    final Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Context to return to menu.
        BlocProvider<OuterContextCubit>(
          create: (final _) => OuterContextCubit(context),
          lazy: false,
        ),
        BlocProvider<SelectSnapshotsCubit>(
          create: (final _) => getIt<SelectSnapshotsCubit>(),
        ),
        BlocProvider<ObjectsExpandedCubit>(
          create: (final _) => getIt<ObjectsExpandedCubit>(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
