import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/wallet_screen/presentation/pages/recieve_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/pages/remove_account_dialog.dart';
import 'package:threedpass/features/wallet_screen/presentation/pages/transfer_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/pages/wallet_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/pages/wallet_page_wrapper.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

const AutoRoute walletPageRoute = AutoRoute(
  page: WalletPageWrapper,
  name: RouteNames.walletPageWrapper,
  children: [
    AutoRoute(
      page: WalletPage,
      name: RouteNames.walletPage,
      path: '',
    ),
    AutoRoute(
      page: TransferPage,
      name: RouteNames.transferPage,
    ),
    AutoRoute(
      page: RecievePage,
      name: RouteNames.recievePage,
    ),
    CustomRoute(
      page: RemoveAccountDialog,
      name: RouteNames.removeAccountDialog,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
