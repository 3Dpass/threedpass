import 'package:flutter_bloc/flutter_bloc.dart';

/// Notifies that [AppServiceLoaderCubit.state.bestNumber.value] is not empty
/// It's better not to use [BlocBuilder<AppServiceLoaderCubit>] because it will
/// require to emit after getting the bestNumber.
/// And consequently, it will cause redundant widget rebuilds or bad logic
class BestNumberAvaliableCubit extends Cubit<bool> {
  BestNumberAvaliableCubit() : super(false);

  void setValue(final bool value) => emit(value);
}
