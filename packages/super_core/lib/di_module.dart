import 'package:get_it/get_it.dart';

abstract class DIModule {
  const DIModule();

  Future<void> setup(GetIt getIt);
}
