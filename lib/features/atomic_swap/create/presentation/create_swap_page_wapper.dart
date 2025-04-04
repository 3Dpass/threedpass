import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/create/presentation/create_swap_page.dart';
import 'package:threedpass/setup.dart';

@RoutePage()
class CreateSwapPageWapper extends StatelessWidget implements AutoRouteWrapper {
  const CreateSwapPageWapper({
    final Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateAtomicSwapCubit>(
          create: (final _) => getIt<CreateAtomicSwapCubit>(
            param1: 0,
            param2: context.router,
          ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return CreateSwapPage();
  }
}
