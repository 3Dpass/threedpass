part of 'hashes_list_bloc.dart';

@Freezed(copyWith: true, equal: false, fromJson: false, toJson: false)
class HashesListState with _$HashesListState {
  const factory HashesListState({
    required final List<HashObject> objects,
    required final bool loaded,
    required final bool isDeletingInProcess,
    required final bool requiresScroll,
  }) = _HashesListState;
}
