part of 'hashes_list_bloc.dart';

abstract class HashesListState {
  const HashesListState();
}

class HashesListInitial extends HashesListState {}

class HashesListLoaded extends HashesListState {
  const HashesListLoaded({
    required this.objects,
    this.requiresScroll = false,
  });

  final List<HashObject> objects;
  final bool requiresScroll;
}
