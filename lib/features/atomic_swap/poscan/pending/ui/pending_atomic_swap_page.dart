import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/domain/entities/current_account.dart';
import 'package:threedpass/core/chains/ui/when_address.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/list_extensions.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_atomic_swap_state_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/ui/widgets/pending_swap_card.dart';

part './widgets/pending_swap_cards_list.dart';

class PendingAtomicSwapPage extends StatelessWidget {
  const PendingAtomicSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: 'pending_swaps_page_title',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _PendingSwapsCardsList(),
        ),
      ),
    );
  }
}
