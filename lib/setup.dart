import 'package:get_it/get_it.dart';
import 'package:threedpass/store.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HiveHashStore>(HiveHashStore()..init());
}
