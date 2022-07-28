import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_credentials.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_info_page.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_loader.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute createAccountPageRoute = AutoRoute(
  page: CreateAccountWrapper,
  name: RouteNames.createAccountWrapper,
  children: [
    AutoRoute(
      page: CreateAccountInfoPage,
      name: RouteNames.createAccountInfoPage,
      path: '',
    ),
    AutoRoute(
      page: CreateAccountMnemonicBackup,
      name: RouteNames.mnemonicBackup,
    ),
    AutoRoute(
      page: CreateAccountMnemonicConfirm,
      name: RouteNames.mnemonicConfirm,
    ),
    AutoRoute(
      page: CreateAccountCredentials,
      name: RouteNames.createAccountCredentials,
    ),
    AutoRoute(
      page: CreateAccountLoader,
      name: RouteNames.createAccountLoader,
    ),
  ],
);
