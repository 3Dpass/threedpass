part of 'hashes_list_bloc.dart';

abstract class HashesListEvent {
  const HashesListEvent();
}

class DeleteHash extends HashesListEvent {
  const DeleteHash({
    required this.model,
  });

  final HashesModel model;
}

class SaveNewHash extends HashesListEvent {
  const SaveNewHash({
    required this.model,
  });

  final HashesModel model;
}

class UpdateHashesList extends HashesListEvent {
  const UpdateHashesList({
    required this.hashes,
  });

  final List<HashesModel> hashes;
}
