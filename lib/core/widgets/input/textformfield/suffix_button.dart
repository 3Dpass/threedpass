part of 'textformfield.dart';

@Deprecated('This code smells...')
class _SuffixButton {
  const _SuffixButton({
    required this.labelButton,
    required this.suffixButton,
    required this.onLabelButtonPressed,
    required this.onSuffixButtonPressed,
  });

  final IconData? labelButton;
  final IconData? suffixButton;

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;

  Widget? build(final BuildContext context) {
    final colors = Theme.of(context).customColors;
    if (labelButton != null || suffixButton != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (labelButton != null)
            D3pIconButton(
              iconData: labelButton,
              onPressed: onLabelButtonPressed,
              iconColor: colors.themeOpposite,
              size: 20,
              emptyContraints: true,
            ),
          SizedBox(
            width: labelButton != null && suffixButton != null ? 16 : 0,
          ),
          if (suffixButton != null)
            D3pIconButton(
              iconData: suffixButton,
              onPressed: onSuffixButtonPressed,
              iconColor: colors.themeOpposite,
              size: 20,
              emptyContraints: true,
            ),
          const SizedBox(width: 8),
        ],
      );
    } else {
      return null;
    }
  }
}
