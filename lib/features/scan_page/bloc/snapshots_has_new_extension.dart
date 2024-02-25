import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

extension HasNew on HashesListLoaded {
  bool get hasNew => objects.any(
        (final element) =>
            element.snapshots.any((final element) => element.isNew),
      );

  Snapshot get firstNew => objects
      .firstWhere((final element) =>
          element.snapshots.any((final element) => element.isNew))
      .snapshots
      .firstWhere((final element) => element.isNew);
}
