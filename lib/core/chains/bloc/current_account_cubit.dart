import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/domain/entities/current_account.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/setup.dart';

typedef CurrentAccountState = AsyncValue<CurrentAccount>;

class CurrentAccountCubit extends Cubit<CurrentAccountState> {
  CurrentAccountCubit() : super(AsyncValue<CurrentAccount>.loading());

  void switchAccount(final CurrentAccount account) {
    emit(AsyncValue.data(account));
  }
}

Future<void> getValueAndSubOnAccChange(
    Future<void> Function(CurrentAccountState acc) onAccSwitched) async {
  final currentAccountCubit = getIt<CurrentAccountCubit>();
  final acc = await currentAccountCubit.state;

  onAccSwitched(acc);
  currentAccountCubit.stream.asBroadcastStream().listen(onAccSwitched);
}
