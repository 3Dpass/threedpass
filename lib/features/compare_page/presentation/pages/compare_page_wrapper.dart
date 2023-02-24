import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/compare_page/bloc/compare_cubit.dart';
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
    return BlocProvider<CompareCubit>(
      create: (final _) => CompareCubit(
        comparisons.first,
        origObj: origObj,
        snapshotsToCompare: comparisons,
        stableHashes: hashObject.stableHashes,
      ),
      child: ComparePage(),
    );
  }
}
