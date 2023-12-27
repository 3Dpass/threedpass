import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class D3PRPCPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const D3PRPCPageWrapper({super.key});

  @override
  Widget wrappedRoute(final BuildContext context) {
    final state = BlocProvider.of<PreviewPageCubit>(context).state;
    final fileHash = state.snapshot.fileHash;

    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final initialAccount = appService.keyring.current;

    return BlocProvider(
      create: (final context) => PoscanPutObjectCubit(
        fileHash: fileHash,
        filePath: state.snapshot.realPath,
        initialAccount: initialAccount,
        initialHashes: state.snapshot.hashes,
        localSnapshotName: state.snapshot.name,
        putObjectUseCase: getIt<PutObject>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
