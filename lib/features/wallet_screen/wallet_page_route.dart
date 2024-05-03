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
    ),
    AutoRoute(
      page: NotificationsRoute.page,
    ),
    AutoRoute(
      page: TransactionsHistoryRouteWrapper.page,
    ),
    AutoRoute(
      page: NonNativeTokenRouteWrapper.page,
    ),
    AutoRoute(
      page: SelectAccountRoute.page,
    ),
    AutoRoute(
      page: ContactsRoute.page,
    ),
    AutoRoute(
      page: AddContactRoute.page,
    ),
    CustomRoute(
      page: RemoveAccountRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
