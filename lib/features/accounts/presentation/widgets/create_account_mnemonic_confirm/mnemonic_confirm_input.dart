import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';
import 'package:threedpass/features/accounts/presentation/widgets/mnemonic_text_field.dart';

class MnemonicConfirmInput extends StatelessWidget {
  const MnemonicConfirmInput({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<MnemonicInputCubit, MnemonicInputState>(
      builder: (final context, final state) => Column(
        children: [
          MnemonicTextField(text: state.result),
          const SizedBox(height: 12),
          _MnemonicGrid(state),
        ],
      ),
    );
  }
}

class _MnemonicGrid extends StatelessWidget {
  final MnemonicInputState state;
  const _MnemonicGrid(this.state);

  @override
  Widget build(final BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        state.words.length,
        (final index) =>
            // ConstrainedBox(
            //   constraints: BoxConstraints.loose(const Size(100, 50)),
            //   child:
            D3pElevatedButton(
          isInfinityWidth: false,
          text: state.words[index],
          onPressed: () =>
              BlocProvider.of<MnemonicInputCubit>(context).onWordPressed(index),
        ),
      ),
      // ),
    );
  }
}
