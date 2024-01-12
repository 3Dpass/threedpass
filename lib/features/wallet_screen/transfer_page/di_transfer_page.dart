import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/usecases/transfer_usecase.dart';

class DITransferPage extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerFactory<TransferUseCase>(
      () => TransferUseCase(
        appService: getIt<AppServiceLoaderCubit>().state,
        notificationsBloc: getIt<NotificationsBloc>(),
      ),
    );
  }
}
