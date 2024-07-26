import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/non_native_token_screen.dart';

@RoutePage()
class NonNativeTokenPageWrapper extends StatelessWidget {
  final GetExtrinsicsUseCaseParams params;
  final PoscanAssetCombined poscanAssetCombined;

  const NonNativeTokenPageWrapper(
    this.params, {
    required this.poscanAssetCombined,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return
        //  MultiBlocProvider(
        //   providers: [
        //     // BlocProvider<AssetsGetExtrinsicsCubit>(
        //     //   create: (final _) => getIt<AssetsGetExtrinsicsCubit>(
        //     //     param1: getIt<AssetsGetExtrinsics>(
        //     //       param1: getIt<AssetsExtrinsicsRepository>(),
        //     //       param2: params,
        //     //     ),
        //     //     param2: getIt<GetEventsUseCase>(
        //     //       param1: getIt<EventsRepository>(),
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        //   child:
        NonNativeTokenScreen(
      poscanAssetCombined: poscanAssetCombined,
      // ),
    );
  }
}
