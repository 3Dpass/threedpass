part of '../create_swap_page.dart';

class _InputSecret extends StatelessWidget {
  const _InputSecret();

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('input_secret_create_atomic_swap'.tr()),
        const H4(),
        D3pTextFormField(
          // TODO Make it obscurable like password
          controller: BlocProvider.of<CreateAtomicSwapCubit>(context)
              .secretInputController,
          onChanged: (final _) =>
              BlocProvider.of<CreateAtomicSwapCubit>(context).updateSecret(),
          validator: Validators.notEmpty,
        ),
        const H8(),
        Text('input_secret_create_atomic_swap_result'.tr()),
        const H4(),
        BlocBuilder<CreateAtomicSwapCubit, CreateAtomicSwapState>(
          builder: (final context, final state) => ClickableCard(
            child: Row(
              children: [
                Expanded(
                  child: Text(state.hashedProof ?? '?'),
                ),
                W8(),
                Icon(Icons.copy),
              ],
            ),
            onTap: () => copyAndNotify(
              textToCopy: state.hashedProof ?? '?',
            ),
          ),
          buildWhen: (previous, current) =>
              previous.hashedProof != current.hashedProof,
        ),
      ],
    );
  }
}
