import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedp_graphql/core/graphql/__generated__/threedpass.schema.schema.gql.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/transfers_from_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/transfers_to_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfer_item.dart';
import 'package:unicons/unicons.dart';

part './widgets/transaction_item.dart';
part './widgets/transactions_list.dart';
part './widgets/transactions_list_from.dart';
part './widgets/transactions_list_to.dart';
part './widgets/no_items_found.dart';

class TransactionsHistoryPage extends StatelessWidget {
  const TransactionsHistoryPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('transactions_title'.tr()),
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
