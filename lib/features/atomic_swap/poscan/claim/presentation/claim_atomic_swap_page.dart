import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/bloc/claim_atomic_swap_bloc.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_with_error.dart';

part 'widgets/claim_atomic_swap_button.dart';

class ClaimAtomicSwapPage extends StatelessWidget {
  const ClaimAtomicSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<ClaimAtomicSwapBloc>(context).formKey,
      appbarTitle: 'claim_atomic_swap_page_title',
      children: [
        // INPUT BYTES
      ],
      submitButton: const Padding16(
        child: _ClaimAtomicSwapSubmitButton(),
      ),
      horizontalPadding: 0,
    );
  }
}
