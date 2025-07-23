part of '../create_swap_page.dart';

class _CreateSwapSubmitButton extends StatelessWidget {
  const _CreateSwapSubmitButton();

  @override
  Widget build(final BuildContext context) => SomeFormSubmitWithErrorButton(
        extrinsicMixin: BlocProvider.of<CreateAtomicSwapCubit>(context),
        isActive: true,
        unlocalizedError: '',
      );
}
