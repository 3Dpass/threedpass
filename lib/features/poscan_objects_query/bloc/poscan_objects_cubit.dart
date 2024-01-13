import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';
import 'package:threedpass/features/poscan_objects_query/data/objects_storage.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

part 'poscan_objects_cubit.g.dart';

@CopyWith()
class PoscanObjectsState {
  final List<UploadedObject> objects;
  final PoscanObjectStateStatus status;
  final String? message;

  const PoscanObjectsState({
    required this.objects,
    required this.status,
    this.message,
  });

  const PoscanObjectsState.initial()
      : objects = const [],
        message = null,
        status = PoscanObjectStateStatus.loaded;
}

enum PoscanObjectStateStatus {
  loading,
  loaded,
}

class PoscanObjectsCubit extends Cubit<PoscanObjectsState> {
  PoscanObjectsCubit({
    required this.getObjCount,
    required this.getUploadedObject,
  }) : super(const PoscanObjectsState.initial());

  Future<void> init(final ObjectsStore store) async {
    emit(state.copyWith(status: PoscanObjectStateStatus.loading));

    logv('Initializing poScan objects cache');

    objectsStore = store;
    await objectsStore!.init();

    final objects = objectsStore!.getAll().toList();

    final realCount = await getObjCount.call(null);
    realCount.when(
      left: (final failure) {
        logv(
          'Loaded ${objects.length} poScan objects from cache. But failed to get realCount',
        );
        emit(
          state.copyWith(
            status: PoscanObjectStateStatus.loaded,
            objects: objects.toList(),
            message: failure.cause,
          ),
        );
      },
      right: (final realValue) {
        if (realValue == objects.length) {
          logv('Loaded $realValue poScan objects from cache');
          emit(
            state.copyWith(
              status: PoscanObjectStateStatus.loaded,
              objects: objects.toList(),
            ),
          );
        } else {
          logv(
            'Loaded ${objects.length} poScan objects from cache. Need $realValue',
          );
          load(from: objects.length, till: realValue);
        }
      },
    );
  }

  final GetObjCount getObjCount;
  final GetUploadedObject getUploadedObject;
  ObjectsStore? objectsStore;

  Future<void> load({
    required final int from,
    required final int till,
  }) async {
    for (int i = from; i < till; i++) {
      final objEither = await getUploadedObject.call(i);
      objEither.when(
        left: (final e) => logE("Could not load object id=$i from poscan. $e"),
        right: (final obj) async {
          emit(
            state.copyWith(
              objects: state.objects + [obj],
            ),
          );
          await objectsStore?.put(obj.id, obj);
        },
      );
    }

    emit(state.copyWith(status: PoscanObjectStateStatus.loaded));
  }

  Future<void> loadAll() async {
    emit(state.copyWith(status: PoscanObjectStateStatus.loading));

    final countEither = await getObjCount.call(null);
    await countEither.when(
      left: (final e) {
        logE("Could not load objects count from poscan. $e");
      },
      right: (final objLen) async {
        await load(from: 0, till: objLen);
      },
    );
  }

  UploadedObject? findObjectByHashes(final List<String> hashes) {
    for (final obj in state.objects) {
      for (final snapHash in hashes) {
        if (obj.hashes.contains(snapHash)) {
          return obj;
        }
      }
    }
    return null;
  }

  void clear() {
    emit(const PoscanObjectsState.initial());
  }
}
