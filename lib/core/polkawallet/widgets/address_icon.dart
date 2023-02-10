import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

/// Fork of
/// https://github.com/polkawallet-io/ui/blob/ce62db0d9b5abab5ce3167f0d1976480a33304ff/lib/components/v3/addressIcon.dart#L59
class AddressIcon extends StatelessWidget {
  const AddressIcon(
    this.address, {
    final Key? key,
    this.size,
    this.svg,
    this.decoration,
  }) : super(key: key);

  final String? address;
  final String? svg;
  final double? size;
  final Decoration? decoration;
  static const double defaultSize = 32;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: size ?? defaultSize,
      height: size ?? defaultSize,
      decoration: decoration ??
          BoxDecoration(
            color: theme.customColors.addressIconBackground,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
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
    );
  }
}
