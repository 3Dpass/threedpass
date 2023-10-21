part of 'textformfield.dart';

class _SuffixButton {
  const _SuffixButton({
    required this.labelButton,
    required this.suffixButton,
    required this.onLabelButtonPressed,
    required this.onSuffixButtonPressed,
  });

  final Widget? labelButton;
  final Widget? suffixButton;

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;

  Widget? build(final BuildContext context) {
    return labelButton != null || suffixButton != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              labelButton != null
                  ? SizedBox(
                      height: 40,
                      width: 50,
                      child: PlatformTextButton(
                        padding: EdgeInsets.zero,
                        onPressed: onLabelButtonPressed ?? emptyFunction,
                        child: labelButton,
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: labelButton != null && suffixButton != null ? 8 : 0,
              ),
              suffixButton != null
                  ? SizedBox(
                      height: 40,
                      width: 50,
                      child: PlatformTextButton(
                        padding: EdgeInsets.zero,
                        onPressed: onSuffixButtonPressed ?? emptyFunction,
                        child: suffixButton,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 4),
            ],
          )
        : null;
  }
}
