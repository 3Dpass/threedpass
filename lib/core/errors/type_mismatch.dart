import 'package:super_core/super_core.dart';

class TypeMismatch extends Failure {
  const TypeMismatch({
    required final String expected,
    required final String actual,
    required final String varName,
  }) : super('$varName expected type $expected, but got $actual');
}
