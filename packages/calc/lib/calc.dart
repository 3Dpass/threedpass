// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';
import 'dart:io';
import 'dart:io' show Platform;
import 'dart:isolate';
import 'dart:ffi';
import 'dart:ffi' as ffi;
import 'dart:typed_data';
import 'package:calc/generated/bindings.dart';
import 'package:ffi/ffi.dart';

// // For C/Rust
// typedef NativeProgressFunc = Int64 Function(Int64, Int64, Pointer<Utf8>);
// // For Dart
// typedef ProgressFunc = int Function(int, int, Pointer<Utf8>);

// // For C/Rust
// typedef NativeCalcFunc = Pointer<Utf8> Function(Int64 a, Int64 b,
//     Pointer<Utf8> str, Pointer<NativeFunction<NativeProgressFunc>>);
// // For Dart
// typedef CalcFunc = Pointer<Utf8> Function(int a, int b, Pointer<Utf8> path,
//     Pointer<NativeFunction<NativeProgressFunc>>);

// typedef FreeStringFunc = void Function(Pointer<Utf8>);
// typedef FreeStringFuncNative = Void Function(Pointer<Utf8>);

// class NotSupportedPlatform implements Exception {
//   NotSupportedPlatform(String s);
// }

//int progress(int pct, int status, Pointer<Utf8> description) {
//  print("I got called back from Rust with $pct and $status");
//  return 0;
//}

// DynamicLibrary load({String basePath = ''}) {
//   if (Platform.isAndroid || Platform.isLinux) {
//     return DynamicLibrary.open('${basePath}libcalc_ffi.so');
//   } else if (Platform.isIOS) {
//     // iOS is statically linked, so it is the same as the current process
//     return DynamicLibrary.process();
//   } else if (Platform.isMacOS) {
//     return DynamicLibrary.open('${basePath}libcalc_ffi.dylib');
//   } else if (Platform.isWindows) {
//     return DynamicLibrary.open('${basePath}libcalc_ffi.dll');
//   } else {
//     throw NotSupportedPlatform('${Platform.operatingSystem} is not supported!');
//   }
// }

// class Calc {
//   static DynamicLibrary? _lib;
//   static SendPort? sendPort;
//   // Platform.version;

//   static init() {
//     if (_lib != null) return;
//     // for debugging and tests
//     if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
//       _lib = load(basePath: '../../../target/debug/');
//     } else {
//       _lib = load();
//     }
//   }

//   static Future<String> start(
//       Function onProgress, path, int par1, int par2) async {
//     init();
//     print("start");

//     var receivePort = new ReceivePort();
//     Isolate isolate = await Isolate.spawn(worker, {
//       'port': receivePort.sendPort,
//       'path': path,
//       'par1': par1,
//       'par2': par2,
//       // 'par3': par3,
//     });
//     isolate.addOnExitListener(receivePort.sendPort);

//     // Receive the SendPort from the Isolate
//     //SendPort sendPort = await receivePort.first;

//     // Send a message to the Isolate
//     //sendPort.send("hello");

//     await for (var data in receivePort) {
//       // `data` is the message received.
//       if (data == null) {
//         break;
//       }
//       if (data is Map) {
//         if (data.containsKey("hashes"))
//           return data['hashes'];
//         else if (data.containsKey("pct")) {
//           await onProgress(data);
//         }
//       } else {
//         // onProgress(data);
//         continue;
//       }
//     }

//     return "";
//   }

//   static void worker(args) async {
//     init();

//     print("worker");

//     String path = args['path'];
//     sendPort = args['port'];
//     int par1 = args['par1'];
//     int par2 = args['par2'];

//     // Send messages to other Isolates
//     //sendPort.send(port.sendPort);

//     String res = calc_ffi(par1, par2, path);

//     print("res=$res");

// //    sendPort.send("hello1");
// //    sleep(Duration(seconds: 1));
// //    sendPort.send("hello2");
// //    sleep(Duration(seconds: 1));
// //    sendPort.send("hello3");
// //    sendPort.send(res);
// //    sendPort.send(null);

//     sendPort!.send({"hashes": res});

// //    // Listen for messages (optional)
// //    await for (var data in port) {
// //      // `data` is the message received.
// //    }
//   }

//   static String calc_ffi(int par1, int par2, String path) {
//     // Callback function -->
//     Pointer<NativeFunction<NativeProgressFunc>> progress_fptr =
//         Pointer.fromFunction(progress, 0);

//     // <--

//     final FreeStringFunc freeCString = _lib!
//         .lookup<NativeFunction<FreeStringFuncNative>>("rust_cstr_free")
//         .asFunction();

//     final p3d = _lib!
//         .lookup<NativeFunction<NativeCalcFunc>>('calc')
//         .asFunction<CalcFunc>();

//     final res_ptr =
//         p3d(par1, par2, StringUtf8Pointer(path).toNativeUtf8(), progress_fptr);
//     final res = res_ptr.toDartString();

//     freeCString(res_ptr);
//     return res;
//   }

//   static int progress(int pct, int status, Pointer<Utf8> description) {
//     print("I got called back from Rust with $pct and $status");

//     String desc = description.toDartString();

//     sendPort!.send({"pct": pct, "status": status, "desc": desc});
//     // sendPort.send("I got called back from Rust with $pct and $status");

//     return 0;
//   }
// }

// typedef CalcFunc = ffi.Pointer<ffi.Char> Function(
//   ffi.Pointer<Uint8>,
//   ffi.Size,
//   // ffi.Short,
//   // ffi.Short,
//   // ffi.Pointer<Uint8>,
// );

// typedef Calc = ffi.Pointer<ffi.Char> Function(
//   ffi.Pointer<Uint8>,
//   int,
//   // Short,
//   // Short,
//   // ffi.Pointer<Uint8>,
// );

/// Class for the Rust FFI Calc library
class Calc2 {
  const Calc2({
    required this.gridSize,
    required this.nSections,
    required this.filePath,
  });

  final int gridSize;
  final int nSections;
  final String filePath;

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

    // final a = Uint8List(4);
    // a[0] = 1;
    // a[1] = 2;
    // a[2] = 3;
    // a[3] = 4;

    // final File f = File(filePath);
    // final content = f.readAsBytesSync();

    // toNativeUtf8().cast<UnsignedChar>()

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

    final a = Uint8List(4);
    a[0] = 1;
    a[1] = 2;
    a[2] = 3;
    a[3] = 4;
    print('YES0');
    final trans = _byteDataToPointer(a);
    print('YES1');

    final File f = File(filePath);
    final content = f.readAsBytesSync();
    print('${content.length}, ${content.lengthInBytes}');
    print('YES2');
    final input = _byteDataToPointer(content);

    // toNativeUtf8().cast<UnsignedChar>()

    print('YES3');

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
