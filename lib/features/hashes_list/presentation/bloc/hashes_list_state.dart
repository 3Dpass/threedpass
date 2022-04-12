part of 'hashes_list_bloc.dart';

abstract class HashesListState {
  const HashesListState();
}

class HashesListInitial extends HashesListState {}

class HashesListLoaded extends HashesListState {
  final List<HashesModel> hashes;
  const HashesListLoaded({
    required this.hashes,
  });
}
