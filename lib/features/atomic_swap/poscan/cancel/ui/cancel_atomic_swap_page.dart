import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/bloc/cancel_poscan_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/ui/hash_proof_text.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/ui/widgets/poscan_atomic_swap_action.dart';
import 'package:threedpass/features/common/choose_account/presentation/choose_native_keypair.dart';
import 'package:threedpass/features/common/some_form/some_form.dart';
import 'package:threedpass/features/common/some_form/some_form_submit_with_error.dart';

part 'widgets/cancel_poscan_atomic_swap_button.dart';

class CancelAtomicSwapPage extends StatelessWidget {
  const CancelAtomicSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final cancelPASBloc = BlocProvider.of<CancelPoscanAtomicSwapBloc>(context);
    final swap = cancelPASBloc.pendingSwap;
    return SomeForm(
      formKey: cancelPASBloc.formKey,
      appbarTitle: 'cancel_poscan_atomic_swap_page_title',
      children: [
        ChooseNativeKeypair(
          value: cancelPASBloc.accountToSignExtrinsic,
          onSelected: null, //cancelPASBloc.onAccountSelected,
          passwordController: cancelPASBloc.passwordController,
        ),
      ],
      afterForm: [
        FastRichText(
          mainText: 'Target:',
          needSpace: true,
          secondaryText: swap.to,
        ),
        HashProofText(swap: swap),
        PoscanAtomicSwapAction(
          action: swap.action,
        ),
      ],
      submitButton: const PH16(
        child: _CancelPoscanAtomicSwapSubmitButton(),
      ),
      horizontalPadding: 16,
    );
  }
}
