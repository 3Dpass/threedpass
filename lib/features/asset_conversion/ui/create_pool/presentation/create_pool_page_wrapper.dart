import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/bloc/create_pool_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/presentation/create_pool_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class CreatePoolPageWrapper extends StatelessWidget {
  const CreatePoolPageWrapper({super.key});

  // @override
  // Widget wrappedRoute(final BuildContext context) {
  //   return BlocProvider<CreatePoolCubit>(
  //     create: (final _) => getIt<CreatePoolCubit>(
  //       param1: context.router,
  //     ),
  //     child: this,
  //   );
  // }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<CreatePoolCubit>(
      create: (final _) => getIt<CreatePoolCubit>(
        param1: context.router,
      ),
      child: const CreatePoolPage(),
    );
  }
}
