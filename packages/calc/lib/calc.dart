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
  });

  final int gridSize;
  final int nSections;
  final String filePath;
  final String transBytes;

  Future<String> calcHashes() async {
    final p = ReceivePort();
    await Isolate.spawn(_callLib, p.sendPort);
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
    final rawData = bindings.version();

    final result = rawData.cast<Utf8>().toDartString();
    Isolate.exit(p, result);
  }

  Future<void> _callLib(SendPort p) async {
    final DynamicLibrary nativeLib = Platform.isAndroid
        ? DynamicLibrary.open(
            "libcalc.so",
          ) // Load the dynamic library on Android
        : DynamicLibrary.process(); // Load the static library on iOS

    final bytesIntList = hex.decode(transBytes);
    final bytesUint8List = Uint8List.fromList(bytesIntList);

    final trans = _byteDataToPointer(bytesUint8List);

    final File f = File(filePath);
    final content = f.readAsBytesSync();

    final input = _byteDataToPointer(content);

    final bindings = CalcBindings(nativeLib);
    final rawData = bindings.calc(
      input,
      content.lengthInBytes,
      gridSize,
      nSections,
      trans,
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
}
