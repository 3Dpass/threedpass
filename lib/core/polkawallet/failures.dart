import 'package:super_core/super_core.dart';

class AppServiceIsNotInitialized extends Failure {
  const AppServiceIsNotInitialized([final String? cause]) : super(cause);
}
