import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

extension FindHashObjectBySnapshot on HashesListState {
  HashObject? findBySnapshot(final Snapshot snapshot) {
    for (final hashObject in this.value?.objects ?? <HashObject>[]) {
      if (hashObject.snapshots.contains(snapshot)) {
        return hashObject;
      }
    }

    return null;
  }
}
