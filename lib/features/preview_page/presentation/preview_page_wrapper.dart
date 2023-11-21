import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

@RoutePage()
class PreviewPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const PreviewPageWrapper({
    required this.hashObject,
    required this.snapshot,
    required this.appServiceLoaderCubit,
    final Key? key,
    this.createNewAnyway = false,
  }) : super(key: key);

  final HashObject? hashObject;
  final Snapshot snapshot;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  /// Guarantee to create a new snapshot
  final bool createNewAnyway;

  bool get _snapshotExists => hashObject?.containsSnapshot(snapshot) ?? false;

  PreviewPageCubitState get _previewPageCubitState {
    if (hashObject != null) {
      /// Object exists
      return !_snapshotExists || createNewAnyway
          ? PreviewNewSnapshot(
              hashObject: hashObject!,
              snapshot: snapshot,
            )
          : PreviewExistingSnapshot(
              hashObject: hashObject!,
              snapshot: snapshot,
            );
    } else {
      /// Object does not exist
      return PreviewNewObject(
        snapshot: snapshot,
      );
    }
  }

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Snapshot data
        BlocProvider<PreviewPageCubit>(
          create: (final context) => PreviewPageCubit(
            _previewPageCubitState,
          ),
        ),
        // Context to return to menu.
        BlocProvider<OuterContextCubit>(
          create: (final _) => OuterContextCubit(context),
          lazy: false,
        ),
        BlocProvider<AppServiceLoaderCubit>(
          create: (final _) => appServiceLoaderCubit,
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
