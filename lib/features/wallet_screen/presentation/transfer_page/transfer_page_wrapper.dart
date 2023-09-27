import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';

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
        BlocProvider<TransferInfoCubit>(
          // We are not calculating fees now
          create: (final _) => TransferInfoCubit(
            metaDTO: metadata,
            appService: appService,
          )..init(),
          lazy: false,
        ),
        BlocProvider(
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
