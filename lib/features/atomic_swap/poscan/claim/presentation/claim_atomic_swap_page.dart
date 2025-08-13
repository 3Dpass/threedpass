import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/bloc/claim_poscan_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/ui/hash_proof_text.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/ui/widgets/poscan_atomic_swap_action.dart';
import 'package:threedpass/features/common/choose_account/presentation/choose_native_keypair.dart';
import 'package:threedpass/features/common/some_form/some_form.dart';
import 'package:threedpass/features/common/some_form/some_form_submit_with_error.dart';

part 'widgets/claim_atomic_swap_button.dart';

class ClaimAtomicSwapPage extends StatelessWidget {
  const ClaimAtomicSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final claimPoscanBloc =
        BlocProvider.of<ClaimPoscanAtomicSwapCubit>(context);
    final swap = claimPoscanBloc.pendingSwap;

    return SomeForm(
      formKey: claimPoscanBloc.formKey,
      appbarTitle: 'claim_poscan_atomic_swap_page_title',
      children: [
        ChooseNativeKeypair(
          value: claimPoscanBloc.accountToSignExtrinsic,
          onSelected: null,
          pAccounts: [claimPoscanBloc.accountToSignExtrinsic],
          passwordController: claimPoscanBloc.passwordController,
        ),
        D3pTextFormField(
          labelText: 'Secret',
          hintText: 'Enter swap secret',
          controller: claimPoscanBloc.secretController,
          makeLabelOutside: true,
          validator: Validators.notEmpty,
        ),
      ],
      afterForm: [
        HashProofText(swap: swap),
        PoscanAtomicSwapAction(
          action: swap.action,
        ),
      ],
      submitButton: const PH16(
        child: _ClaimAtomicSwapSubmitButton(),
      ),
      horizontalPadding: 16,
    );
  }
}
