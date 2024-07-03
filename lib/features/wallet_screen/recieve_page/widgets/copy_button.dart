part of '../recieve_page.dart';

class _CopyButton extends StatelessWidget {
  const _CopyButton(this.textToCopy);

  final String textToCopy;

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: D3pElevatedButton(
        text: 'Copy'.tr(),
        iconData: Icons.copy,
        // minimumSize: const Size(120, 50),
        onPressed: () => copyAndNotify(textToCopy: textToCopy),
      ),
    );
  }
}
