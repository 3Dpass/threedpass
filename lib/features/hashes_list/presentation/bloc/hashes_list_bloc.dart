import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';

part 'hashes_list_event.dart';
part 'hashes_list_state.dart';

class HashesListBloc extends Bloc<HashesListEvent, HashesListState> {
  HashesListBloc({
    required this.hashesRepository,
  }) : super(HashesListInitial()) {
    on<DeleteHash>(_deleteHash);
    on<SaveNewHash>(_saveHash);
    on<UpdateHashesList>(_updateList);
  }

  final HashesRepository hashesRepository;

  Future<void> init() async {
    final hashes = hashesRepository.getAll();
    add(UpdateHashesList(hashes: hashes));
  }

  Future<void> _updateList(
    UpdateHashesList event,
    Emitter<HashesListState> emit,
  ) async {
    emit(HashesListLoaded(hashes: event.hashes));
  }

  Future<void> _deleteHash(
    DeleteHash event,
    Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.deleteHash(event.model);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).hashes;
      list.removeWhere((element) => element == event.model);
      emit(HashesListLoaded(hashes: list));
    }
  }

  Future<void> _saveHash(
    SaveNewHash event,
    Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.saveHash(event.model);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).hashes;
      list.add(event.model);
      emit(HashesListLoaded(hashes: list));
    }
  }
}
