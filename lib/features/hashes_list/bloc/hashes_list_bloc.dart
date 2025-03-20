import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/list_extensions.dart';

import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';
import 'package:threedpass/features/scan_page/bloc/objects_expanded_cubit.dart';

part 'hashes_list_event.dart';
part 'hashes_list_state.dart';
part 'hashes_list_bloc.freezed.dart';

typedef HashesListState = AsyncValue<_HashesListState>;

class HashesListBloc
    extends Bloc<HashesListEvent, AsyncValue<_HashesListState>> {
  HashesListBloc({
    required this.hashesRepository,
    required this.objectsDirectory,
    required this.objectsExpandedCubit,
  }) : super(
          const AsyncValue.loading(
            _HashesListState(
              objects: [],
            ),
          ),
        ) {
    on<DeleteSnapshots>(_deleteHash);
    on<AddObject>(_addObject);
    on<SaveSnapshot>(_saveSnapshot);
    on<ReplaceSnapshot>(_replaceSnapshot);
    on<_LoadHashesList>(_loadList);
    on<UnmarkNewSnap>(_unmarkNewSnap);
    on<ReplaceObject>(_replaceObject);
  }

  final HashesRepository hashesRepository;
  final ObjectsDirectory objectsDirectory;
  final ObjectsExpandedCubit objectsExpandedCubit;

  Future<void> init() async {
    final objects = hashesRepository.getAll();
    add(_LoadHashesList(objects: objects));
  }

  Future<void> _loadList(
    final _LoadHashesList event,
    final Emitter<HashesListState> emit,
  ) async {
    emit(
      AsyncValue.data(
        _HashesListState(
          objects: event.objects,
        ),
      ),
    );
  }

  Future<void> _deleteHash(
    final DeleteSnapshots event,
    final Emitter<HashesListState> emit,
  ) async {
    if (!state.isLoading) {
      emit(AsyncValue.loading(state.value));
      print('Set isDeletingInProcess');
    }

    final objectsList = List<HashObject>.from(state.value!.objects);

    for (final snap in event.snapshots) {
      logger.t('Start deleting snapshot ${snap.name}');

      // objectsList.forEach((final obj) {
      //   logger.t(
      //     'Obj ${obj.name} has ${obj.snapshots.length} snaps: ${obj.snapshots.map((e) => e.name).join('\n')}',
      //   );
      // });

      final hashObj = objectsList
          .firstWhereOrNull((final obj) => obj.snapshots.contains(snap));

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
        objectsExpandedCubit.changeKey(hashObj, newObj);
      }

      logger.t('Finish deleting snapshot ${snap.name}');
    }
    emit(
      AsyncValue.data(
        _HashesListState(
          objects: objectsList,
        ),
      ),
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

    final list = List<HashObject>.from(state.value!.objects);
    list.add(event.object);

    emit(
      AsyncValue.data(
        state.value!.copyWith(
          objects: list,
        ),
      ),
    );
  }

  Future<void> _saveSnapshot(
    final SaveSnapshot event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.value!.objects);
    final newObj = event.object
        .copyWith(snapshots: [...event.object.snapshots, event.hash]);
    await hashesRepository.replaceObject(event.object, newObj);
    list.replace(event.object, newObj);
    objectsExpandedCubit.changeKey(event.object, newObj);

    emit(
      AsyncValue.data(
        state.value!.copyWith(
          objects: list,
        ),
      ),
    );
  }

  Future<void> _replaceSnapshot(
    final ReplaceSnapshot event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.value!.objects);
    final newSnapshotsList = List<Snapshot>.from(event.object.snapshots);
    newSnapshotsList.replace(event.oldSnapshot, event.newSnapshot);
    final newObj = event.object.copyWith(snapshots: newSnapshotsList);
    await hashesRepository.replaceObject(event.object, newObj);
    list.replace(event.object, newObj);
    objectsExpandedCubit.changeKey(event.object, newObj);

    emit(
      AsyncValue.data(
        state.value!.copyWith(
          objects: list,
        ),
      ),
    );

    event.onReplaced();
  }

  Future<void> _unmarkNewSnap(
    final UnmarkNewSnap event,
    final Emitter<HashesListState> emit,
  ) async {
    // find old snapshot place
    final oldSnapIndex = event.object.snapshots.indexOf(event.snap);
    final newSnap = event.snap.copyWith(isNew: false);

    // replace it with new one
    if (oldSnapIndex != -1) {
      event.object.snapshots[oldSnapIndex] = newSnap;
      emit(
        AsyncValue.data(
          state.value!.copyWith(
            objects: List<HashObject>.from(state.value!.objects),
          ),
        ),
      );
      event.onUmarked(newSnap);
    } else {
      logger
          .e('Could not find snapshot name=${event.snap.name} to unmark new.');
    }
  }

  Future<void> _replaceObject(
    final ReplaceObject event,
    final Emitter<HashesListState> emit,
  ) async {
    final list = List<HashObject>.from(state.value!.objects);
    list.replace(event.oldObj, event.newObj);
    objectsExpandedCubit.changeKey(event.oldObj, event.newObj);
    emit(
      AsyncValue.data(
        state.value!.copyWith(
          objects: list,
        ),
      ),
    );
    await hashesRepository.replaceObject(event.oldObj, event.newObj);
  }
}
