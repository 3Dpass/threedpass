part of 'textformfield.dart';

class _Label {
  const _Label(this.labelText);

  final String? labelText;

  Widget? build(final BuildContext context) {
    if (labelText == null) return null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(labelText!),
    );
  }
}
