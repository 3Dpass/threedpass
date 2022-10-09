part of '../recieve_page.dart';

class _QRCode extends StatelessWidget {
  const _QRCode(this.address);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width - 16 * 2,
      alignment: Alignment.center,
      child: QrImage(
        padding: EdgeInsets.zero,
        data: address,
        version: QrVersions.auto,
        size: MediaQuery.of(context).size.width - 16 * 2,
      ),
    );
  }
}
