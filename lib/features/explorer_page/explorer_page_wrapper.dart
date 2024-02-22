import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExplorerPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const ExplorerPageWrapper({
    final Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(final BuildContext context) {
    return this;
    // return MultiBlocProvider(
    //   providers: [
    //     // Context to show global dialogs
    //     BlocProvider<OuterContextCubit>(
    //       create: (final _) => OuterContextCubit(context),
    //       lazy: false,
    //     ),
    //     BlocProvider<NotificationsBloc>(
    //       create: (_) => getIt<NotificationsBloc>(),
    //     ),
    //   ],
    //   child: this,
    // );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
