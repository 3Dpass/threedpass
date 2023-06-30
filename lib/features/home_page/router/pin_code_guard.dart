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
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    final hasPinCode =
        getIt<SettingsConfigCubit>().state.appSettings.pinCode.isNotEmpty;

    if (!hasPinCode) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed

      // https://pub.dev/packages/auto_route#returning-results
      resolver.redirect(
        LoginRoute(
          onLoginResult: (final bool success) {
            // if success == true the navigation will be resumed
            // else it will be aborted
            resolver.next(success);
          },
        ),
        replace: true,
      );
    }
  }
}
