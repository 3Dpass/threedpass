import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String cause;
  final StackTrace stackTrace;

  Failure(this.cause, [StackTrace? stackTrace])
      : this.stackTrace = stackTrace ?? StackTrace.current;

  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  NetworkFailure(final String cause, [StackTrace? stackTrace])
      : super(cause, stackTrace);
}

class WrongTypeFailure extends Failure {
  WrongTypeFailure(
      final String varName, final String expectedType, final String actualType,
      [StackTrace? stackTrace])
      : super(
          '$varName should be $expectedType, but it\'s type $actualType',
          stackTrace,
        );
}

class BadDataFailure extends Failure {
  BadDataFailure(final String cause, [StackTrace? stackTrace])
      : super(cause, stackTrace);
}
