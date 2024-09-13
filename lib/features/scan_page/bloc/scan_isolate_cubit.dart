import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/logger.dart';

class ScanState {
  final CancelableOperation<List<String>>? op;

  const ScanState({required this.op});
}

class ScanIsolateCubit extends Cubit<ScanState> {
  ScanIsolateCubit() : super(const ScanState(op: null));

  static const String cancelMsg =
      '%#User canceled scan tag#%'; // Tag for message handler

  void setData(final CancelableOperation<List<String>> op) {
    emit(ScanState(op: op));
  }

  Future<void> setNull() async {
    if (state.op != null) {
      logger.i('Stop scan');
      unawaited(state.op?.cancel());
    }
    emit(const ScanState(op: null));
  }
}
