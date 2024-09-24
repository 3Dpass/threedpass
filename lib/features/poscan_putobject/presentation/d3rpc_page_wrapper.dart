import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan/domain/usecases/get_poscan_properties.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';
import 'package:threedpass/features/preview/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/preview/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class D3PRPCPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const D3PRPCPageWrapper({
    super.key,
  }); // TODO Get filehas and snapshot hashes list instead of depending this and choose_hashes.dart on PreviewPageCubit

  @override
  Widget wrappedRoute(final BuildContext context) {
    final snapshot = BlocProvider.of<PreviewPageCubit>(context).state;
    final fileHash = snapshot.fileHash;

    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final initialAccount = appService.keyring.current;

    return BlocProvider<PoscanPutObjectCubit>(
      // TODO Move to DI
      create: (final context) => PoscanPutObjectCubit(
        fileHash: fileHash,
        filePath: snapshot.realPath,
        initialAccount: initialAccount,
        initialHashes: snapshot.hashes,
        localSnapshotName: snapshot.name,
        putObjectUseCase: getIt<PutObject>(),
        getPoscanProperties: getIt<GetPoscanProperties>(),
        outerRouter: BlocProvider.of<OuterContextCubit>(context).state.router,
        // ignore: discarded_futures
      )..init(),
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
