import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
class Either<L, R> with _$Either<L, R> {
  const factory Either.left(final L value) = _Left;
  const factory Either.right(final R value) = _Right;
}
