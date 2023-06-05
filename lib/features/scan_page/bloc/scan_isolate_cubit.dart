import 'dart:isolate';

import 'package:flutter_bloc/flutter_bloc.dart';

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

  static const String cancelMsg = 'cancel';

  void setData(final Isolate i, final ReceivePort p) {
    emit(
      ScanIsolateData(
        isolate: i,
        port: p,
      ),
    );
  }

  void setNull() {
    emit(null);
  }
}
