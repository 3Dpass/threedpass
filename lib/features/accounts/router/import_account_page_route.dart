import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_account_wrapper.dart';
import 'package:threedpass/features/accounts/presentation/pages/import_account/import_account_import_type.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute importAccountPageRoute = AutoRoute(
  page: ImportAccountWrapper,
  name: RouteNames.importAccountWrapper,
  children: [
    AutoRoute(
      page: ImportAccountImportType,
      name: RouteNames.importAccountSelectType,
      path: '',
    ),
  ],
);
