import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/hash_card.dart';

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

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: listToShow.length,
      itemBuilder: (final context, final index) {
        // final areSelectable =
        //     BlocProvider.of<SelectSnapshotsCubit>(context).state.areSelectable;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: SnapshotCard(
            snapshot: listToShow[index],
            hashObject: currentObject,
          ),
        );
      },
    );
  }
}
