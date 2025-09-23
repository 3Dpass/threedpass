//ignore_for_file: prefer-match-file-name
part of '../cancel_atomic_swap_page.dart';

class _CancelPoscanAtomicSwapSubmitButton extends StatelessWidget {
  const _CancelPoscanAtomicSwapSubmitButton();

  @override
  Widget build(final BuildContext context) => SomeFormSubmitWithErrorButton(
        extrinsicMixin: BlocProvider.of<CancelPoscanAtomicSwapBloc>(context),
        isActive: true,
        unlocalizedError: '',
      );
}
