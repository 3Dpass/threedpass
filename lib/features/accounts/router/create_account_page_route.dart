import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_credentials.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_from_object/create_account_from_object.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_info_page.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_loader.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_backup.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_mnemonic_confirm.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_type.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/create_account_wrapper.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account/import_mnemonic_form.dart';
import 'package:threedpass/features/accounts/presentation/pages/no_stable_hash_dialog.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/route_paths.dart';
import 'package:threedpass/router/router.dart';

const AutoRoute createAccountPageRoute = AutoRoute(
  page: CreateAccountWrapper,
  name: RouteNames.createAccountWrapper,
  path: RoutePaths.createAccountMain,
  children: [
    AutoRoute(
      page: CreateAccountType,
      name: RouteNames.createAccountType,
      path: RoutePaths.createAccountChooseType,
    ),
    AutoRoute(
      page: CreateAccountInfoPage,
      name: RouteNames.createAccountInfoPage,
      path: RoutePaths.createAccountRandomMnemonic,
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
    CustomRoute(
      page: CreateAccountLoader,
      name: RouteNames.createAccountLoader,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      page: NoStableHashDialog,
      name: RouteNames.noStableHashDialog,
      customRouteBuilder: dialogBuilder,
    ),
    // create from object
    AutoRoute(
      page: CreateAccountFromObject,
      name: RouteNames.createAccountFromObject,
    ),
    // Import mnemonic
    AutoRoute(
      page: ImportMnemonicForm,
      name: RouteNames.importMnemonicForm,
    ),
  ],
);
