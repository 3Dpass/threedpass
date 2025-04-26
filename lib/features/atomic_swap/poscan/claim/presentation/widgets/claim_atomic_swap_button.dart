//ignore_for_file: prefer-match-file-name
part of '../claim_atomic_swap_page.dart';

class _ClaimAtomicSwapSubmitButton extends StatelessWidget {
  const _ClaimAtomicSwapSubmitButton({super.key});

  @override
  Widget build(final BuildContext context) => SomeFormSubmitWithErrorButton(
        extrinsicMixin: BlocProvider.of<ClaimAtomicSwapBloc>(context),
        isActive: true,
        unlocalizedError: '',
      );
}
