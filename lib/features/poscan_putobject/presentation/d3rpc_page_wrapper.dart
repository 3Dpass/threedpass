import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_putobject/bloc/d3prpc_cubit.dart';
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
    final accounts = appService.keyring.allAccounts;
    final initialAccount = accounts.first;

    return BlocProvider(
      create: (final context) => D3PRPCCubit(
        fileHash: fileHash,
        initialAccount: initialAccount,
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
