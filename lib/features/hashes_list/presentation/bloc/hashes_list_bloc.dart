import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';

part 'hashes_list_event.dart';
part 'hashes_list_state.dart';

class HashesListBloc extends Bloc<HashesListEvent, HashesListState> {
  HashesListBloc({
    required this.hashesRepository,
  }) : super(HashesListInitial()) {
    on<DeleteHash>(_deleteHash);
    on<DeleteObject>(_deleteObject);
    on<SaveObject>(_saveObject);
    on<SaveSnapshot>(_saveSnapshot);
    on<UpdateHashesList>(_updateList);
  }

  final HashesRepository hashesRepository;

  Future<void> init() async {
    final objects = hashesRepository.getAll();
    add(UpdateHashesList(objects: objects));
  }

  Future<void> _updateList(
    UpdateHashesList event,
    Emitter<HashesListState> emit,
  ) async {
    emit(HashesListLoaded(objects: event.objects));
  }

  Future<void> _deleteHash(
    DeleteHash event,
    Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.saveObject(event.object);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      bool f = false;
      for (var obj in list) {
        if (obj.localId == event.object.localId) {
          obj.snapshots.removeWhere(
              (snap) => listEquals(event.hash.hashes, snap.hashes));
          f = true;
          break;
        }
      }
      if (!f) {
        logger.e(
          'Not found an object with id=${event.object.localId} name=${event.object.name}',
        );
      }
      emit(HashesListLoaded(objects: list));
    }
  }

  Future<void> _deleteObject(
    DeleteObject event,
    Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.deleteObject(event.object);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      list.removeWhere((element) => element.localId == event.object.localId);
      emit(HashesListLoaded(objects: list));
    }
  }

  Future<void> _saveObject(
    SaveObject event,
    Emitter<HashesListState> emit,
  ) async {
    hashesRepository.saveObject(event.object);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      list.add(event.object);
      emit(HashesListLoaded(objects: list));
    }
  }

  Future<void> _saveSnapshot(
    SaveSnapshot event,
    Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.saveObject(event.object);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      bool f = false;
      for (var obj in list) {
        if (obj.localId == event.object.localId) {
          obj.snapshots.add(event.hash);
          f = true;
          break;
        }
      }
      if (!f) {
        logger.e(
          'Not found an object with id=${event.object.localId} name=${event.object.name}',
        );
      }
      emit(HashesListLoaded(objects: list));
    }
  }
}
