import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/setup.dart';

class RemoteObjectsCountCubit extends Cubit<AsyncValue<int>> {
  RemoteObjectsCountCubit() : super(AsyncValue.loading());

  Future<void> setObjCount() async {
    emit(AsyncValue.loading());
    await getIt<GetObjCount>().safeCall(
      params: null,
      onError: (final Object e, final StackTrace st) {
        logger.e(e, stackTrace: st);
        emit(AsyncValue.error(e, st));
      },
      onSuccess: (final int realCount) {
        if (realCount != state.value) {
          emit(AsyncValue.data(realCount));
        }
      },
    );
  }
}
