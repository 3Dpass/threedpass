import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // TODO Replace to Exception
  final String? cause;

  const Failure([this.cause]);

  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure([final String? cause]) : super(cause);
}

class NoDataFailure extends Failure {
  const NoDataFailure([final String? cause]) : super(cause);
}

class WrongTypeFailure extends Failure {
  const WrongTypeFailure(
      final String varName, final String expectedType, final String actualType)
      : super(
          '$varName should be $expectedType, but it\'s type $actualType',
        );
}

class BadDataFailure extends Failure {
  const BadDataFailure([final String? cause]) : super(cause);
}
