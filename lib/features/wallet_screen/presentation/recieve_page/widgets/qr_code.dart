part of '../recieve_page.dart';

class _QRCode extends StatelessWidget {
  const _QRCode(this.address);

  final String address;

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size.width - 16 * 6;
    return Container(
      height: size,
      alignment: Alignment.center,
      child: QrImageView(
        padding: EdgeInsets.zero,
        data: address,
        version: QrVersions.auto,
        size: size,
        foregroundColor: Theme.of(context).customColors.themeOpposite,
      ),
    );
  }
}
