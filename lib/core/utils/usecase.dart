import 'package:super_core/super_core.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(final Params params);
}
