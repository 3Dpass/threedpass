import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? cause;

  const Failure([this.cause]);

  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure([final String? cause]) : super(cause);
}
