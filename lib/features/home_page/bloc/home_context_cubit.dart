import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContextState {
  const HomeContextState({
    required this.context,
  });
  final BuildContext context;
}

class HomeContextCubit extends Cubit<HomeContextState> {
  HomeContextCubit(HomeContextState s) : super(s);

  showDialogC(Widget Function(BuildContext context) builder) {
    showDialog(
      useRootNavigator: false,
      context: state.context,
      barrierDismissible: false,
      builder: builder,
    );
  }

  static void hideDialogC(BuildContext context) {
    Navigator.of(context).pop();
  }
}
