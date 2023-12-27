// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Dart bindings to call hashes calc function
class CalcBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  CalcBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  CalcBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Char> calc(
    ffi.Pointer<ffi.UnsignedChar> input,
    int input_len,
    int par1,
    int par2,
    ffi.Pointer<ffi.UnsignedChar> trans,
    ffi.Pointer<ffi.UnsignedChar> version,
    int version_len,
  ) {
    return _calc(
      input,
      input_len,
      par1,
      par2,
      trans,
      version,
      version_len,
    );
  }

  late final _calcPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.UnsignedChar>,
              ffi.Int,
              ffi.Short,
              ffi.Short,
              ffi.Pointer<ffi.UnsignedChar>,
              ffi.Pointer<ffi.UnsignedChar>,
              ffi.Int)>>('calc');
  late final _calc = _calcPtr.asFunction<
      ffi.Pointer<ffi.Char> Function(
          ffi.Pointer<ffi.UnsignedChar>,
          int,
          int,
          int,
          ffi.Pointer<ffi.UnsignedChar>,
          ffi.Pointer<ffi.UnsignedChar>,
          int)>();

  ffi.Pointer<ffi.Char> versionInterface() {
    return _versionInterface();
  }

  late final _versionInterfacePtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function()>>(
          'versionInterface');
  late final _versionInterface =
      _versionInterfacePtr.asFunction<ffi.Pointer<ffi.Char> Function()>();
}
