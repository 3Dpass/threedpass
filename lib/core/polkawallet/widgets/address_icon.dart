import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';

/// Fork of
/// https://github.com/polkawallet-io/ui/blob/ce62db0d9b5abab5ce3167f0d1976480a33304ff/lib/components/v3/addressIcon.dart#L59
class AddressIcon extends StatelessWidget {
  const AddressIcon(
    Key? key,
    this.address, {
    this.size,
    this.svg,
    this.tapToCopy = true,
    this.decoration,
  }) : super(key: key);

  final String? address;
  final String? svg;
  final double? size;
  final bool tapToCopy;
  final Decoration? decoration;
  final double defaultSize = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: size ?? defaultSize,
        height: size ?? defaultSize,
        decoration: decoration ??
            BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Theme.of(context).toggleableActiveColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular((size ?? defaultSize) / 2),
              ),
            ),
        child: svg == null
            ? Image.asset(
                'assets/wallet/polkadot_avatar.png',
              )
            : SvgPicture.string(svg!),
      ),
      onTap: tapToCopy && address != null
          ? () => copyAndNotify(
                textToCopy: address!,
                textToShow: 'address_copied_to_clipboard'.tr(),
              )
          : null,
    );
  }
}
