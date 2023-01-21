import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/remove_account_dialog.dart';
import 'package:threedpass/features/wallet_screen/presentation/recieve_page/recieve_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/presentation/transactions_history_wrapper.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/transfer_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/transfer_page_wrapper.dart';
import 'package:threedpass/features/wallet_screen/presentation/wallet_page/wallet_page.dart';
import 'package:threedpass/features/wallet_screen/presentation/wallet_page/wallet_page_wrapper.dart';
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
      page: TransferPageWrapper,
      name: RouteNames.transferPageWrapper,
      children: [
        AutoRoute(
          page: TransferPage,
          name: RouteNames.transferPage,
          path: '',
        ),
      ],
    ),
    AutoRoute(
      page: RecievePage,
      name: RouteNames.recievePage,
    ),
    AutoRoute(
      page: TransactionsHistoryWrapper,
      name: RouteNames.transactionsHistoryPage,
    ),
    CustomRoute(
      page: RemoveAccountDialog,
      name: RouteNames.removeAccountDialog,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
