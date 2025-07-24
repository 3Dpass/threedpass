import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/decode_address.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/fast_separated_listview.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_atomic_swap_state_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
import 'package:threedpass/features/other/accounts_identity/account_idenity.dart';
import 'package:threedpass/setup.dart';

part './widgets/pending_swap_cards_list.dart';
part './widgets/pending_swap_card.dart';

class PendingAtomicSwapPage extends StatelessWidget {
  const PendingAtomicSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: 'pending_swaps_page_title',
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final state = getIt<AppServiceLoaderCubit>().state;
              final address = state.keyring.current.address;
              final decoded = await state.decodeAddress(address!);
              print(decoded);
            },
            // getIt<PoscanAtomicSwapRepository>().pendingSwaps(address: ''),
            child: Text('dsa')),
      ),
      //  SingleChildScrollView(
      //   child: _PendingSwapsCardsList(),
      // ),
    );
  }
}
