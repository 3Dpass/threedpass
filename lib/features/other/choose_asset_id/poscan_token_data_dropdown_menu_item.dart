import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanTokenDataDropdownMenuItem extends StatelessWidget {
  const PoscanTokenDataDropdownMenuItem(this.data, {super.key});

  final PoscanAssetData data;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).customTextStyles.d3pBodyMedium;
    final grey = medium.copyWith(color: D3pColors.disabled);

    return Text.rich(
      TextSpan(
        text: 'id:' + ' ',
        style: grey,
        children: [
          TextSpan(
            text: data.id.toString(),
            style: medium,
          ),
          TextSpan(
            text: ' ' + 'name:' + ' ',
            style: grey,
          ),
          // TextSpan(
          //   text: data.,
          //   style: medium,
          // ),
          TextSpan(
            text: ' ' + 'symbols:' + ' ',
            style: grey,
          ),
          // TextSpan(
          //   text: data.symbols,
          //   style: medium,
          // ),
        ],
      ),
    );
  }
}
