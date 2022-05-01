part of 'hashes_list_bloc.dart';

abstract class HashesListEvent {
  const HashesListEvent();
}

class DeleteHash extends HashesListEvent {
  const DeleteHash({
    required this.hash,
    required this.object,
  });

  final Snapshot hash;
  final HashObject object;
}

class DeleteObject extends HashesListEvent {
  const DeleteObject({
    required this.object,
  });

  final HashObject object;
}

class SaveSnapshot extends HashesListEvent {
  const SaveSnapshot({
    required this.hash,
    required this.object,
  });

  final Snapshot hash;
  final HashObject object;
}

class AddObject extends HashesListEvent {
  const AddObject({
    required this.object,
  });

  final HashObject object;
}

class UpdateHashesList extends HashesListEvent {
  const UpdateHashesList({
    required this.objects,
  });

  final List<HashObject> objects;
}
