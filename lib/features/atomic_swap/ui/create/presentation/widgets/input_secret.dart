part of '../create_swap_page.dart';

class _InputSecret extends StatelessWidget {
  const _InputSecret();

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('input_secret_create_atomic_swap'),
        const H4(),
        D3pTextFormField(
          controller: BlocProvider.of<CreateAtomicSwapCubit>(context)
              .secretInputController,
          onChanged: (final _) =>
              BlocProvider.of<CreateAtomicSwapCubit>(context).updateSecret(),
        ),
        const H4(),
        const Text('Hashed proof (blake2b_256):'),
        BlocBuilder<CreateAtomicSwapCubit, CreateAtomicSwapState>(
          builder: (final context, final state) =>
              Text(state.hashedProof ?? '?'), // TODO make copy card button
          buildWhen: (previous, current) =>
              previous.hashedProof != current.hashedProof,
        ),
      ],
    );
  }
}
