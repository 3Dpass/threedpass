part of 'textformfield.dart';

class _Label {
  const _Label(this.labelText);

  final String? labelText;

  Widget? build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;

    if (labelText == null) return null;

    return Text(
      labelText!,
      style: textStyles.d3pBodyMedium,
    );
  }
}
