import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/assets_extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/events_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/assets_get_extrinsics.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/get_events_usecase.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/non_native_token_screen.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class NonNativeTokenPageWrapper extends StatelessWidget {
  final GetExtrinsicsUseCaseParams params;

  const NonNativeTokenPageWrapper(this.params, {super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (final _) => getIt<AssetsGetExtrinsicsCubit>(
            param1: getIt<AssetsGetExtrinsics>(
              param1: getIt<AssetsExtrinsicsRepository>(),
              param2: params,
            ),
            param2: getIt<GetEventsUseCase>(
              param1: getIt<EventsRepository>(),
            ),
          ),
        ),
      ],
      child: const NonNativeTokenScreen(),
    );
  }
}
