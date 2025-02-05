import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashlib/hashlib.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/atomic_swap/ui/create/bloc/create_swap_cubit.dart';

class InputSecretCreateAtomicSwap extends StatefulWidget {
  const InputSecretCreateAtomicSwap({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<InputSecretCreateAtomicSwap> {
  String? hashedProof;

  late final TextEditingController
      textController; // remote this. Use  BlocProvider.of<CreateAtomicSwapCubit>(context) right in the build function. use text arg in onTextFieldChanged

  @override
  void initState() {
    textController =
        BlocProvider.of<CreateAtomicSwapCubit>(context).secretInputController;
    super.initState();
  }

  void onTextFieldChanged(final String? _) {
    setState(() {
      hashedProof = blake2b256.string(textController.text).hex();
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('input_secret_create_atomic_swap'),
        const H4(),
        D3pTextFormField(
          controller: textController,
          onChanged: onTextFieldChanged,
        ),
        const H4(),
        const Text('Hashed proof (blake2b_256):'),
        Text(hashedProof ?? '?'),
      ],
    );
  }
}
