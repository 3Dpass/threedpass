import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute walletPageRoute = AutoRoute(
  page: WalletRouteWrapper.page,
  // name: RouteNames.walletPageWrapper,
  children: [
    AutoRoute(
      page: WalletRoute.page,
      // name: RouteNames.walletPage,
      path: '',
    ),
    AutoRoute(
      page: TransferRouteWrapper.page,
      // name: RouteNames.transferPageWrapper,
      children: [
        AutoRoute(
          page: TransferRoute.page,
          // name: RouteNames.transferPage,
          path: '',
        ),
      ],
    ),
    AutoRoute(
      page: RecieveRoute.page,
      // name: RouteNames.recievePage,
    ),
    AutoRoute(
      page: TransactionsHistoryRouteWrapper.page,
      // name: RouteNames.transactionsHistoryPage,
    ),
    AutoRoute(
      page: NonNativeTokenRouteWrapper.page,
      // name: RouteNames.nonNativeTokenScreen,
    ),
    CustomRoute(
      page: RemoveAccountRoute.page,
      // name: RouteNames.removeAccountDialog,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
