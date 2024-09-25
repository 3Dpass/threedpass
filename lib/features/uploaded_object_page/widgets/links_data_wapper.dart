import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

typedef UploadedObjectLinksBuilder = Widget Function(
  Iterable<PoscanAssetData> assets,
  Iterable<Snapshot> snapshots,
);

class LinksDataWrapper extends StatelessWidget {
  final UploadedObject uploadedObject;
  final UploadedObjectLinksBuilder child;

  const LinksDataWrapper({
    required this.uploadedObject,
    required this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HashesListBloc, HashesListState>(
      builder: (
        final BuildContext context,
        final HashesListState snapshotsState,
      ) {
        // final localObjects = localObjectsBloc.objects;
        final similarSnapshots = <Snapshot>[];

        snapshotsState.objects.forEach(
          (final obj) => obj.snapshots.forEach(
            (final snapshot) {
              for (final snapHash in snapshot.hashes) {
                if (uploadedObject.hashesListJoined.contains(snapHash)) {
                  similarSnapshots.add(snapshot);
                  break;
                }
              }
            },
          ),
        );

        return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
          builder: (
            final BuildContext context,
            final PoscanAssetsState assetsState,
          ) {
            final assets = assetsState.assets.where(
              (final asset) =>
                  asset.objDetails?.objIdx == uploadedObject.id.toString(),
            );

            return child(
              assets,
              similarSnapshots,
            );
          },
        );
      },
    );
  }
}
