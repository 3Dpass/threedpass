part of '../create_swap_page.dart';

class _ChooseDeadline extends StatelessWidget {
  const _ChooseDeadline();

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Text('Expiration date and time:'), // TODO Localize
        Flexible(
          child: D3pDatetimePicker(),
        ),
      ],
    );
  }
}
