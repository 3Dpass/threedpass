import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';
import 'package:threedpass/setup.dart';

part 'poscan_objects_cubit.g.dart';

@CopyWith()
class PoscanObjectsState {
  final List<UploadedObject> objects;
  final PoscanObjectStateStatus status;

  const PoscanObjectsState({
    required this.objects,
    required this.status,
  });

  const PoscanObjectsState.initial()
      : objects = const [],
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

  final GetObjCount getObjCount;
  final GetUploadedObject getUploadedObject;

  // int get lastLoadedId => state.objects.isEmpty ? 0 : state.objects.last.id;
  // bool get isLoadedFull => state.length == ;

  Future<void> loadAll() async {
    emit(state.copyWith(status: PoscanObjectStateStatus.loading));

    final countEither = await getObjCount.call(null);
    await countEither.when(
      left: (final e) {
        getIt<Logger>().e("Could not load objects count from poscan. $e");
      },
      right: (final objLen) async {
        final indicies = List.generate(objLen, (final index) => index);
        await Future.forEach(indicies, (final i) async {
          final objEither = await getUploadedObject.call(i);
          objEither.when(
            left: (final e) => getIt<Logger>()
                .e("Could not load object id=$i from poscan. $e"),
            right: (final obj) => emit(
              state.copyWith(
                objects: state.objects + [obj],
              ),
            ),
          );
        });
      },
    );

    emit(state.copyWith(status: PoscanObjectStateStatus.loaded));
  }

  void clear() {
    emit(const PoscanObjectsState.initial());
  }
}
