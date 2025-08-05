import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanTokenDataDropdownMenuItem extends StatelessWidget {
  const PoscanTokenDataDropdownMenuItem({
    required this.data,
    required this.metadata,
    super.key,
  });

  final PoscanAssetData data;
  final PoscanAssetMetadata? metadata;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    final grey = Theme.of(context).customTextStyles.fadedBodyMedium;

    return Text.rich(
      TextSpan(
        text: 'id:' + ' ',
        style: grey,
        children: [
          TextSpan(
            text: data.id.toString(),
            style: medium,
          ),
          // TextSpan(
          //   text: ' ' + 'name:' + ' ',
          //   style: grey,
          // ),
          // // TextSpan(
          // //   text: data.,
          // //   style: medium,
          // // ),
          // TextSpan(
          //   text: ' ' + 'symbol:' + ' ',
          //   style: grey,
          // ),
          // TextSpan(
          //   text: data.symbols,
          //   style: medium,
          // ),
        ],
      ),
    );
  }
}
