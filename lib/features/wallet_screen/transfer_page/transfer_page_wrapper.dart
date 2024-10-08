import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/preview/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/usecases/transfer_usecase.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class TransferPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const TransferPageWrapper({
    required this.metadata,
    final Key? key,
  }) : super(key: key);

  final TransferMetaDTO metadata;

  @override
  Widget wrappedRoute(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    return MultiBlocProvider(
      providers: [
        BlocProvider<TransferInfoBloc>(
          // We are not calculating fees now
          create: (final _) => TransferInfoBloc(
            transfer: getIt<Transfer>(),
            metaDTO: metadata, // TODO Make parametrized DI
            appService: appService,
          )..init(),
          lazy: false,
        ),
        BlocProvider<OuterContextCubit>(
          create: (final _) => OuterContextCubit(context),
          lazy: false,
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
