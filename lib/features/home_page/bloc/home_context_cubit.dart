import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContextState {
  const HomeContextState({
    required this.context,
  });
  final BuildContext context;
}

class HomeContextCubit extends Cubit<HomeContextState> {
  HomeContextCubit(final HomeContextState s) : super(s);

  Future<void> showDialogC(
    final Widget Function(BuildContext context) builder,
  ) async {
    await showDialog(
      useRootNavigator: false,
      context: state.context,
      barrierDismissible: false,
      builder: builder,
    );
  }

  void hideDialogC() {
    Navigator.of(state.context).pop();
  }
}
