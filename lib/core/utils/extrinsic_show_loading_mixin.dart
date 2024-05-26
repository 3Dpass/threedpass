import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';

mixin ExtrinsicShowLoadingMixin {
  bool fastCheckPassed = false;

  void updateStatus(final BuildContext context) {
    fastCheckPassed = true;
    DefaultLoadingDialog.hide(context);
    outerRouter.pop();
    Fluttertoast.showToast(
      msg: 'Extrinsic signed and broadcasted',
      backgroundColor: D3pThemeData.mainColor,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  StackRouter get outerRouter;

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

  final formKey = GlobalKey<FormState>();

  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  );

  Future<void> submitExtrinsic(final BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await showLoader(
        context: context,
        call: () => callExtrinsic(context),
      );
    }
  }
}
