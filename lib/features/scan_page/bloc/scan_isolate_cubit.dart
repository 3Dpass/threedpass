import 'dart:isolate';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/setup.dart';

class ScanIsolateData {
  const ScanIsolateData({
    required this.isolate,
    required this.port,
  });

  final Isolate isolate;
  final ReceivePort port;
}

class ScanIsolateCubit extends Cubit<ScanIsolateData?> {
  ScanIsolateCubit() : super(null);

  static const String cancelMsg =
      '%#User canceled scan tag#%'; // Tag for message handler

  void setData(final Isolate i, final ReceivePort p) {
    emit(
      ScanIsolateData(
        isolate: i,
        port: p,
      ),
    );
  }

  void setNull() {
    if (state != null) {
      getIt<Logger>().i('Stop scan');
      state?.isolate.removeOnExitListener(state!.port.sendPort);
      state?.isolate.kill();
    }
    emit(null);
  }
}
