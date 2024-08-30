import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/fetch_data_cubit.dart';

class FetchBuilder<T> extends StatelessWidget {
  final FetchDataCubit<T, dynamic> cubit;
  final Widget Function() onLoading;
  final Widget Function(Object? error) onError;
  final Widget Function(T data) onSuccess;

  const FetchBuilder({
    required this.cubit,
    required this.onLoading,
    required this.onError,
    required this.onSuccess,
    super.key,
  });

  @override
  Widget build(final BuildContext context) =>
      BlocProvider<FetchDataCubit<T, dynamic>>(
        // ignore: discarded_futures
        create: (final _) => cubit..fetchData(),
        child: BlocBuilder<FetchDataCubit<T, dynamic>, AsyncValue<T>>(
          builder: (final BuildContext context, final AsyncValue<T> state) {
            if (state.isLoading) {
              return onLoading();
            } else if (state.hasError) {
              return onError(state.error);
            } else if (state.hasValue) {
              return onSuccess(state.value!);
            } else {
              return Text('Error. Unknown state. ${StackTrace.current}');
            }
          },
        ),
      );
}
