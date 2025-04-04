part of 'hashes_list_bloc.dart';

abstract class HashesListEvent {
  const HashesListEvent();
}

class DeleteSnapshots extends HashesListEvent {
  const DeleteSnapshots({
    required this.snapshots,
  });

  final List<Snapshot> snapshots;
}

class SaveSnapshot extends HashesListEvent {
  const SaveSnapshot({
    required this.hash,
    required this.object,
  });

  final Snapshot hash;
  final HashObject object;
}

class ReplaceSnapshot extends HashesListEvent {
  const ReplaceSnapshot({
    required this.oldSnapshot,
    required this.newSnapshot,
    required this.object,
    required this.onReplaced,
  });

  final Snapshot newSnapshot;
  final Snapshot oldSnapshot;
  final HashObject object;
  final VoidCallback onReplaced;
}

class ReplaceObject extends HashesListEvent {
  const ReplaceObject({
    required this.oldObj,
    required this.newObj,
  });

  final HashObject newObj;
  final HashObject oldObj;
}

class AddObject extends HashesListEvent {
  const AddObject({
    required this.object,
  });

  final HashObject object;
}

class _LoadHashesList extends HashesListEvent {
  const _LoadHashesList({
    required this.objects,
  });

  final List<HashObject> objects;
}

class UnmarkNewSnap extends HashesListEvent {
  const UnmarkNewSnap({
    required this.object,
    required this.snap,
    required this.onUmarked,
  });

  final Snapshot snap;
  final HashObject object;
  final void Function(Snapshot snap) onUmarked;
}
