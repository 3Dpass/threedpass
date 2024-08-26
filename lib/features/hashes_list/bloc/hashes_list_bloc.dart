import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';

part 'hashes_list_event.dart';
part 'hashes_list_state.dart';

class HashesListBloc extends Bloc<HashesListEvent, HashesListState> {
  HashesListBloc({
    required this.hashesRepository,
    required this.objectsDirectory,
  }) : super(HashesListInitial()) {
    on<DeleteHash>(_deleteHash);
    on<DeleteObject>(_deleteObject);
    on<AddObject>(_addObject);
    on<SaveSnapshot>(_saveSnapshot);
    on<ReplaceSnapshot>(_replaceSnapshot);
    on<_LoadHashesList>(_loadList);
    on<UnmarkNewSnap>(_unmarkNewSnap);
    on<ReplaceObject>(_replaceObject);
  }

  final HashesRepository hashesRepository;
  final ObjectsDirectory objectsDirectory;

  Future<void> init() async {
    final objects = hashesRepository.getAll();
    add(_LoadHashesList(objects: objects));
  }

  Future<void> _loadList(
    final _LoadHashesList event,
    final Emitter<HashesListState> emit,
  ) async {
    emit(
      HashesListLoaded(
        objects: event.objects,
      ),
    );
  }

  Future<void> _deleteHash(
    final DeleteHash event,
    final Emitter<HashesListState> emit,
  ) async {
    if (state is HashesListLoaded) {
      final objectsList = (state as HashesListLoaded).objects;
      final hashObj = objectsList
          .findOrNull((final obj) => obj.snapshots.contains(event.snap));

      if (hashObj == null) {
        logger.e(
            'Could not found hash obj to delete snapshot ${event.snap.name}');
        return; // TODO Report error to user
      }

      if (hashObj.snapshots.length == 1) {
        add(DeleteObject(object: hashObj));
        return;
      }

      final newSnapshotsList = List<Snapshot>.from(hashObj.snapshots);
      newSnapshotsList.remove(event.snap);

      final newObj = hashObj.copyWith(snapshots: newSnapshotsList);

      await hashesRepository.replaceObject(hashObj, newObj);

      objectsList.replace(hashObj, newObj);

      emit(
        HashesListLoaded(
          objects: List<HashObject>.from(objectsList),
        ),
      );
    }
  }

  Future<void> _deleteObject(
    final DeleteObject event,
    final Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.deleteObject(event.object);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      list.removeWhere(
        (final element) => element == event.object,
      );
      emit(
        HashesListLoaded(
          objects: list,
        ),
      );
    }
  }

  Future<void> _addObject(
    final AddObject event,
    final Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.addObject(event.object);

    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      list.add(event.object);

      emit(
        HashesListLoaded(
          objects: list,
          requiresScroll: true,
        ),
      );
    }
  }

  Future<void> _saveSnapshot(
    final SaveSnapshot event,
    final Emitter<HashesListState> emit,
  ) async {
    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      final newObj = event.object
          .copyWith(snapshots: [...event.object.snapshots, event.hash]);
      await hashesRepository.replaceObject(event.object, newObj);
      list.replace(event.object, newObj);

      emit(
        HashesListLoaded(
          objects: List<HashObject>.from(list),
          requiresScroll: true,
        ),
      );
    }
  }

  Future<void> _replaceSnapshot(
    final ReplaceSnapshot event,
    final Emitter<HashesListState> emit,
  ) async {
    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;

      final newSnapshotsList = List<Snapshot>.from(event.object.snapshots);
      newSnapshotsList.replace(event.oldSnapshot, event.newSnapshot);
      final newObj = event.object.copyWith(snapshots: newSnapshotsList);
      await hashesRepository.replaceObject(event.object, newObj);
      list.replace(event.object, newObj);

      emit(
        HashesListLoaded(
          objects: List<HashObject>.from(list),
        ),
      );
    }
  }

  Future<void> _unmarkNewSnap(
    final UnmarkNewSnap event,
    final Emitter<HashesListState> emit,
  ) async {
    if (state is HashesListLoaded) {
      final list = (state as HashesListLoaded).objects;
      final obj = event.object;

      // find old snapshot place
      final oldSnapIndex = obj.snapshots.indexOf(event.snap);
      // replace it with new one
      if (oldSnapIndex != -1) {
        obj.snapshots[oldSnapIndex] = event.snap.copyWith(isNew: false);
        emit(
          HashesListLoaded(objects: list),
        );
      } else {
        logger.e(
          'Not found a snapshot in object ${obj.name}. Snapshot name=${event.snap.name}',
        );
      }
    }
  }

  Future<void> _replaceObject(
    final ReplaceObject event,
    final Emitter<HashesListState> emit,
  ) async {
    if (state is HashesListLoaded) {
      final stateLL = state as HashesListLoaded;
      final list = stateLL.objects;
      list.replace(event.oldObj, event.newObj);
      emit(
        HashesListLoaded(objects: list),
      );
      await hashesRepository.replaceObject(event.oldObj, event.newObj);
    } else {
      logger.e('Replace object is called, but state is not HashesListLoaded');
      return;
    }
  }
}
