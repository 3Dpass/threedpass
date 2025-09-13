import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_user_objects_meta.dart';
import 'package:threedpass/setup.dart';

typedef UserObjectsListState = AsyncValue<List<UploadedObject>>;

class UserObjectsListCubit extends Cubit<UserObjectsListState> {
  UserObjectsListCubit() : super(AsyncValue.loading());

  Future<void> load() {
    emit(AsyncValue.loading());
    return getIt<GetCurrentUserObjectsMeta>().safeCall(
      params: null,
      onError: (final e, final st) => emit(AsyncValue.error(e, st)),
      onSuccess: (final data) => emit(
        AsyncValue.data(data),
      ),
    );
  }
}
