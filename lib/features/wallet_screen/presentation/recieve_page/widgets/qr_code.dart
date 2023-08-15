part of '../recieve_page.dart';

class _QRCode extends StatelessWidget {
  const _QRCode(this.address);

  final String address;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width - 16 * 2,
      alignment: Alignment.center,
      child: QrImageView(
        padding: EdgeInsets.zero,
        data: address,
        version: QrVersions.auto,
        size: MediaQuery.of(context).size.width - 16 * 2,
        foregroundColor: Theme.of(context).customColors.themeOpposite,
      ),
    );
  }
}
