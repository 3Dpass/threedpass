import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/result_page/presentation/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/result_page/presentation/bloc/preview_page_cubit.dart';

class PreviewPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const PreviewPageWrapper({
    Key? key,
    required this.hashObject,
    required this.snapshot,
  }) : super(key: key);

  final HashObject? hashObject;
  final Snapshot snapshot;

  bool snapshotExists() => hashObject?.containsSnapshot(snapshot) ?? false;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      // Snapshot data
      BlocProvider<PreviewPageCubit>(
        create: (context) => PreviewPageCubit(
          hashObject != null
              ? snapshotExists()
                  ? PreviewExistingSnapshot(
                      hashObject: hashObject!,
                      snapshot: snapshot,
                    )
                  : PreviewNewSnapshot(
                      hashObject: hashObject!, snapshot: snapshot)
              : PreviewNewObject(
                  snapshot: snapshot,
                ),
        ),
      ),
      // Context to return to menu.
      BlocProvider<OuterContextCubit>(
        create: (_) => OuterContextCubit(context),
        lazy: false,
      ),
    ], child: this);
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
