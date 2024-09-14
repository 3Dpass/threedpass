import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeContextState {
  const HomeContextState({
    required this.context,
  });
  final BuildContext context;
}

@Deprecated('Remove this')
class HomeContextCubit extends Cubit<HomeContextState> {
  HomeContextCubit(final HomeContextState s) : super(s);

  Future<void> showDialogC(
    final Widget Function(BuildContext __) builder,
  ) async {
    await showPlatformDialog<void>(
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
