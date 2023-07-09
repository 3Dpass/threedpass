import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:threedpass/setup.dart';

class PinCodeGuard extends AutoRouteGuard {
  @override
  void onNavigation(
    final NavigationResolver resolver,
    final StackRouter router,
  ) {
    final hasPinCode =
        getIt<SettingsConfigCubit>().state.appSettings.pinCode.isNotEmpty;

    if (!hasPinCode) {
      resolver.next(true);
    } else {
      // https://pub.dev/packages/auto_route#returning-results
      resolver.redirect(
        LoginRoute(
          onLoginResult: (final bool success) {
            resolver.next(success);
          },
        ),
        replace: true,
      );
    }
  }
}
