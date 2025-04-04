part of '../create_swap_page.dart';

class _WarningCheckbox extends StatelessWidget {
  const _WarningCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return D3pSwitchFormField(
      localizationKey: "i_saved_secret_atomic_swap",
    );
  }
}
