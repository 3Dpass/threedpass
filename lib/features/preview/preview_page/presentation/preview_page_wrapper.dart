import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class PreviewPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const PreviewPageWrapper({
    required this.snapshot,
    final Key? key,
  }) : super(key: key);

  final Snapshot snapshot;

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Snapshot data
        BlocProvider<PreviewPageCubit>(
          create: (final context) => PreviewPageCubit(
            snapshot,
            getIt<HashesListBloc>(),
          ),
        ),
        // Context to return to menu.
        BlocProvider<OuterContextCubit>(
          create: (final _) => OuterContextCubit(context),
          lazy: false,
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
