import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DIWalletPage extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerSingleton<NotificationsBloc>(
      NotificationsBloc(),
    );
  }
}
