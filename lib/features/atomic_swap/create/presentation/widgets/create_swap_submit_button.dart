part of '../create_swap_page.dart';

class _CreateSwapSubmitButton extends StatelessWidget {
  const _CreateSwapSubmitButton({super.key});

  @override
  Widget build(final BuildContext context) => SomeFormSubmitWithErrorButton(
        extrinsicMixin: BlocProvider.of<CreateAtomicSwapCubit>(context),
        isActive: true,
        unlocalizedError: '',
      );
}
