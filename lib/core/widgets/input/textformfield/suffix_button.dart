part of 'textformfield.dart';

class _SuffixButton {
  const _SuffixButton({
    required this.labelButton,
    required this.suffixButton,
    required this.onLabelButtonPressed,
    required this.onSuffixButtonPressed,
  });

  final String? labelButton;
  final String? suffixButton;

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;

  Widget? build(final BuildContext context) {
    return labelButton != null || suffixButton != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              labelButton != null
                  ? SizedBox(
                      width: 60,
                      child: PlatformTextButton(
                        padding: EdgeInsets.zero,
                        onPressed: onLabelButtonPressed ?? emptyFunction,
                        child: Text(labelButton!),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: labelButton != null && suffixButton != null ? 8 : 0,
              ),
              suffixButton != null
                  ? SizedBox(
                      width: 60,
                      child: PlatformTextButton(
                        padding: EdgeInsets.zero,
                        onPressed: onSuffixButtonPressed ?? emptyFunction,
                        child: Text(suffixButton!),
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        : null;
  }
}
