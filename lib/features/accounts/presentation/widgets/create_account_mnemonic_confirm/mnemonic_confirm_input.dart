import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              state.words.length,
              (final index) => ElevatedButton(
                onPressed: () => BlocProvider.of<MnemonicInputCubit>(context)
                    .onWordPressed(index),
                child: Text(
                  state.words[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
