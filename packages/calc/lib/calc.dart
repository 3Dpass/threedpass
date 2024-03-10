import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ffi';
import 'dart:ffi' as ffi;
import 'dart:typed_data';
import 'package:calc/generated/bindings.dart';
import 'package:ffi/ffi.dart';

import 'package:convert/convert.dart';

/// Class for the Rust FFI Calc library
class Calc2 {
  const Calc2({
    required this.gridSize,
    required this.nSections,
    required this.filePath,
    required this.transBytes,
    required this.algorithm,
    required this.sendNone,
    // required this.updateIsolateListener,
  });

  final int gridSize;
  final int nSections;
  final String filePath;
  final String transBytes;
  final String algorithm;
  final bool sendNone;

  Future<String> calcHashes(
      void updateIsolateListener(Isolate i, ReceivePort p)) async {
    final p = ReceivePort();
    // print('a1');
    final i = await Isolate.spawn(_callLib, p.sendPort);
    // print('a2');
    updateIsolateListener(i, p);
    return await p.first as String;
  }

  static Future<String> getVersion() async {
    final p = ReceivePort();
    await Isolate.spawn(_callVersion, p.sendPort);
    return await p.first as String;
  }

  static Future<void> _callVersion(SendPort p) async {
    final DynamicLibrary nativeLib = Platform.isAndroid
        ? DynamicLibrary.open(
            "libcalc.so",
          ) // Load the dynamic library on Android
        : DynamicLibrary.process(); // Load the static library on iOS

    final bindings = CalcBindings(nativeLib);
    final rawData = bindings.versionInterface();

    final result = rawData.cast<Utf8>().toDartString();
    Isolate.exit(p, result);
  }

  int sendNoneRaw() {
    if (sendNone) {
      return 1;
    } else {
      return 0;
    }
  }

  Pointer<UnsignedChar> transBytesRaw() {
    if (sendNone) {
      return _byteDataToPointer(Uint8List.fromList([]));
    } else {
      final bytesIntList = hex.decode(transBytes); // TODO Check if correct
      final bytesUint8List = Uint8List.fromList(bytesIntList);

      final trans = _byteDataToPointer(bytesUint8List);
      return trans;
    }
  }

  Future<void> _callLib(SendPort p) async {
    final DynamicLibrary nativeLib = Platform.isAndroid
        ? DynamicLibrary.open(
            "libcalc.so",
          ) // Load the dynamic library on Android
        : DynamicLibrary.process(); // Load the static library on iOS

    final File f = File(filePath);
    final content = f.readAsBytesSync();

    final input = _byteDataToPointer(content);

    final bindings = CalcBindings(nativeLib);

    final rawData = bindings.calc(
      input,
      content.lengthInBytes,
      gridSize,
      nSections,
      transBytesRaw(),
      _stringToPointer(algorithm),
      algorithm.length,
      sendNoneRaw(),
      0,
    );

    final result = rawData.cast<Utf8>().toDartString();
    Isolate.exit(p, result);
  }

  Pointer<UnsignedChar> _byteDataToPointer(Uint8List uint8List) {
    // final uint8List = byteData.buffer.asUint8List();
    final length = uint8List.lengthInBytes;

    final result =
        calloc<UnsignedChar>(length); // allocate<Uint8>(count: length);

    for (var i = 0; i < length; ++i) {
      result[i] = uint8List[i];
    }

    return result;
  }

  static Pointer<UnsignedChar> _stringToPointer(String str) {
    // final uint8List = byteData.buffer.asUint8List();
    final ints = str.codeUnits;
    final length = ints.length;

    final result =
        calloc<UnsignedChar>(length); // allocate<Uint8>(count: length);

    for (var i = 0; i < length; ++i) {
      result[i] = ints[i];
    }

    return result;
  }
}
