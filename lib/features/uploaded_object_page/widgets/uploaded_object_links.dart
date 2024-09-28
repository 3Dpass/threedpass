import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/asset_connected_to_uploaded.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/snapshot_connected_to_uploaded.dart';

class UploadedObjectLinks extends StatelessWidget {
  const UploadedObjectLinks({
    required this.assets,
    required this.snapshots,
    super.key,
  });

  final Iterable<PoscanAssetData> assets;
  final Iterable<Snapshot> snapshots;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'uploaded_object_links_subtitle'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        _UploadedObjectLinksList(
          assets: assets,
          snapshots: snapshots,
        ),
      ],
    );
  }
}

class _UploadedObjectLinksList extends StatelessWidget {
  final Iterable<Snapshot> snapshots;
  final Iterable<PoscanAssetData> assets;

  const _UploadedObjectLinksList({
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
