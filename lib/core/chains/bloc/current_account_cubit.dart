import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/domain/entities/current_account.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/setup.dart';

typedef CurrentAccountState = AsyncValue<CurrentAccount>;

class CurrentAccountCubit extends Cubit<CurrentAccountState> {
  CurrentAccountCubit() : super(AsyncValue<CurrentAccount>.initial());

  void switchAccount(final CurrentAccount account) {
    emit(AsyncValue.data(account));
  }
}

mixin SubOnAccChange {
  subscribeOnAccountChange(
      Future<void> Function(CurrentAccount? acc) onAccSwitched) {
    getIt<CurrentAccountCubit>()
        .stream
        .asBroadcastStream()
        .listen((final curAccState) {
      curAccState.whenData(
        (final d) => onAccSwitched(d),
        onElse: () => onAccSwitched(null),
      );
    });
  }
}
