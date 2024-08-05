import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/selectable_snapshot_card.dart';

class SnapshotsList extends StatelessWidget {
  const SnapshotsList({
    required this.currentObject,
    required this.allowedFileHash,
    final Key? key,
  }) : super(key: key);

  final HashObject currentObject;
  final int allowedFileHash;

  @override
  Widget build(final BuildContext context) {
    final listToShow = <Snapshot>[];

    for (final snap in currentObject.snapshots) {
      if (snap.fileHash == allowedFileHash) {
        listToShow.add(snap);
      }
    }

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      // primary: false,
      shrinkWrap: true,
      itemCount: listToShow.length,
      separatorBuilder: (final context, final index) => const H4(),
      itemBuilder: (final context, final index) => SelectableSnapshotCard(
        snapshot: listToShow[index],
        hashObject: currentObject,
      ),
    );
  }
}
