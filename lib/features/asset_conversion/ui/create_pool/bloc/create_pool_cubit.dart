import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/create_pool.dart';

class CreatePoolState {
  const CreatePoolState();
  const CreatePoolState.initial();
}

class CreatePoolCubit extends Cubit<CreatePoolState>
    with ExtrinsicShowLoadingMixin {
  CreatePoolCubit({
    required this.appServiceLoaderCubit,
    required this.createPoolUseCase,
    required this.outerRouter,
  }) : super(const CreatePoolState.initial());

  @override
  final StackRouter outerRouter;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final CreatePool createPoolUseCase;

  @override
  Future<Either<Failure, void>> callExtrinsic(BuildContext context) {
    // TODO: implement callExtrinsic
    throw UnimplementedError();
  }
}
