//ignore_for_file: prefer-match-file-name
part of '../claim_atomic_swap_page.dart';

class _ClaimAtomicSwapSubmitButton extends StatelessWidget {
  const _ClaimAtomicSwapSubmitButton();

  @override
  Widget build(final BuildContext context) => SomeFormSubmitWithErrorButton(
        extrinsicMixin: BlocProvider.of<ClaimPoscanAtomicSwapBloc>(context),
        isActive: true,
        unlocalizedError: '',
      );
}
