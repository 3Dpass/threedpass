import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';
import 'package:threedpass/features/poscan_objects_query/data/objects_storage.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

part 'poscan_objects_cubit.g.dart';

@CopyWith()
class PoscanObjectsState {
  final bool isLoading;
  final String? message;
  final int? storageCount; // Objects in storage

  const PoscanObjectsState({
    required this.isLoading,
    required this.message,
    required this.storageCount,
  });

  const PoscanObjectsState.initial()
      : isLoading = true,
        message = null,
        storageCount = null;
}

enum PoscanObjectStateStatus {
  loading,
  loaded,
}

class PoscanObjectsCubit extends Cubit<PoscanObjectsState> {
  PoscanObjectsCubit({
    required this.getObjCount,
    required this.getUploadedObject,
    required this.store,
  }) : super(const PoscanObjectsState.initial());

  final PagingController<int, UploadedObject> pagingController =
      PagingController(firstPageKey: 0);

  final ObjectsStore store;

  Future<void> init() async {
    final realCount = (await getObjCount.call(null))
        .when(left: (final _) => null, right: (final realValue) => realValue);

    if (realCount != null) {
      pagingController.addPageRequestListener((final pageKey) async {
        print('GET OBJECT ID: $pageKey');

        UploadedObject? uploadedObject;
        bool gotFromCache = false;

        // Get from cache
        uploadedObject = await store.get(pageKey);

        if (uploadedObject == null || !uploadedObject.isFinished) {
          // If no cache, get from node
          final objEither = await getUploadedObject.call(pageKey);

          objEither.when(
            left: (final e) {
              logE(e.cause ?? e.toString(), StackTrace.current);
            },
            right: (final data) {
              uploadedObject = data;
            },
          );
        } else {
          // Or set flag
          gotFromCache = true;
        }

        if (uploadedObject != null) {
          // Save to cache new approved objects
          if (!gotFromCache) {
            try {
              await store.put(uploadedObject!);
            } on Object catch (e) {
              logE(e, StackTrace.current);
            }
          }

          if (pageKey == realCount - 1) {
            pagingController.appendLastPage([uploadedObject!]);
          } else {
            pagingController.appendPage([uploadedObject!], pageKey + 1);
          }
        }
      });

      emit(
        state.copyWith(
          storageCount: realCount,
          isLoading: false,
          message: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          storageCount: null,
          message: 'Failed to get objects count',
          isLoading: false,
        ),
      );
    }

    //

    // final realCount = await getObjCount.call(null);
    // realCount.when(
    //   left: (final failure) {
    //     logV(
    //       'Loaded ${objects.length} poScan objects from cache. But failed to get realCount',
    //     );
    //     emit(
    //       state.copyWith(
    //         status: PoscanObjectStateStatus.loaded,
    //         objects: objects.toList(),
    //         message: failure.cause,
    //       ),
    //     );
    //   },
    //   right: (final realValue) {
    //     if (realValue == objects.length) {
    //       logV('Loaded $realValue poScan objects from cache');
    //       emit(
    //         state.copyWith(
    //           status: PoscanObjectStateStatus.loaded,
    //           objects: objects.toList(),
    //           storageCount: realValue,
    //         ),
    //       );
    //     } else {
    //       emit(
    //         state.copyWith(
    //           status: PoscanObjectStateStatus.loading,
    //           objects: objects.toList(),
    //           storageCount: realValue,
    //         ),
    //       );
    //       logV(
    //         'Loaded ${objects.length} poScan objects from cache. Need $realValue',
    //       );
    //       load(from: objects.length, till: realValue);
    //     }
    //   },
    // );
  }

  final GetObjCount getObjCount;
  final GetUploadedObject getUploadedObject;

  // Future<void> load({
  //   required final int id,
  // }) async {
  //   final objEither = await getUploadedObject.call(i);
  //   objEither.when(
  //     left: (final e) => logE("Could not load object id=$i from poscan. $e"),
  //     right: (final obj) async {
  //       emit(
  //         state.copyWith(
  //           objects: state.objects + [obj],
  //         ),
  //       );
  //       await objectsStore?.put(obj.id, obj);
  //     },
  //   );

  //   emit(state.copyWith(status: PoscanObjectStateStatus.loaded));
  // }

  // Future<void> loadAll() async {
  //   emit(state.copyWith(status: PoscanObjectStateStatus.loading));

  //   final countEither = await getObjCount.call(null);
  //   await countEither.when(
  //     left: (final e) {
  //       logE("Could not load objects count from poscan. $e");
  //     },
  //     right: (final objLen) async {
  //       if (objLen != state.objects.length) {
  //         emit(state.copyWith(storageCount: objLen));
  //       }
  //       await load(from: 0, till: objLen);
  //     },
  //   );
  // }

  UploadedObject? findObjectByHashes(final List<String> hashes) {
    // for (final obj in state.objects) {
    //   for (final snapHash in hashes) {
    //     if (obj.hashes.contains(snapHash)) {
    //       return obj;
    //     }
    //   }
    // }
    return null;
  }

  Future<void> clear() async {
    pagingController.refresh();
    await store.clear();
  }
}
