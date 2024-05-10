// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_poscan_asset_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreatePoscanAssetStateCWProxy {
  CreatePoscanAssetState propValue(PropValue? propValue);

  CreatePoscanAssetState uploadedObject(UploadedObject? uploadedObject);

  CreatePoscanAssetState keyPairData(KeyPairData keyPairData);

  CreatePoscanAssetState includeObject(bool includeObject);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePoscanAssetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePoscanAssetState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePoscanAssetState call({
    PropValue? propValue,
    UploadedObject? uploadedObject,
    KeyPairData? keyPairData,
    bool? includeObject,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreatePoscanAssetState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreatePoscanAssetState.copyWith.fieldName(...)`
class _$CreatePoscanAssetStateCWProxyImpl
    implements _$CreatePoscanAssetStateCWProxy {
  const _$CreatePoscanAssetStateCWProxyImpl(this._value);

  final CreatePoscanAssetState _value;

  @override
  CreatePoscanAssetState propValue(PropValue? propValue) =>
      this(propValue: propValue);

  @override
  CreatePoscanAssetState uploadedObject(UploadedObject? uploadedObject) =>
      this(uploadedObject: uploadedObject);

  @override
  CreatePoscanAssetState keyPairData(KeyPairData keyPairData) =>
      this(keyPairData: keyPairData);

  @override
  CreatePoscanAssetState includeObject(bool includeObject) =>
      this(includeObject: includeObject);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePoscanAssetState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePoscanAssetState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePoscanAssetState call({
    Object? propValue = const $CopyWithPlaceholder(),
    Object? uploadedObject = const $CopyWithPlaceholder(),
    Object? keyPairData = const $CopyWithPlaceholder(),
    Object? includeObject = const $CopyWithPlaceholder(),
  }) {
    return CreatePoscanAssetState(
      propValue: propValue == const $CopyWithPlaceholder()
          ? _value.propValue
          // ignore: cast_nullable_to_non_nullable
          : propValue as PropValue?,
      uploadedObject: uploadedObject == const $CopyWithPlaceholder()
          ? _value.uploadedObject
          // ignore: cast_nullable_to_non_nullable
          : uploadedObject as UploadedObject?,
      keyPairData:
          keyPairData == const $CopyWithPlaceholder() || keyPairData == null
              ? _value.keyPairData
              // ignore: cast_nullable_to_non_nullable
              : keyPairData as KeyPairData,
      includeObject:
          includeObject == const $CopyWithPlaceholder() || includeObject == null
              ? _value.includeObject
              // ignore: cast_nullable_to_non_nullable
              : includeObject as bool,
    );
  }
}

extension $CreatePoscanAssetStateCopyWith on CreatePoscanAssetState {
  /// Returns a callable class that can be used as follows: `instanceOfCreatePoscanAssetState.copyWith(...)` or like so:`instanceOfCreatePoscanAssetState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreatePoscanAssetStateCWProxy get copyWith =>
      _$CreatePoscanAssetStateCWProxyImpl(this);
}
