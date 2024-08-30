import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_owned_objects_ids.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

part 'poscan_objects_cubit.g.dart';

@CopyWith()
class PoscanObjectsState {
  @Deprecated('Use AsyncValue')
  final bool isLoading;
  final String? message;
  final int? storageCount; // Objects in remote storage
  @Deprecated('Use AsyncValue')
  final bool areOwnerObjectsLoading;

  const PoscanObjectsState({
    required this.isLoading,
    required this.message,
    required this.storageCount,
    required this.areOwnerObjectsLoading,
  });

  const PoscanObjectsState.initial()
      : isLoading = true,
        areOwnerObjectsLoading = true,
        message = null,
        storageCount = null;
}

class PoscanObjectsCubit extends Cubit<PoscanObjectsState> {
  PoscanObjectsCubit({
    required this.getObjCount,
    required this.getUploadedObject,
    required this.getOwnedObjectsIds,
    required this.store,
    required this.hashesListBloc,
  }) : super(const PoscanObjectsState.initial());

  final PagingController<int, UploadedObject> pagingController =
      PagingController(firstPageKey: 0);

  final PoScanLocalRepository store; // TODO Refactor remove repo from cubit
  final GetObjCount getObjCount;
  final GetUploadedObject getUploadedObject;
  final GetOwnedObjectsIds getOwnedObjectsIds;
  final HashesListBloc hashesListBloc;

  Future<void> downloadOwnerObjects(final KeyPairData account) async {
    emit(state.copyWith(areOwnerObjectsLoading: true));
    final ids = await getOwnedObjectsIds.call(account.pubKey!).then(
          (final value) => value.when(
            left: (final _) => null,
            right: (final ids) => ids,
          ),
        );

    logger.t('Load user objects by ids: $ids');

    if (ids != null) {
      for (final id in ids) {
        final _ = await getUploadedObject.call(id);
      }
    }

    emit(state.copyWith(areOwnerObjectsLoading: false));
  }

  Future<void> setObjCount() async {
    final realCount = (await getObjCount.call(null))
        .when(left: (final _) => null, right: (final realValue) => realValue);
    if (realCount != state.storageCount) {
      emit(state.copyWith(storageCount: realCount));
    }
  }

  Future<void> pageRequestListener(final int pageKey) async {
    logger.t('Request object id: $pageKey');

    final objEither = await getUploadedObject.call(pageKey);

    objEither.when(
      left: (final e) {
        logger.e(e.cause ?? e.toString());
      },
      right: (final uploadedObject) {
        final objectsLen = state.storageCount;
        if (objectsLen != null && pageKey == objectsLen - 1) {
          pagingController.appendLastPage([uploadedObject]);
        } else {
          pagingController.appendPage([uploadedObject], pageKey + 1);
        }
      },
    );
  }

  Future<void> init() async {
    await setObjCount();

    if (state.storageCount != null) {
      pagingController.addPageRequestListener(pageRequestListener);
      emit(
        state.copyWith(
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
  }

  Future<List<UploadedObject>> getUserObjects(final String address) async {
    await store.initialized.future;
    return store.filterByOwner(address);
  }

  Future<UploadedObject?> findObjectByHashes(final List<String> hashes) async {
    await store.initialized.future;
    return store.firstIfContainsAnyHash(hashes);
  }

  Future<void> refresh() async {
    logger.t('Explorer refresh is called');
    await setObjCount();
    pagingController.refresh();
  }
}
