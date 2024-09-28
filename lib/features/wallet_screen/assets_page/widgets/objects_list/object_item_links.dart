import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class ObjectItemLinks extends StatelessWidget {
  const ObjectItemLinks({
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
        if (assets.isNotEmpty)
          FastRichText(
            secondaryText: 'linked_assets_helper'
                .tr(args: ['assets_plural'.plural(assets.length)]),
            mainText:
                assets.map((final e) => e.foldAssetInfo(context)).join(', '),
            needSpace: true,
          ),
        if (snapshots.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: assets.isNotEmpty ? 8 : 0),
            child: Text(
              'linked_snapshots_helper'.tr(
                args: [
                  'snapshots_plural'.plural(snapshots.length),
                ],
              ),
            ), // '${snapshots.length} snapshots found'),
          ),
      ],
    );
  }
}
