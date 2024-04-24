import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/non_native_token_screen.dart';

@RoutePage()
class NonNativeTokenPageWrapper extends StatelessWidget {
  final GetExtrinsicsUseCaseParams params;
  final PoscanAssetData poscanAssetData;
  final PoscanAssetMetadata? metadata;

  const NonNativeTokenPageWrapper(
    this.params, {
    required this.poscanAssetData,
    required this.metadata,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<AssetsGetExtrinsicsCubit>(
        //   create: (final _) => getIt<AssetsGetExtrinsicsCubit>(
        //     param1: getIt<AssetsGetExtrinsics>(
        //       param1: getIt<AssetsExtrinsicsRepository>(),
        //       param2: params,
        //     ),
        //     param2: getIt<GetEventsUseCase>(
        //       param1: getIt<EventsRepository>(),
        //     ),
        //   ),
        // ),
      ],
      child: NonNativeTokenScreen(
        poscanAssetData: poscanAssetData,
        metadata: metadata,
      ),
    );
  }
}
