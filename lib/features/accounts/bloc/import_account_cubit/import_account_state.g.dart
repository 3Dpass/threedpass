// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_account_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ImportAccountStateCWProxy {
  ImportAccountState accountAdvancedOptions(
      AccountAdvancedOptions accountAdvancedOptions);

  ImportAccountState accountCreate(AccountCreate accountCreate);

  ImportAccountState importType(ImportType importType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImportAccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImportAccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  ImportAccountState call({
    AccountAdvancedOptions? accountAdvancedOptions,
    AccountCreate? accountCreate,
    ImportType? importType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfImportAccountState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfImportAccountState.copyWith.fieldName(...)`
class _$ImportAccountStateCWProxyImpl implements _$ImportAccountStateCWProxy {
  final ImportAccountState _value;

  const _$ImportAccountStateCWProxyImpl(this._value);

  @override
  ImportAccountState accountAdvancedOptions(
          AccountAdvancedOptions accountAdvancedOptions) =>
      this(accountAdvancedOptions: accountAdvancedOptions);

  @override
  ImportAccountState accountCreate(AccountCreate accountCreate) =>
      this(accountCreate: accountCreate);

  @override
  ImportAccountState importType(ImportType importType) =>
      this(importType: importType);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ImportAccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ImportAccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  ImportAccountState call({
    Object? accountAdvancedOptions = const $CopyWithPlaceholder(),
    Object? accountCreate = const $CopyWithPlaceholder(),
    Object? importType = const $CopyWithPlaceholder(),
  }) {
    return ImportAccountState(
      accountAdvancedOptions:
          accountAdvancedOptions == const $CopyWithPlaceholder() ||
                  accountAdvancedOptions == null
              ? _value.accountAdvancedOptions
              // ignore: cast_nullable_to_non_nullable
              : accountAdvancedOptions as AccountAdvancedOptions,
      accountCreate:
          accountCreate == const $CopyWithPlaceholder() || accountCreate == null
              ? _value.accountCreate
              // ignore: cast_nullable_to_non_nullable
              : accountCreate as AccountCreate,
      importType:
          importType == const $CopyWithPlaceholder() || importType == null
              ? _value.importType
              // ignore: cast_nullable_to_non_nullable
              : importType as ImportType,
    );
  }
}

extension $ImportAccountStateCopyWith on ImportAccountState {
  /// Returns a callable class that can be used as follows: `instanceOfImportAccountState.copyWith(...)` or like so:`instanceOfImportAccountState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ImportAccountStateCWProxy get copyWith =>
      _$ImportAccountStateCWProxyImpl(this);
}
