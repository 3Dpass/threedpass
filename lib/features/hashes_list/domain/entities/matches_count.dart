import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

/// Calc how many snapshots include same hashes as the given snapshot
class MatchesCount {
  // TODO Use it somewhere
  final HashObject? object;
  final Snapshot snapshot;

  const MatchesCount({
    required this.object,
    required this.snapshot,
  });

  int get matchesCount {
    if (object == null) {
      return 0;
    }

    final list = List<Snapshot>.from(object!.snapshots);
    list.remove(snapshot);

    var matches = 0;

    for (final s in list) {
      for (final hash in snapshot.hashes) {
        if (s.hashes.contains(hash)) {
          matches++;
          break;
        }
      }
    }

    return matches;
  }
}
