part of 'textformfield.dart';

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
    return labelButton != null || suffixButton != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (labelButton != null)
                D3pIconButton(
                  emptyContraints: true,
                  iconData: labelButton!,
                  size: 20,
                  onPressed: onLabelButtonPressed,
                  iconColor: colors.themeOpposite,
                ),
              SizedBox(
                width: labelButton != null && suffixButton != null ? 16 : 0,
              ),
              if (suffixButton != null)
                D3pIconButton(
                  emptyContraints: true,
                  iconData: suffixButton!,
                  size: 20,
                  onPressed: onSuffixButtonPressed,
                  iconColor: colors.themeOpposite,
                ),
              const SizedBox(width: 8),
            ],
          )
        : null;
  }
}
