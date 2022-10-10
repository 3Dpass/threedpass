import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/hash_card.dart';

class SnapshotsList extends StatelessWidget {
  const SnapshotsList({
    required this.currentObject,
    final Key? key,
  }) : super(key: key);

  final HashObject currentObject;

  @override
  Widget build(final BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentObject.snapshots.length,
        itemBuilder: (final context, final hashIndex) => SnapshotCard(
          snapshot: currentObject.snapshots[hashIndex],
          hashObject: currentObject,
        ),
      );
}
