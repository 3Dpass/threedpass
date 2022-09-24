part of '../recieve_page.dart';

class _CopyButton extends StatelessWidget {
  const _CopyButton(this.textToCopy);

  final String textToCopy;

  @override
  Widget build(BuildContext context) {
    return D3pElevatedButton(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      text: 'Copy'.tr(),
      iconData: Icons.copy,
      minimumSize: const Size(120, 50),
      onPressed: () => copyAndNotify(textToCopy: textToCopy),
    );
  }
}
