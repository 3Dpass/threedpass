import 'package:threedpass/core/utils/either.dart';
import 'package:threedpass/core/utils/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(final Params params);
}
