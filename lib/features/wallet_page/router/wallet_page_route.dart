import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/wallet_page/presentation/wallet_page.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute walletPageRoute = AutoRoute(
  page: EmptyRouterPage,
  name: RouteNames.walletPageWrapper,
  children: [
    AutoRoute(
      page: WalletPage,
      name: RouteNames.walletPage,
      path: '',
    ),
  ],
);
