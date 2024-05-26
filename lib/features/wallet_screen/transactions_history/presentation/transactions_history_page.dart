import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/bloc/transfers_from_cubit.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/bloc/transfers_to_cubit.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/mapper_transfer_item.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfer_item.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/widgets/first_page_exception_indicator.dart';
import 'package:threedpass/features/wallet_screen/widgets/no_transfer_items_found.dart';
import 'package:threedpass/features/wallet_screen/widgets/transaction_item.dart';
import 'package:unicons/unicons.dart';

part './widgets/transactions_list.dart';
part './widgets/transactions_list_from.dart';
part './widgets/transactions_list_to.dart';

class TransactionsHistoryPage extends StatelessWidget {
  const TransactionsHistoryPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).customColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: const D3pAppBarTheme().backgroundColor,
          title: Text('transfers_history_title'.tr()),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(UniconsLine.money_withdraw),
                text: 'transactions_from'.tr(),
              ),
              Tab(
                icon: const Icon(UniconsLine.money_insert),
                text: 'transactions_to'.tr(),
              ),
            ],
            indicatorColor: D3pThemeData.mainColor,
          ),
        ),
        body: const TabBarView(
          children: [
            TransactionsListTo(),
            TransactionsListFrom(),
          ],
        ),
      ),
    );
  }
}
