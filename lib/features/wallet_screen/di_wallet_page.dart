import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DIWalletPage extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<NotificationsBloc>(
      () => NotificationsBloc(),
    );
  }
}
