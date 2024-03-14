import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/hash_card.dart';

class SelectableSnapshotCard extends StatelessWidget {
  const SelectableSnapshotCard({
    required this.snapshot,
    required this.hashObject,
    this.onTap,
    super.key,
  });

  final Snapshot snapshot;
  final HashObject hashObject;
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SelectSnapshotsCubit, SelectSnapshotsState>(
      buildWhen: (final previous, final current) =>
          previous.areSelectable != current.areSelectable ||
          previous.snaps.contains(snapshot) != current.snaps.contains(snapshot),
      builder: (final _, final state) => SnapshotCard(
        snapshot: snapshot,
        hashObject: hashObject,
        onTap: state.areSelectable
            ? () =>
                BlocProvider.of<SelectSnapshotsCubit>(context).toggle(snapshot)
            : null,
        areSelectable: state.areSelectable,
        isSelected: state.snaps.contains(snapshot),
        setGlobalKey: true,
      ),
    );
  }
}
