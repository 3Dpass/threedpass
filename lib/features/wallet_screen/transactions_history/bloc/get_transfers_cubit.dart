import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/get_transfers_params.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/usecases/get_transfers.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_history_ui.dart';

class GetTransfersCubit extends Cubit<void> {
  GetTransfersCubit({
    required this.address,
    required this.getTransfers,
    required this.appServiceLoaderCubit,
  })  : pagingController = PagingController(
          getNextPageKey: (final state) => state.nextIntPageKey,
          fetchPage: (i) => nextPage(
            address: address,
            getTransfers: getTransfers,
            appServiceLoaderCubit: appServiceLoaderCubit,
            pageKey: i,
          ),
        ),
        super(null);

  final String address;
  final GetTransfers getTransfers;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  final PagingController<int, TransferHistoryUI> pagingController;

  static Future<List<TransferHistoryUI>> nextPage({
    required final String address,
    required final GetTransfers getTransfers,
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required final int pageKey,
  }) =>
      getTransfers
          .call(GetTransfersParams(
            address: address,
            page: pageKey,
          ))
          .then(
            (final data) => data.items
                .map(
                  (item) => TransferHistoryUI(
                    amount: BalanceUtils.balance(
                      item.balance,
                      appServiceLoaderCubit.state.networkStateData.safeDecimals,
                    ),
                    blockDateTime: DateTime.fromMillisecondsSinceEpoch(
                      item.indexer.blockTime,
                    ),
                    fromAddress: item.from,
                    toAddress: item.to,
                    symbols: appServiceLoaderCubit
                            .state.networkStateData.tokenSymbol?.first ??
                        '?',
                    direction: item.from == address
                        ? TransferDirection.from
                        : TransferDirection.to,
                    extrisincStatus: null,
                    decimals: appServiceLoaderCubit
                        .state.networkStateData.safeDecimals,
                  ),
                )
                .toList(),
          );
}
