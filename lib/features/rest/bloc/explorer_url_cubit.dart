import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/rest/domain/usecases/resolve_explorer_url.dart';

typedef ExplorerUrlState = AsyncValue<String>;

class ExplorerUrlCubit extends Cubit<ExplorerUrlState> {
  ExplorerUrlCubit({required this.resolveExplorerUrl})
      : super(AsyncValue.loading());

  final ResolveExplorerUrl resolveExplorerUrl;

  Future<void> initUrl() async {
    try {
      final url = await resolveExplorerUrl.call(null);
      emit(AsyncValue.data(url));
    } catch (e, st) {
      emit(AsyncValue.error(e, st));
    }
  }

  String get status {
    if (state.hasError) {
      return 'error';
    }
    if (state.hasValue) {
      return state.value!;
    }
    return '?';
  }
}
