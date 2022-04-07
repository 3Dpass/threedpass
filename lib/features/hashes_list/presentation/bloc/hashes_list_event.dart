part of 'hashes_list_bloc.dart';

abstract class HashesListEvent {
  const HashesListEvent();
}

class DeleteHash extends HashesListEvent {
  final HashesModel model;
  const DeleteHash({
    required this.model,
  });
} // TODO Unimplemented
