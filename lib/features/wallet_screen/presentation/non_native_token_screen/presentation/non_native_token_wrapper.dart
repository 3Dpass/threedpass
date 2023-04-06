import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/data/repositories/extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/usecases/get_extrinsics.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/non_native_token_screen.dart';
import 'package:threedpass/setup.dart';

class NonNativeTokenWrapper extends StatelessWidget {
  final GetExtrinsicsUseCaseParams params;

  const NonNativeTokenWrapper(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetExtrinsicsCubit>(
            param1: getIt<GetExtrinsics>(
              param1: getIt<ExtrinsicsRepository>(),
              param2: params,
            ),
          ),
        ),
      ],
      child: NonNativeTokenScreen(),
    );
  }
}
