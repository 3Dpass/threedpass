import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class SnapshotConnectedToUploaded extends StatelessWidget {
  const SnapshotConnectedToUploaded({
    required this.uploadedObject,
    required this.topPadding,
    super.key,
  });

  final UploadedObject uploadedObject;
  final double topPadding;

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
      final a = List<String>.from(snapshot.hashes);
      a.sort();

      final b = List<String>.from(uploadedObject.hashes);
      b.sort();

      if (listEquals(a, b)) {
        similarSnapshots.add(snapshot);
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
        D3pBodyMediumText('Local snapshots with same hashes'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: similarSnapshots.length,
          itemBuilder: (final context, final index) {
            return D3pBodyMediumText(similarSnapshots[index].name);
          },
        ),
      ],
    );
  }
}
