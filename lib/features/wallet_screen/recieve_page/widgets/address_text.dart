part of '../recieve_page.dart';

class _AddressText extends StatelessWidget {
  const _AddressText(this.address);

  final String address;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      child: D3pBodyMediumText(
        address,
        translate: false,
      ),
    );
  }
}
