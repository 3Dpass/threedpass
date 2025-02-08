part of '../create_swap_page.dart';

class _InputSecret extends StatefulWidget {
  const _InputSecret();

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<_InputSecret> {
  String? hashedProof;

  void onTextFieldChanged(final String? text) {
    if (text != null) {
      setState(() {
        hashedProof = blake2b256.string(text).hex();
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('input_secret_create_atomic_swap'),
        const H4(),
        D3pTextFormField(
          controller: BlocProvider.of<CreateAtomicSwapCubit>(context)
              .secretInputController,
          onChanged: onTextFieldChanged,
        ),
        const H4(),
        const Text('Hashed proof (blake2b_256):'),
        Text(hashedProof ?? '?'),
      ],
    );
  }
}
