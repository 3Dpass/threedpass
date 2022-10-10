part of '../assets_page.dart';

class _ButtonsPanel extends StatelessWidget {
  const _ButtonsPanel();

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        SizedBox(width: 16),
        Flexible(
          child: TransferButton(),
        ),
        SizedBox(width: 8),
        Flexible(
          child: RecieveButton(),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
