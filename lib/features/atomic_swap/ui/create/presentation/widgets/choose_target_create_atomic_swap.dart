part of '../create_swap_page.dart';

class _ChooseTarget extends StatelessWidget {
  const _ChooseTarget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Target account'),
        ToAddressTextField(
          toAddressController: BlocProvider.of<CreateAtomicSwapCubit>(context)
              .toAccountController,
        ),
      ],
    );
  }
}
