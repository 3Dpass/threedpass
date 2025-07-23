import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/setup.dart';

class PendingAtomicSwapPage extends StatelessWidget {
  const PendingAtomicSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: D3pElevatedButton(
          text: 'dsa',
          isInfinityWidth: false,
          onPressed: () => getIt<PoscanAtomicSwapRepository>().pendingSwaps(
            address:
                getIt<AppServiceLoaderCubit>().state.keyring.current.pubKey ??
                    '',
          ),
        ),
      ),
    );
  }
}
