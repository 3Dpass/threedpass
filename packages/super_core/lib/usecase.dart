import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(final Params params);
}
