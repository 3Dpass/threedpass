import 'package:flutter/material.dart';
import 'package:threedpass/features/compare_page/presentation/pages/compare_page.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class ComparePageWrapper extends StatelessWidget {
  const ComparePageWrapper({
    required this.origObj,
    required this.hashObject,
    final Key? key,
  }) : super(key: key);

  final HashObject hashObject;
  final Snapshot origObj;

  @override
  Widget build(final BuildContext context) {
    final comparisons = <Snapshot>[...hashObject.snapshots]
      ..removeWhere((final element) => element == origObj);
    return ComparePage(
      origObj: origObj,
      comparisons: comparisons,
      stableHashes: hashObject.stableHashes.toList(),
    );
  }
}
