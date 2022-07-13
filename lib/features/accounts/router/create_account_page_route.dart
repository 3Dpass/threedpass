import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account_info_page.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account_mnemonic_gen.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute createAccountPageRoute = AutoRoute(
  page: EmptyRouterPage,
  name: RouteNames.createAccountWrapper,
  children: [
    AutoRoute(
      page: CreateAccountInfoPage,
      name: RouteNames.createAccountInfoPage,
      path: '',
    ),
    AutoRoute(
      page: CreateAccountMnemonicGen,
      name: RouteNames.mnemonicGen,
    ),
  ],
);
