import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

mixin ExtrinsicShowLoadingMixin {
  bool fastCheckPassed = false;

  void updateStatus(final BuildContext context) {
    fastCheckPassed = true;
    DefaultLoadingDialog.hide(context);
    BlocProvider.of<OuterContextCubit>(context).state.router.pop();
  }

  Future<void> showLoader({
    required final BuildContext context,
    required final Future<Either<Failure, void>> Function() call,
  }) async {
    DefaultLoadingDialog.show(context);

    fastCheckPassed = false;

    final res = await call();

    if (!fastCheckPassed) {
      String message = '';
      res.when(
        left: (final f) {
          message = f.cause ?? '';
        },
        right: (final _) {},
      );
      DefaultLoadingDialog.hide(context);
      unawaited(Fluttertoast.showToast(msg: message));
    }
  }
}
