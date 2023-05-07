import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/copy_button.dart';

class ShortAddress extends StatelessWidget {
  const ShortAddress({
    required this.prefix,
    required this.address,
    required this.colorSecondary,
    super.key,
  });

  final String? address;
  final String prefix;
  final bool colorSecondary;

  @override
  Widget build(final BuildContext context) {
    final addressStr = Fmt.shorterAddress(address, pad: 10);
    final styles = Theme.of(context).customTextStyles;
    return Row(
      children: [
        Flexible(
          child: Text(
            '$prefix $addressStr',
            style: colorSecondary ? styles.secondaryText : styles.d3pBodyMedium,
          ),
        ),
        colorSecondary ? const SizedBox() : CopyButton(address),
      ],
    );
  }
}
