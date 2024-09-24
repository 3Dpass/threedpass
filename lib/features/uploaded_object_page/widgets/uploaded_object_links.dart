import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/asset_connected_to_uploaded.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/snapshot_connected_to_uploaded.dart';

class UploadedObjectLinks extends StatelessWidget {
  const UploadedObjectLinks({required this.uploadedObject, super.key});
  final UploadedObject uploadedObject;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Links'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        _LinksDataWrapper(uploadedObject),
      ],
    );
  }
}

class _LinksDataWrapper extends StatelessWidget {
  final UploadedObject uploadedObject;

  const _LinksDataWrapper(this.uploadedObject);

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

            return _LinkBody(
              assets: assets,
              snapshots: similarSnapshots,
            );
          },
        );
      },
    );
  }
}

class _LinkBody extends StatelessWidget {
  final Iterable<Snapshot> snapshots;
  final Iterable<PoscanAssetData> assets;

  const _LinkBody({
    required this.snapshots,
    required this.assets,
  });

  @override
  Widget build(final BuildContext context) {
    if (snapshots.isEmpty && assets.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text('No links found'),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AssetsConnectedToUploaded(assets: assets),
          if (snapshots.isNotEmpty) const H8(),
          SnapshotConnectedToUploaded(snapshots: snapshots),
        ],
      );
    }
  }
}
