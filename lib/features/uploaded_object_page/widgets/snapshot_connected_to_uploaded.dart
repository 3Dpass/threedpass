import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/domain/extentions/find_hashobject_by_snapshot.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/hash_card.dart';

class SnapshotConnectedToUploaded extends StatelessWidget {
  const SnapshotConnectedToUploaded({
    required this.uploadedObject,
    required this.topPadding,
    required this.isOnlyText,
    super.key,
  });

  final UploadedObject uploadedObject;
  final double topPadding;
  final bool isOnlyText;

  @override
  Widget build(final BuildContext context) {
    final localObjectsBloc = BlocProvider.of<HashesListBloc>(context).state;
    if (!(localObjectsBloc is HashesListLoaded)) {
      return const SizedBox();
    }
    // localObjectsBloc as HashesListLoaded;

    final localObjects = localObjectsBloc.objects;
    final localSnapshots = <Snapshot>[];
    localObjects.forEach((final obj) => localSnapshots.addAll(obj.snapshots));

    final similarSnapshots = <Snapshot>[];
    localSnapshots.forEach((final snapshot) {
      for (final snapHash in snapshot.hashes) {
        if (uploadedObject.hashes.contains(snapHash)) {
          similarSnapshots.add(snapshot);
          break;
        }
      }
    });

    if (similarSnapshots.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: topPadding,
        ),
        const D3pBodyMediumText(
          'local_snapshots_with_same_hashes',
          color: D3pColors.disabled,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: similarSnapshots.length,
          itemBuilder: (final context, final index) {
            if (isOnlyText) {
              return D3pBodyMediumText(
                similarSnapshots[index].name,
                translate: false,
              );
            } else {
              final snap = similarSnapshots[index];
              final hashObject = localObjectsBloc.findBySnapshot(snap)!;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SnapshotCard(
                  snapshot: snap,
                  hashObject: hashObject,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
