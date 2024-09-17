import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';

part 'hashes_list_event.dart';
part 'hashes_list_state.dart';
part 'hashes_list_bloc.freezed.dart';

class HashesListBloc extends Bloc<HashesListEvent, HashesListState> {
  HashesListBloc({
    required this.hashesRepository,
    required this.objectsDirectory,
  }) : super(
          const HashesListState(
            objects: [],
            loaded: false,
            isDeletingInProcess: false,
            requiresScroll: false,
          ),
        ) {
    on<DeleteSnapshots>(_deleteHash);
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
      state.copyWith(
        objects: event.objects,
        loaded: true,
      ),
    );
  }

  Future<void> _deleteHash(
    final DeleteSnapshots event,
    final Emitter<HashesListState> emit,
  ) async {
    if (!state.isDeletingInProcess) {
      emit(state.copyWith(isDeletingInProcess: true));
      print('Set isDeletingInProcess');
    }

    final objectsList = List<HashObject>.from(state.objects);

    for (final snap in event.snapshots) {
      logger.t('Start deleting snapshot ${snap.name}');

      // objectsList.forEach((final obj) {
      //   logger.t(
      //     'Obj ${obj.name} has ${obj.snapshots.length} snaps: ${obj.snapshots.map((e) => e.name).join('\n')}',
      //   );
      // });

      final hashObj =
          objectsList.findOrNull((final obj) => obj.snapshots.contains(snap));

      if (hashObj == null) {
        logger.e(
          'Could not found hash obj to delete snapshot ${snap.name}',
        );
        continue;
      }

      if (hashObj.snapshots.length == 1) {
        // If single snapshot, delete object
        await deleteObjectUtil(objects: objectsList, objectToDelete: hashObj);
      } else {
        // If more than one snapshot, replace object with fewer snapshots
        final newSnapshotsList = List<Snapshot>.from(hashObj.snapshots);
        newSnapshotsList.remove(snap);
        final newObj = hashObj.copyWith(snapshots: newSnapshotsList);
        await hashesRepository.replaceObject(hashObj, newObj);
        objectsList.replace(hashObj, newObj);
      }

      logger.t('Finish deleting snapshot ${snap.name}');
    }

    emit(
      state.copyWith(
        objects: objectsList,
        isDeletingInProcess: false,
      ),
    );
  }

  Future<void> _deleteObject(
    final DeleteObject event,
    final Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.deleteObject(event.object);
    final list = List<HashObject>.from(state.objects);
    await deleteObjectUtil(objects: list, objectToDelete: event.object);
    emit(
      state.copyWith(objects: list),
    );
  }

  Future<void> deleteObjectUtil({
    required final List<HashObject> objects,
    required final HashObject objectToDelete,
  }) async {
    await hashesRepository.deleteObject(objectToDelete);
    objects.removeWhere(
      (final element) => element == objectToDelete,
    );
  }

  Future<void> _addObject(
    final AddObject event,
    final Emitter<HashesListState> emit,
  ) async {
    await hashesRepository.addObject(event.object);

    final list = List<HashObject>.from(state.objects);
    list.add(event.object);

    emit(
      state.copyWith(
        objects: list,
        requiresScroll: true,
      ),
    );
  }

  Future<void> _saveSnapshot(
    final SaveSnapshot event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.objects);
    final newObj = event.object
        .copyWith(snapshots: [...event.object.snapshots, event.hash]);
    await hashesRepository.replaceObject(event.object, newObj);
    list.replace(event.object, newObj);

    emit(
      state.copyWith(
        objects: list,
        requiresScroll: true,
      ),
    );
  }

  Future<void> _replaceSnapshot(
    final ReplaceSnapshot event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.objects);

    final newSnapshotsList = List<Snapshot>.from(event.object.snapshots);
    newSnapshotsList.replace(event.oldSnapshot, event.newSnapshot);
    final newObj = event.object.copyWith(snapshots: newSnapshotsList);
    await hashesRepository.replaceObject(event.object, newObj);
    list.replace(event.object, newObj);

    emit(
      state.copyWith(objects: list),
    );
  }

  Future<void> _unmarkNewSnap(
    final UnmarkNewSnap event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.objects);
    final obj = event.object;

    // find old snapshot place
    final oldSnapIndex = obj.snapshots.indexOf(event.snap);
    // replace it with new one
    if (oldSnapIndex != -1) {
      obj.snapshots[oldSnapIndex] = event.snap.copyWith(isNew: false);
      emit(
        state.copyWith(objects: list),
      );
    }
  }

  Future<void> _replaceObject(
    final ReplaceObject event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.objects);
    list.replace(event.oldObj, event.newObj);
    emit(
      state.copyWith(objects: list),
    );
    await hashesRepository.replaceObject(event.oldObj, event.newObj);
  }
}
