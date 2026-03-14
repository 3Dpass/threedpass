import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_user_objects_meta.dart';
import 'package:threedpass/setup.dart';

typedef UserObjectsListState = AsyncValue<List<UploadedObject>>;

class UserObjectsListCubit extends Cubit<UserObjectsListState> {
  UserObjectsListCubit({
    required this.currentAccountCubit,
  }) : super(AsyncValue.loading());

  final CurrentAccountCubit currentAccountCubit;

  Future<void> load() async {
    emit(AsyncValue.loading());
    final curAddress = currentAccountCubit.state.value?.nativeP3D.address;
    if (curAddress != null) {
      getIt<GetUserObjectsMeta>().safeCall(
        params: curAddress,
        onError: (final e, final st) => emit(AsyncValue.error(e, st)),
        onSuccess: (final data) => emit(
          AsyncValue.data(data),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "could_not_get_user_account_to_load_objects".tr(),
      );
      emit(
        AsyncValue.error(
          "could_not_get_user_account_to_load_objects".tr(),
          StackTrace.empty,
        ),
      );
    }
  }
}
