import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_error.freezed.dart';

@freezed
class StorageError with _$StorageError {
  const factory StorageError.impossibleOperation() = _ImpossibleOperation;
  const factory StorageError.noDataStored() = _NoDataStored;
}
