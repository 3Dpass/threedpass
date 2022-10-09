import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_account_create_page.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_account_loader.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_account_wrapper.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_account_import_type.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_mnemonic_form.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

const AutoRoute importAccountPageRoute = AutoRoute(
  page: ImportAccountWrapper,
  name: RouteNames.importAccountWrapper,
  children: [
    AutoRoute(
      page: ImportAccountImportType,
      name: RouteNames.importAccountSelectType,
      path: '',
    ),
    AutoRoute(
      page: ImportMnemonicForm,
      name: RouteNames.importMnemonicForm,
    ),
    AutoRoute(
      page: ImportAccountCreatePage,
      name: RouteNames.importAccountCreatePage,
    ),
    CustomRoute(
      page: ImportAccountLoader,
      name: RouteNames.importAccountLoader,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
