import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';

mixin ExtrinsicShowLoadingMixin<TResult, Params> {
  bool fastCheckPassed = false;

  void updateStatus(final BuildContext context) {
    fastCheckPassed = true;
    DefaultLoadingDialog.hide(context);
    unawaited(outerRouter.maybePop());
    unawaited(
      Fluttertoast.showToast(
        msg: 'Extrinsic signed and broadcasted',
        backgroundColor: D3pThemeData.mainColor,
        toastLength: Toast.LENGTH_LONG,
      ),
    );
  }

  StackRouter get outerRouter;

  Future<void> showLoader({
    required final BuildContext context,
    required final Params params,
    required final SafeUseCaseCall<TResult, Params> safeCall,
  }) async {
    unawaited(DefaultLoadingDialog.show(context));

    fastCheckPassed = false;

    await safeCall(
      params: params,
      onSuccess: (final _) {},
      onError: (final e, final st) {
        if (!fastCheckPassed) {
          DefaultLoadingDialog.hide(context);
          unawaited(
            Fluttertoast.showToast(
              msg: e.toString(),
            ),
          );
        }
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  // Future<void> callExtrinsic(
  //   final BuildContext context,
  //   final Params params,
  //   final SafeUseCaseCall<TResult, Params> safeCall,
  // );

  FutureOr<Params> params(final BuildContext context);
  SafeUseCaseCall<TResult, Params> get safeCall;

  Future<void> submitExtrinsic(final BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await showLoader(
          context: context,
          params: await params(context),
          safeCall: safeCall,
        );
      }
    } on Object catch (e, stackTrace) {
      logger.log(
        Level.error,
        'Error in extrinsic submit',
        error: e,
        stackTrace: stackTrace,
      );
      await Fluttertoast.showToast(msg: 'Error: $e');
    }
  }
}
